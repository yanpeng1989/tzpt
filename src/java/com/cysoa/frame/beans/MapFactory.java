/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.beans;

import com.cysoa.frame.util.DateUtil;
import com.cysoa.frame.util.GlobalUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author cyss210
 */
public class MapFactory {

    private static Logger log = Logger.getLogger(MapFactory.class);

    public static String toJson(Map<String, Object> map) throws JSONException {
        JSONObject jsonObj = new JSONObject();
        contructMapData(jsonObj, map);
        return jsonObj.toString();
    }

    private static void contructMapData(JSONObject jsonObj, Map<String, Object> map) throws JSONException {
        for (String key : map.keySet()) {
            Object val = map.get(key);
            if (val instanceof Date) {
                val = DateUtil.toDefaultStr((Date) val);
                jsonObj.put(key, val);
            } else if (val instanceof Map) {
                JSONObject _jsonObj = new JSONObject();
                jsonObj.put(key, _jsonObj);
                contructMapData(_jsonObj, (Map) val);
            } else if (val instanceof List) {
                JSONArray arr = new JSONArray();
                jsonObj.put(key, arr);
                contructMapData(arr, (List) val);
            } else {
                jsonObj.put(key, val);
            }
        }
    }

    private static void contructMapData(JSONArray jsonArr, List list) throws JSONException {
        for (Object val : list) {
            if (val instanceof Date) {
                val = DateUtil.toDefaultStr((Date) val);
                jsonArr.put(val);
            } else if (val instanceof Map) {
                JSONObject _jsonObj = new JSONObject();
                jsonArr.put(_jsonObj);
                contructMapData(_jsonObj, (Map) val);
            } else if (val instanceof List) {
                JSONArray arr = new JSONArray();
                jsonArr.put(arr);
                contructMapData(arr, (List) val);
            } else {
                jsonArr.put(val);
            }
        }
    }

    public static String toLog(String json) {
        return formatJson(json, "   ");
    }

    public static String toLog(Map<String, Object> map) throws JSONException {
        String log = formatJson(toJson(map), "   ");
        return log;
    }

    private static String formatJson(String json, String fillStringUnit) {
        if (json == null || json.trim().length() == 0) {
            return null;
        }

        int fixedLenth = 0;
        ArrayList<String> tokenList = new ArrayList<String>();
        {
            String jsonTemp = json;
            //预读取 
            while (jsonTemp.length() > 0) {
                String token = getToken(jsonTemp);
                jsonTemp = jsonTemp.substring(token.length());
                token = token.trim();
                tokenList.add(token);
            }
        }

        for (int i = 0; i < tokenList.size(); i++) {
            String token = tokenList.get(i);
            int length = token.getBytes().length;
            if (length > fixedLenth && i < tokenList.size() - 1 && tokenList.get(i + 1).equals(":")) {
                fixedLenth = length;
            }
        }

        StringBuilder buf = new StringBuilder();
        int count = 0;
        for (int i = 0; i < tokenList.size(); i++) {

            String token = tokenList.get(i);

            if (token.equals(",")) {
                buf.append(token);
                doFill(buf, count, fillStringUnit);
                continue;
            }
            if (token.equals(":")) {
                buf.append(" ").append(token).append(" ");
                continue;
            }
            if (token.equals("{")) {
                String nextToken = tokenList.get(i + 1);
                if (nextToken.equals("}")) {
                    i++;
                    buf.append("{ }");
                } else {
                    count++;
                    buf.append(token);
                    doFill(buf, count, fillStringUnit);
                }
                continue;
            }
            if (token.equals("}")) {
                count--;
                doFill(buf, count, fillStringUnit);
                buf.append(token);
                continue;
            }
            if (token.equals("[")) {
                String nextToken = tokenList.get(i + 1);
                if (nextToken.equals("]")) {
                    i++;
                    buf.append("[ ]");
                } else {
                    count++;
                    buf.append(token);
                    doFill(buf, count, fillStringUnit);
                }
                continue;
            }
            if (token.equals("]")) {
                count--;
                doFill(buf, count, fillStringUnit);
                buf.append(token);
                continue;
            }

            buf.append(token);
            //左对齐 
            if (i < tokenList.size() - 1 && tokenList.get(i + 1).equals(":")) {
                int fillLength = fixedLenth - token.getBytes().length;
                if (fillLength > 0) {
                    for (int j = 0; j < fillLength; j++) {
                        buf.append(" ");
                    }
                }
            }
        }
        return buf.toString();
    }

    private static String getToken(String json) {
        StringBuilder buf = new StringBuilder();
        boolean isInYinHao = false;
        while (json.length() > 0) {
            String token = json.substring(0, 1);
            json = json.substring(1);

            if (!isInYinHao
                    && (token.equals(":") || token.equals("{") || token.equals("}")
                    || token.equals("[") || token.equals("]")
                    || token.equals(","))) {
                if (buf.toString().trim().length() == 0) {
                    buf.append(token);
                }

                break;
            }

            if (token.equals("\\")) {
                buf.append(token);
                buf.append(json.substring(0, 1));
                json = json.substring(1);
                continue;
            }
            if (token.equals("\"")) {
                buf.append(token);
                if (isInYinHao) {
                    break;
                } else {
                    isInYinHao = true;
                    continue;
                }
            }
            buf.append(token);
        }
        return buf.toString();
    }

    private static void doFill(StringBuilder buf, int count, String fillStringUnit) {
        buf.append("\n");
        for (int i = 0; i < count; i++) {
            buf.append(fillStringUnit);
        }
    }

    public static Map<String, Object> toMap(String json) throws JSONException {
        JSONObject jsonObj = new JSONObject(json);
        Map<String, Object> map = new HashMap<String, Object>();
        constuctJsonObj(map, jsonObj);
        return map;
    }

    private static void constuctJsonObj(Map<String, Object> map, JSONObject jsonObj) throws JSONException {
        Iterator iter = jsonObj.keys();
        while (iter.hasNext()) {
            String key = iter.next().toString();
            Object obj = jsonObj.get(key);
            if (obj instanceof JSONObject) {
                Map<String, Object> childMap = new HashMap<String, Object>();
                map.put(key, childMap);
                constuctJsonObj(childMap, (JSONObject) obj);
            } else if (obj instanceof JSONArray) {
                List list = new ArrayList();
                map.put(key, list);
                constructJsonArray(list, (JSONArray) obj);
            } else {
                map.put(key, obj);
            }
        }
    }

    private static void constructJsonArray(List list, JSONArray array) throws JSONException {
        for (int i = 0; i < array.length(); i++) {
            Object obj = array.get(i);
            if (obj instanceof JSONArray) {
                List childList = new ArrayList();
                list.add(childList);
                constructJsonArray(childList, (JSONArray) obj);
            } else if (obj instanceof JSONObject) {
                Map<String, Object> map = new HashMap<String, Object>();
                list.add(map);
                constuctJsonObj(map, (JSONObject) obj);
            } else {
                list.add(obj);
            }
        }
    }

    public static Map<String, Object> createPacket() {
        Map<String, Object> pck = new HashMap<String, Object>();
        Map<String, Object> head = new HashMap<String, Object>();
        pck.put("head", head);
        return pck;
    }

    public static Map<String, Object> createSuscessPacket() {
        Map<String, Object> pck = createPacket();
        Map<String, Object> head = (Map<String, Object>) pck.get("head");
        head.put("res_code", "000000");
        head.put("res_desc", "操作成功");
        return pck;
    }

    public static Map<String, Object> createBackPacket(int code, String desc) {
        Map<String, Object> pck = createPacket();
        Map<String, Object> head = (Map<String, Object>) pck.get("head");
        head.put("res_code", code);
        head.put("res_desc", desc);
        return pck;
    }
    
    public static Map<String, Object> createBackPacket(int code) {
        Map<String, Object> pck = createPacket();
        Map<String, Object> head = (Map<String, Object>) pck.get("head");
        head.put("res_code", code);
        head.put("res_desc", GlobalUtil.allErrorMsg.get(code + ""));
        return pck;
    }

    public static void putAll(Map<String, Object> src, Map<String, Object> dest) {
        if (dest == null || src == null) {
            return;
        }
        for (String key : src.keySet()) {
            dest.put(key, src.get(key));
        }
    }
}
