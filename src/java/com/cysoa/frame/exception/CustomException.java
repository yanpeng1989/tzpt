/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.exception;

import com.cysoa.frame.util.GlobalUtil;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author cyss210
 */
public class CustomException extends Exception {

    private static final String replaceString = "!#!";
    private int code;
    private String desc;

    public CustomException() {
        super();
    }

    public CustomException(String msg) {
        super(msg);
        this.desc = msg;
    }

    public CustomException(int code) {
        super(code + "");
        this.code = code;
        this.desc = GlobalUtil.allErrorMsg.get(code + "");
    }

    public CustomException(int code, String... str) {
        super(code + "");
        String s = GlobalUtil.allErrorMsg.get(code + "");
        for (int i = 0; i < str.length; i++) {
            String _str = str[i];
            s = s.replaceFirst(replaceString, _str);
        }
        this.code = code;
        this.desc = s;
    }

    public CustomException(String msg, Throwable throwable) {
        super(msg, throwable);
        this.desc = msg;
    }

    public CustomException(int code, Throwable throwable) {
        super(code + "", throwable);
        this.code = code;
        this.desc = GlobalUtil.allErrorMsg.get(code + "");
    }

    public Map getBackData() {
        Map map = new HashMap();
        Map head = new HashMap();
        head.put("res_code", this.code);
        head.put("res_desc", this.desc);
        map.put("head", head);
        return map;
    }

    /**
     * @return the code
     */
    public int getCode() {
        return code;
    }

    /**
     * @param code the code to set
     */
    public void setCode(int code) {
        this.code = code;
    }

    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }
}
