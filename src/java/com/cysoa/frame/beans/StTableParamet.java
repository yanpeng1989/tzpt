/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.beans;

import java.io.Serializable;

/**
 *
 * @author cyss210
 */
public class StTableParamet implements Serializable{
    private String tableName;
    private String colName;
    private String colValue;
    private String colDesc;
    private String valueDesc;
    
    public StTableParamet(String tableName, String colName, String colValue, String colDesc, String valueDesc) {
        this.tableName = tableName;
        this.colName = colName;
        this.colValue = colValue;
        this.colDesc = colDesc;
        this.valueDesc = valueDesc;
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

    /**
     * @return the colName
     */
    public String getColName() {
        return colName;
    }

    /**
     * @param colName the colName to set
     */
    public void setColName(String colName) {
        this.colName = colName;
    }

    /**
     * @return the colValue
     */
    public String getColValue() {
        return colValue;
    }

    /**
     * @param colValue the colValue to set
     */
    public void setColValue(String colValue) {
        this.colValue = colValue;
    }

    /**
     * @return the colDesc
     */
    public String getColDesc() {
        return colDesc;
    }

    /**
     * @param colDesc the colDesc to set
     */
    public void setColDesc(String colDesc) {
        this.colDesc = colDesc;
    }

    /**
     * @return the valueDesc
     */
    public String getValueDesc() {
        return valueDesc;
    }

    /**
     * @param valueDesc the valueDesc to set
     */
    public void setValueDesc(String valueDesc) {
        this.valueDesc = valueDesc;
    }
}
