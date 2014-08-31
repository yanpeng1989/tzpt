/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.service;

import com.cysoa.frame.beans.DBTableBean;
import com.cysoa.frame.beans.FrameServiceBean;
import com.cysoa.frame.beans.StTableParamet;
import com.cysoa.frame.service.impl.FrameService;
import com.cysoa.frame.util.GlobalUtil;
import com.cyss.emay.util.Client;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

/**
 *
 * @author cyss210
 */
@org.springframework.stereotype.Service
public class FrameServiceImpl extends UniversalService implements FrameService {

    private static Logger log = Logger.getLogger(FrameServiceImpl.class);
    private static final String initServiceSql = "select * from st_service_bean";
    private static final String initErrorMsgSql = "select * from st_err_msg";
    private static final String initMySqlTableSql = "select table_name from information_schema.tables where table_schema=?";
    private static final String initMySqlColSql = "select column_name, column_comment, column_type, is_nullable, column_key from information_schema.columns where table_schema=? and table_name=?";
    private static final String initTabliParam = "select * from st_table_paramet";

    @Override
    public void initService() {
        List<Map<String, Object>> list = getJdbcTemplate().queryForList(initServiceSql);
        for (Map<String, Object> map : list) {
            String beanName = map.get("bean_name").toString();
            String code = map.get("service_code").toString();
            try {
                FrameServiceBean service = new FrameServiceBean();
                service.setServiceCode(code);
                service.setBeanName(beanName);
                service.setChannel(map.get("source_channel").toString());
                service.setIsLogin(map.get("is_login").toString());
                service.setDesc(map.get("service_desc").toString());
                service.setService((UniversalService) GlobalUtil.webSpringContext.getBean(beanName));
                GlobalUtil.allServices.put(code, service);
            } catch (Exception ex) {
                log.warn("加载服务失败--->" + code, ex);
            }
        }
    }

    @Override
    public void initTablePara() {
        List<Map<String, Object>> list = getJdbcTemplate().queryForList(initTabliParam);
        for (Map<String, Object> map : list) {
            String tableName = map.get("table_name").toString();
            String colName = map.get("col_name").toString();
            String colValue = map.get("col_value").toString();
            String col_desc = map.get("col_desc").toString();
            String valueDesc = map.get("value_desc").toString();
            String key = tableName + "." + colName;
            StTableParamet bean = new StTableParamet(tableName, colName, colValue, col_desc, valueDesc);
            if (GlobalUtil.allStTableParamet.containsKey(key)) {
                List<StTableParamet> valList = GlobalUtil.allStTableParamet.get(key);
                valList.add(bean);
            } else {
                List<StTableParamet> valList = new ArrayList<StTableParamet>();
                valList.add(bean);
                GlobalUtil.allStTableParamet.put(key, valList);
            }
        }
    }

    @Override
    public void initErrorMsg() {
        List<Map<String, Object>> list = getJdbcTemplate().queryForList(initErrorMsgSql);
        for (Map<String, Object> map : list) {
            GlobalUtil.allErrorMsg.put(map.get("err_code").toString(), map.get("err_msg").toString());
        }
    }

    @Override
    public void initDBTables() {
        List<Map<String, Object>> tables = null;
        String tableSql = null;
        String colSql = null;
        String dbName = GlobalUtil.getSysConfig("db_name");
        if (GlobalUtil.DB_TYPE.startsWith("mysql")) {
            tableSql = initMySqlTableSql;
            colSql = initMySqlColSql;
        } else if (GlobalUtil.DB_TYPE.startsWith("oracle")) {
        } else if (GlobalUtil.DB_TYPE.startsWith("sqlserver")) {
        }
        tables = getJdbcTemplate().queryForList(tableSql, dbName);
        for (Map table : tables) {
            DBTableBean bean = new DBTableBean();
            String tableName = table.get("table_name").toString().toLowerCase();
            List<Map<String, Object>> cols = getJdbcTemplate().queryForList(colSql, dbName, tableName);
            for (Map col : cols) {
                String colName = col.get("column_name").toString().toLowerCase();
                String colComment = col.get("column_comment").toString().toLowerCase();
                String colType = col.get("column_type").toString().toLowerCase();
                String colNull = col.get("is_nullable").toString().toLowerCase();
                String colKey = col.get("column_key").toString().toLowerCase();
                boolean isNull = "no".equals(colNull) ? false : true;
                boolean isKey = "pri".equals(colKey) ? true : false;
                bean.addColumn(colName, colComment, colType, isNull, isKey);
            }
            GlobalUtil.dbTables.put(tableName, bean);
        }
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) {
    }

    @Override
    public void initSMS() {
//        Client client = EmayFactory.getEmayClient();
//        int code = client.registEx(GlobalUtil.getSysConfig("sms_pwd"));
//        if (code != 0) {
//            log.error("调用注册序列号接口异常,异常码：" + code);
//        } else {
//            log.info("调用注册序列号接口成功");
//        }

        try {
            int code = GlobalUtil.getEmayClient().registEx(GlobalUtil.getSysConfig("sms_pwd"));
            if (code != 0) {
                log.error("调用注册序列号接口异常,异常码：" + code);
            } else {
                log.info("调用注册序列号接口成功");
            }
        } catch (Exception ex) {
            log.error("调用注册序列号接口异常", ex);
        }
    }

    @Override
    public void initSMSCompany() {
//        SDKService service = new SDKService();
//        SDKClient client = service.getSDKService();
//        int code = client.registDetailInfo(GlobalUtil.getSysConfig("sms_serial"),
//                GlobalUtil.getSysConfig("sms_key"),
//                GlobalUtil.getSysConfig("sms_ename"),
//                GlobalUtil.getSysConfig("sms_linkman"),
//                GlobalUtil.getSysConfig("sms_phone_num"),
//                GlobalUtil.getSysConfig("sms_mobile"),
//                GlobalUtil.getSysConfig("sms_email"),
//                GlobalUtil.getSysConfig("sms_fax"),
//                GlobalUtil.getSysConfig("sms_address"),
//                GlobalUtil.getSysConfig("sms_postcode"));
//        Client client = EmayFactory.getEmayClient();
//        int code = client.registDetailInfo(
//                GlobalUtil.getSysConfig("sms_ename"),
//                GlobalUtil.getSysConfig("sms_linkman"),
//                GlobalUtil.getSysConfig("sms_phone_num"),
//                GlobalUtil.getSysConfig("sms_mobile"),
//                GlobalUtil.getSysConfig("sms_email"),
//                GlobalUtil.getSysConfig("sms_fax"),
//                GlobalUtil.getSysConfig("sms_address"),
//                GlobalUtil.getSysConfig("sms_postcode"));
        Client client = GlobalUtil.getEmayClient();
        try {
            int code = client.registDetailInfo(GlobalUtil.getSysConfig("sms_ename"),
                    GlobalUtil.getSysConfig("sms_linkman"),
                    GlobalUtil.getSysConfig("sms_phone_num"),
                    GlobalUtil.getSysConfig("sms_mobile"),
                    GlobalUtil.getSysConfig("sms_email"),
                    GlobalUtil.getSysConfig("sms_fax"),
                    GlobalUtil.getSysConfig("sms_address"),
                    GlobalUtil.getSysConfig("sms_postcode"));
            if (code != 0) {
                log.error("调用注册公司接口异常,异常码：" + code);
            } else {
                log.info("调用注册公司接口成功");
            }
        } catch (RemoteException ex) {
            log.error("调用注册公司接口异常", ex);
        }
    }
}
