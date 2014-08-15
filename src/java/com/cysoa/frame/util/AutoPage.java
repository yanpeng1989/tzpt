/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.util;

import com.cysoa.frame.beans.DBTableBean;
import java.util.List;
import java.util.Map;

/**
 *
 * @author cyss210
 */
public class AutoPage {

    public static String initTableSelectSql(String tableName, Map data, Map outCase, Map showKeys) {
        String sql = null;
        String whereCase = "";
        DBTableBean tableBean = GlobalUtil.dbTables.get(tableName);
        sql = "select * from " + tableName + " ";
        if (data.containsKey("select")) {
            Map<String, Object> selectMap = (Map) data.get("select");
            if (selectMap.containsKey("args")) {
                List argsMap = (List) selectMap.get("args");
                whereCase = constructSqlCase(argsMap, outCase, showKeys, tableBean);
                sql += whereCase;
            } else {
                String key = tableBean.getTableKey();
                outCase.put(key, tableBean.getColumnDesc(key));
                sql += " where " + key + "=" + GlobalUtil.DB_IFNULL + "(?," + key + ")";
            }
            if (selectMap.containsKey("show_keys")) {
                AutoPage.constructShowKeys((List) selectMap.get("show_keys"), showKeys, tableBean);
            }
        } else {
            String key = tableBean.getTableKey();
            outCase.put(key, tableBean.getColumnDesc(key));
            sql += " where " + key + "=" + GlobalUtil.DB_IFNULL + "(?," + key + ")";
        }
        return sql;
    }

    public static void constructCustomSelectCase(List args, Map outCase) {
        for (Object val : args) {
            if (val instanceof Map) {
                Map _val = (Map) val;
                String name = _val.get("name").toString();
                if (!StringUtil.isNull("type", _val) && !StringUtil.isNull("method", _val)) {
                    if ("date".equals(_val.get("type"))) {
                        if ("range".equals(_val.get("method"))) {
                            outCase.put("@begin_" + name, _val.get("desc").toString());
                            outCase.put("@end_" + name, _val.get("desc").toString());
                        } else {
                            outCase.put("@" + name, _val.get("desc").toString());
                        }
                    } else {
                        outCase.put(name, _val.get("desc").toString());
                    }
                } else {
                    outCase.put(name, _val.get("desc").toString());
                }
            }
        }
    }

    public static void constructCustomShowKeys(List args, Map showKeys) {
        for (Object val : args) {
            if (val instanceof Map) {
                Map _val = (Map) val;
                showKeys.putAll(_val);
            }
        }
    }

    public static void constructShowKeys(List args, Map showKeys, DBTableBean tableBean) {
        for (Object val : args) {
            if (val instanceof String) {
                if (tableBean != null) {
                    showKeys.put(val.toString(), tableBean.getColumnDesc(val.toString()));
                }
            } else if (val instanceof Map) {
                Map _val = (Map) val;
                String name = _val.get("name").toString();
                showKeys.put(name, _val.get("desc").toString());
            }
        }
    }

    public static String constructSqlCase(List args, Map<String, String> outCase, Map showKeys, DBTableBean tableBean) {
        StringBuilder whereCase = new StringBuilder();
        whereCase.append(" where ");
        for (Object val : args) {
            if (val instanceof String) {
                whereCase.append(val);
                whereCase.append("=");
                whereCase.append(GlobalUtil.DB_IFNULL);
                whereCase.append("(?,");
                whereCase.append(val);
                whereCase.append(") and ");
                if (tableBean != null) {
                    outCase.put(val.toString(), tableBean.getColumnDesc(val.toString()));
                }
            } else if (val instanceof Map) {
                Map _val = (Map) val;
                String name = _val.get("name").toString();
                if (!StringUtil.isNull("type", _val) && !StringUtil.isNull("method", _val)) {
                    if ("date".equals(_val.get("type"))) {
                        if ("range".equals(_val.get("method"))) {
                            whereCase.append(name);
                            whereCase.append(">=? and ");
                            whereCase.append(name);
                            whereCase.append("<=? and ");
                            if (tableBean != null) {
                                outCase.put("@begin_" + name, tableBean.getColumnDesc(name) + "开始");
                                outCase.put("@end_" + name, tableBean.getColumnDesc(name) + "结束");
                                showKeys.put(name, tableBean.getColumnDesc(name));
                            } else {
                                outCase.put("@begin_" + name, _val.get("desc").toString());
                                outCase.put("@end_" + name, _val.get("desc").toString());
                                showKeys.put(name, _val.get("desc").toString());
                            }
                        } else {
                            whereCase.append(name);
                            whereCase.append("=? and ");
                            if (tableBean != null) {
                                outCase.put("@_" + name, tableBean.getColumnDesc(name));
                                showKeys.put(name, tableBean.getColumnDesc(name));
                            } else {
                                outCase.put("@_" + name, _val.get("desc").toString());
                                showKeys.put(name, _val.get("desc").toString());
                            }
                        }
                    } else {
                        whereCase.append(name);
                        whereCase.append("=");
                        whereCase.append(GlobalUtil.DB_IFNULL);
                        whereCase.append("(?,");
                        whereCase.append(name);
                        whereCase.append(") and ");
                        if (tableBean != null) {
                            outCase.put(name, tableBean.getColumnDesc(name));
                            showKeys.put(name, tableBean.getColumnDesc(name));
                        } else {
                            outCase.put(name, _val.get("desc").toString());
                            showKeys.put(name, _val.get("desc").toString());
                        }
                    }
                } else {
                    whereCase.append(name);
                    whereCase.append("=");
                    whereCase.append(GlobalUtil.DB_IFNULL);
                    whereCase.append("(?,");
                    whereCase.append(name);
                    whereCase.append(") and ");
                    if (tableBean != null) {
                        outCase.put(name, tableBean.getColumnDesc(name));
                        showKeys.put(name, tableBean.getColumnDesc(name));
                    } else {
                        outCase.put(name, _val.get("desc").toString());
                        showKeys.put(name, _val.get("desc").toString());
                    }
                }
            }
        }
        String _whereCase = whereCase.toString().trim();
        if (_whereCase.endsWith("and")) {
            return _whereCase.substring(0, _whereCase.length() - 3);
        }
        return _whereCase;
    }
}
