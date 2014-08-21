/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.listener;

import com.cysoa.frame.beans.MapFactory;
import com.cysoa.frame.service.FrameServiceImpl;
import com.cysoa.frame.util.GlobalUtil;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.Set;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.apache.log4j.Logger;
import org.json.JSONException;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 *
 * @author cyss210
 */
@Component
public class FrameContextListener implements ServletContextListener {

    private static Logger log = Logger.getLogger(FrameContextListener.class);

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        log.info("tomcat启动 frame监听开始加载所需信息");
        //保存spring容器
        GlobalUtil.webRootPath = sce.getServletContext().getRealPath(GlobalUtil.webRootPath);
        log.info("web root path===>" + GlobalUtil.webRootPath);
        GlobalUtil.webSpringContext = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
        GlobalUtil.frameService = (FrameServiceImpl) GlobalUtil.webSpringContext.getBean("frameServiceImpl");
        //读取system.properties
        InputStream is = sce.getServletContext().getResourceAsStream(GlobalUtil.sysConfigPath);
        Properties pro = new Properties();
        try {
            pro.load(is);
            for (Object key : pro.keySet()) {
                String _key = key.toString();
                String value = pro.getProperty(_key);
                GlobalUtil.sysConfig.put(_key, value);
            }
        } catch (IOException ex) {
            String exMsg = "加载system.properties失败";
            log.error(exMsg, ex);
        }

        if (GlobalUtil.sysConfig.containsKey("db_type")) {
            GlobalUtil.DB_TYPE = GlobalUtil.sysConfig.get("db_type");
        }

        if (GlobalUtil.DB_TYPE.startsWith("mysql")) {
            GlobalUtil.DB_IFNULL = "ifnull";
        } else if (GlobalUtil.DB_TYPE.startsWith("oracle")) {
            GlobalUtil.DB_IFNULL = "nvl";
        } else if (GlobalUtil.DB_TYPE.startsWith("sqlserver")) {
            GlobalUtil.DB_IFNULL = "isnull";
        }
        //读取sql文件
        Set<String> sqlFiles = sce.getServletContext().getResourcePaths(GlobalUtil.sqlFileDir);
        for (String path : sqlFiles) {
            try {
                pro.load(sce.getServletContext().getResourceAsStream(path));
                for (Object key : pro.keySet()) {
                    String _key = key.toString();
                    String value = pro.getProperty(_key);
                    GlobalUtil.allSqls.put(_key, value);
                }
            } catch (IOException ex) {
                log.error("加载sql失败文件名：" + path, ex);
            }
        }

        constructJsonConfig(sce, GlobalUtil.sysJspPath);

        //加载所有page services
        is = sce.getServletContext().getResourceAsStream(GlobalUtil.pageServicePath);
        pro = new Properties();
        try {
            pro.load(is);
            for (Object key : pro.keySet()) {
                String _key = key.toString();
                String value = pro.getProperty(_key);
                GlobalUtil.allPageServices.put(_key, value.split(","));
            }
        } catch (IOException ex) {
            String exMsg = "加载pageService.properties失败";
            log.error(exMsg, ex);
        }


        //连接数据库,并加载数据库中系统信息
        //加载Service
        GlobalUtil.frameService.initService();
        //加载error msg
        GlobalUtil.frameService.initErrorMsg();
        //加载表结构
        GlobalUtil.frameService.initDBTables();

        GlobalUtil.frameService.initTablePara();

        if ("0".equals(GlobalUtil.getSysConfig("sms_init_flag"))) {
            GlobalUtil.frameService.initSMS();
            GlobalUtil.frameService.initSMSCompany();
        }

        GlobalUtil.uploadPath = GlobalUtil.webRootPath + GlobalUtil.getSysConfig("fileupload_path");
        File uploadDir = new File(GlobalUtil.uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }

    private void constructJsonConfig(ServletContextEvent sce, String path) {
        String rootPath = sce.getServletContext().getRealPath(path);
        File dir = new File(rootPath);
        File[] files = dir.listFiles();
        if (files.length > 0) {
            for (File file : files) {
                String _path = path + File.separator + file.getName();
                if (file.isDirectory()) {
                    constructJsonConfig(sce, _path);
                } else if (file.getName().toLowerCase().endsWith(".json")) {
                    log.info("加载json文件" + _path.substring(GlobalUtil.sysJspPath.length()));
                    FileInputStream fis = null;
                    try {
                        fis = new FileInputStream(file);
                        int i = 0;
                        String json = "";
                        byte[] bt = new byte[1024];
                        while ((i = fis.read(bt)) != -1) {
                            json += new String(bt, 0, i);
                        }
                        GlobalUtil.allJsonConfig.put(_path.substring(GlobalUtil.sysJspPath.length()), MapFactory.toMap(json));
                    } catch (FileNotFoundException ex) {
                        log.warn("json文件[" + file.getAbsolutePath() + "]未找到", ex);
                    } catch (IOException ex) {
                        log.warn("json文件[" + file.getAbsolutePath() + "]读取错误", ex);
                    } catch (JSONException ex) {
                        log.warn("json文件[" + file.getAbsolutePath() + "]构造错误", ex);
                    } finally {
                        if (fis != null) {
                            try {
                                fis.close();
                            } catch (IOException ex) {
                            }
                        }
                    }
                }
            }
        }
    }
}
