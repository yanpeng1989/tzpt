/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.util;

import com.cysoa.frame.beans.FrameServiceBean;
import com.cysoa.frame.beans.DBTableBean;
import com.cysoa.frame.beans.StTableParamet;
import com.cysoa.frame.service.impl.FrameService;
import com.cyss.emay.util.Client;
import com.cyss.emay.util.EmayClientFactory;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;

/**
 *
 * @author cyss210
 */
public class GlobalUtil {

    private static Logger log = Logger.getLogger(GlobalUtil.class);
    public static String webRootPath = "/";
    public static String uploadPath = "upload";
    public static final String sysConfigPath = "/WEB-INF/system.properties";
    public static final String pageServicePath = "/WEB-INF/pageService.properties";
    public static final String sysJspPath = "/WEB-INF/jsp";
    public static Map<String, String> sysConfig = new HashMap<String, String>();
    public static final String sqlFileDir = "/WEB-INF/sql";
    public static final String session_tag = "user_info";
    public static final String login_tag = "username";
    public static final String validate_code_tag = "check_num";
    public static Map<String, String> allSqls = new HashMap<String, String>();
    public static Map<String, FrameServiceBean> allServices = new HashMap<String, FrameServiceBean>();
    public static Map<String, String> allErrorMsg = new HashMap<String, String>();
    public static Map<String, Map> allJsonConfig = new HashMap<String, Map>();
    public static Map<String, String[]> allPageServices = new HashMap<String, String[]>();
    public static Map<String, DBTableBean> dbTables = new HashMap<String, DBTableBean>();
    public static Map<String, List<StTableParamet>> allStTableParamet = new HashMap<String, List<StTableParamet>>();
    public static final String AUTO_PAGE_TAG = "_auto_args";
    public static String DB_TYPE = "mysql";
    public static String DB_IFNULL = "ifnull";
    public static WebApplicationContext webSpringContext;
    public static FrameService frameService;
    //生成唯一标识所用参数
    private static long tmpID = 0;
    private static boolean tmpIDlocked = false;

    /*
     * 获取唯一标识
     */
    public static String getUniqueNumber() {
        long ltime = 0;
        while (true) {
            if (tmpIDlocked == false) {
                tmpIDlocked = true;
                ltime = System.currentTimeMillis();
                if (tmpID < ltime) {
                    tmpID = ltime;
                } else {
                    tmpID = tmpID + 1;
                    ltime = tmpID;
                }
                tmpIDlocked = false;
                return String.valueOf(ltime);
            }
        }
    }

    /**
     * 获取system.properties文件中属性
     *
     * @param key
     * @return
     */
    public static String getSysConfig(String key) {
        if (sysConfig.containsKey(key)) {
            return sysConfig.get(key);
        }
        return null;
    }

    /**
     * 获取st_table_paramet中的值
     *
     * @param tableCol 例：test.tt(table_name.col_name)
     * @param colValue 例：0 (col_value)
     * @return value_desc
     */
    public static String getTableParamet(String tableCol, String colValue) {
        if (allStTableParamet.containsKey(tableCol)) {
            List<StTableParamet> list = allStTableParamet.get(tableCol);
            for (StTableParamet st : list) {
                if (st.getColValue().equals(colValue)) {
                    return st.getValueDesc();
                }
            }
            return null;
        } else {
            return null;
        }
    }

    /**
     * 获取亿美软通短信客户端
     *
     * @return
     */
    public static Client getEmayClient() {
        return EmayClientFactory.getClient(GlobalUtil.getSysConfig("sms_serial"),
                GlobalUtil.getSysConfig("sms_key"), GlobalUtil.getSysConfig("sms_wsdl"));
    }

    public static void saveFile(File f, InputStream is) throws Exception {
        byte[] bt = new byte[1024 * 10];
        int i = 0;
        FileOutputStream fos = new FileOutputStream(f);
        while ((i = is.read(bt)) != -1) {
            fos.write(bt, 0, i);
        }
        fos.close();
        is.close();
    }

    public static void saveFile(String path, String name, InputStream is) throws Exception {
        File f = new File(path, name);
        byte[] bt = new byte[1024 * 10];
        int i = 0;
        FileOutputStream fos = new FileOutputStream(f);
        while ((i = is.read(bt)) != -1) {
            fos.write(bt, 0, i);
        }
        fos.close();
        is.close();
    }

    public static void saveFile(String name, InputStream is) throws Exception {
        saveFile(uploadPath, name, is);
    }

    public static void saveFile(String path, String name, byte[] bt) throws Exception {
        ByteArrayInputStream bais = new ByteArrayInputStream(bt);
        saveFile(name, path, bais);
    }

    public static void saveFile(String name, byte[] bt) throws Exception {
        saveFile(uploadPath, name, bt);
    }

    public static void saveFile(String path, String child, String name, InputStream is) throws Exception {
        String _path = path + child;
        File f = new File(_path);
        if (!f.exists()) {
            f.mkdirs();
        }
        saveFile(new File(_path + File.separator + name), is);
    }
}
