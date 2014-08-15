/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.util;

import java.util.Map;

/**
 *
 * @author cyss210
 */
public class StringUtil {

    public static boolean isNull(String str) {
        return str == null || "".equals(str.trim()) ? true : false;
    }

    public static boolean isNull(String key, Map<String, Object> map) {
        return !map.containsKey(key) || isNull(map.get(key).toString()) ? true : false;
    }
}
