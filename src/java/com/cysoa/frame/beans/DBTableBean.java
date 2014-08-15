/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.beans;

import java.io.Serializable;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.apache.log4j.Logger;

/**
 *
 * @author cyss210
 */
public class DBTableBean implements Serializable {

    private static Logger log = Logger.getLogger(DBTableBean.class);
    private String tableName;
    //string[] 0:字段描述 1:类型 2:是否为空 3:是否主键
    private Map<String, Object[]> cols = new HashMap<String, Object[]>();
    private Set<String> keys = new HashSet<String>();

    public DBTableBean() {
    }

    public void addColumn(String name, String desc, String type, boolean isNull, boolean isKey) {
        Object[] arr = new Object[]{
            desc, type, isNull, isKey
        };
        if (isKey) {
            keys.add(name);
        }
        cols.put(name, arr);
    }

    public String getColumnDesc(String name) {
        String _n = name.toLowerCase();
        return cols.get(_n)[0].toString();
    }

    public String getColumnType(String name) {
        String _n = name.toLowerCase();
        return cols.get(_n)[1].toString();
    }

    public boolean getColumnIfNull(String name) {
        String _n = name.toLowerCase();
        return Boolean.parseBoolean(cols.get(_n)[2].toString());
    }

    public boolean getColumnIfKey(String name) {
        String _n = name.toLowerCase();
        return Boolean.parseBoolean(cols.get(_n)[3].toString());
    }

    public Set<String> getTableKeys() {
        return keys;
    }

    public String getTableKey() {
        if (keys.size() == 1) {
            return keys.iterator().next();
        }
        return null;
    }

    /**
     * @return the tableName
     */
    public String getTableName() {
        return tableName;
    }

    /**
     * @param tableName the tableName to set
     */
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
}
