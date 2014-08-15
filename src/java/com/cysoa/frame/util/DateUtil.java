/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.util;

import com.cysoa.frame.service.UniversalService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author cyss210
 */
public class DateUtil {

    private static Logger log = Logger.getLogger(DateUtil.class);
    private static final SimpleDateFormat sdfDefault = new SimpleDateFormat("yyyy-MM-dd");
    private static final SimpleDateFormat sdfDetail = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static final SimpleDateFormat sdfSqlServer = new SimpleDateFormat("MM  d yyyy HH:mm");
    private static final String endDateStr = "3000-01-01 23:59:59";
    private static final String beginDateStr = "1900-01-01 00:00:00";

    public static String toDefaultStr(Date date) {
        return sdfDefault.format(date);
    }

    public static Date toDefaultDate(String str) {
        Date date = null;
        try {
            date = sdfDefault.parse(str);
        } catch (ParseException ex) {
            log.warn("日期默认转换Date失败：" + str);
        }
        return date;
    }

    public static Date changeAutoDate(String key, Map map) {
        Date date = null;
        if (!StringUtil.isNull(key, map)) {
            String dateStr = map.get(key).toString();
            if (dateStr.length() == 10) {
                try {
                    date = sdfDefault.parse(dateStr);
                } catch (ParseException ex) {
                }
            } else if (dateStr.length() == 19) {
                try {
                    date = sdfDetail.parse(dateStr);
                } catch (ParseException ex) {
                }
            }
        }
        return date;
    }

    public static Date changeEndDate(String key, Map map) {
        Date date = null;
        if (StringUtil.isNull(key, map)) {
            try {
                date = sdfDetail.parse(endDateStr);
            } catch (ParseException ex) {
            }
        } else {
            String endDate = map.get(key).toString();
            if (endDate.length() == 10) {
                endDate += " 23:59:59";
            } else if (endDate.length() == 19) {
            } else {
                endDate = endDateStr;
            }
            try {
                date = sdfDetail.parse(endDate);
            } catch (ParseException ex) {
            }
        }
        return date;
    }

    public static Date changeBeginDate(String key, Map map) {
        Date date = null;
        if (StringUtil.isNull(key, map)) {
            try {
                date = sdfDetail.parse(beginDateStr);
            } catch (ParseException ex) {
            }
        } else {
            String beginDate = map.get(key).toString();
            if (beginDate.length() == 10) {
                beginDate += " 00:00:00";
            } else if (beginDate.length() == 19) {
            } else {
                beginDate = beginDateStr;
            }
            try {
                date = sdfDetail.parse(beginDate);
            } catch (ParseException ex) {
            }
        }
        return date;
    }

    public static String changeEndStr(String key, Map map) {
        return sdfDetail.format(changeEndDate(key, map));
    }

    public static String changeBeginStr(String key, Map map) {
        return sdfDetail.format(changeBeginDate(key, map));
    }

    public static String toSqlServerDateStr(String str) {
        String date = null;
        if (!StringUtil.isNull(str)) {
            if (str.endsWith("PM") || str.endsWith("AM")) {
                str = str.substring(0, str.length() - 2);
                try {
                    date = sdfDefault.format(sdfSqlServer.parse(str));
                } catch (ParseException ex) {
                    date = null;
                }
            }
        }
        return date;
    }
}
