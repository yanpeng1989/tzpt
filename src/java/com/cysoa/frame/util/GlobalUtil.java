/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.util;

import com.cysoa.frame.beans.FrameServiceBean;
import com.cysoa.frame.beans.DBTableBean;
import com.cysoa.frame.beans.StTableParamet;
import com.cysoa.frame.service.impl.FrameService;
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

    /*
     * 获取唯一标识
     */
    public static String getUniqueNumber() {
        return String.valueOf(System.currentTimeMillis() + String.valueOf((int) (Math.random() * 10)) + String.valueOf((int) (Math.random() * 10)) + String.valueOf((int) (Math.random() * 10)));
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
}
