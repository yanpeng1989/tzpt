/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.service;

import com.cysoa.frame.beans.FrameServiceBean;
import com.cysoa.frame.beans.MapFactory;
import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.impl.UniversalServiceInterface;
import com.cysoa.frame.util.DateUtil;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.frame.util.StringUtil;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.json.JSONException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

/**
 *
 * @author cyss210
 */
@Service
public abstract class UniversalService implements Serializable, UniversalServiceInterface {

    private static Logger log = Logger.getLogger(UniversalService.class);
    @Resource(name = "jdbcTemplate")
    private JdbcTemplate jdbcTemplate;

    /**
     * @return the jdbcTemplate
     */
    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    /**
     * @param jdbcTemplate the jdbcTemplate to set
     */
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public static void callService(String code, Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        if (log.isDebugEnabled()) {
            log.debug("请求数据");
            try {
                log.debug(MapFactory.toLog(in));
            } catch (JSONException ex) {
            }
        }
        try {
            log.info(MapFactory.toJson(in));
        } catch (JSONException ex) {
        }
        if (!GlobalUtil.allServices.containsKey(code)) {
            throw new CustomException(999996, code); //找不到服务
        }
        log.info("执行服务：" + code);
        FrameServiceBean serviceBean = GlobalUtil.allServices.get(code);
        UniversalService service = serviceBean.getService();
        String checkRes = checkNull(service.checkNull(), in);
        if (!StringUtil.isNull(checkRes)) {
            throw new CustomException(200026, checkRes); //#@#不可为空
        }

        String[] checkArr = checkLength(service.checkLength(), in);
        if (checkArr != null) {
            throw new CustomException(203001, checkArr[1], checkArr[0]); //#@#长度不可超过#@#
        }
        if ("Y".equals(serviceBean.getIsLogin())) {
            Map<String, Object> session = getSession(inHead);
            if (StringUtil.isNull(GlobalUtil.login_tag, session)) {
                throw new CustomException(200023); //用户请先登录
            }
        }

        service.execute(in, inHead, out, outHead);
        if (log.isDebugEnabled()) {
            log.debug("返回数据");
            try {
                log.debug(MapFactory.toLog(out));
            } catch (JSONException ex) {
            }
        }
    }

    protected static Map<String, Object> getSession(Map<String, Object> inHead) {
        HttpSession session = (HttpSession) inHead.get(GlobalUtil.session_tag);
        Object obj = session.getAttribute(GlobalUtil.session_tag);
        Map<String, Object> ses = null;
        if (obj == null) {
            ses = new HashMap<String, Object>();
            session.setAttribute(GlobalUtil.session_tag, ses);
        } else {
            ses = (HashMap<String, Object>) obj;
        }
        return ses;
    }

    protected List<Map<String, Object>> queryList(String sqlName, Object... args) throws CustomException {
        String sql = getSql(sqlName);
        printParaLog(sql, args);
        List<Map<String, Object>> list = getJdbcTemplate().queryForList(sql, args);
        return list;
    }

    protected Map<String, Object> queryData(String sqlName, Object... args) throws CustomException {
        String sql = getSql(sqlName);
        printParaLog(sql, args);
        Map<String, Object> map = null;
        try {
            map = getJdbcTemplate().queryForMap(sql, args);
        } catch (Exception e) {
            log.error("执行sql错误", e);
        }
        return map;
    }

    protected int update(String sqlName, Object... args) throws CustomException {
        String sql = getSql(sqlName);
        printParaLog(sql, args);
        int count = 0;
        count = getJdbcTemplate().update(sql, args);
        return count;
    }

    protected int[] batchUpdate(String sqlName, final List<Object[]> paraList) throws CustomException {
        String sql = getSql(sqlName);

        int[] c = getJdbcTemplate().batchUpdate(sql, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                Object[] obj = paraList.get(i);
                int index = 1;
                for (Object o : obj) {
                    ps.setObject(index, o);
                    index++;
                }
            }

            @Override
            public int getBatchSize() {
                return paraList.size();
            }
        });
        return c;
    }

    protected String[] checkNull() {
        return null;
    }

    protected String[] checkLength() {
        return null;
    }

    public abstract void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException;

    private void printParaLog(String sql, Object... args) {
        log.info("执行sql：" + sql);
        StringBuilder sb = new StringBuilder();
        for (Object obj : args) {
            if (obj instanceof Date) {
                sb.append(DateUtil.toDefaultStr((Date) obj));
            } else {
                sb.append(obj.toString());
            }
            sb.append(",");
        }
        log.info("参数：" + sb);
    }

    protected String getSql(String sqlName) throws CustomException {
        if (!GlobalUtil.allSqls.containsKey(sqlName)
                && (sqlName.startsWith("select") || sqlName.startsWith("update") || sqlName.startsWith("delete") || sqlName.startsWith("insert"))) {
            return sqlName;
        }
        if (!GlobalUtil.allSqls.containsKey(sqlName)) {
            log.error("找不到sql：" + sqlName);
            throw new CustomException(999990);
        }
        String sql = GlobalUtil.allSqls.get(sqlName);
        return sql;
    }

    private static String checkNull(String[] arr, Map<String, Object> in) {
        if (arr == null) {
            return null;
        }
        for (int i = 0; i < arr.length; i += 2) {
            if (!in.containsKey(arr[i]) || StringUtil.isNull(in.get(arr[i]).toString())) {
                return arr[i + 1];
            }
        }
        return null;
    }

    private static String[] checkLength(String[] arr, Map<String, Object> in) {
        if (arr == null) {
            return null;
        }
        for (int i = 0; i < arr.length; i += 3) {
            if (in.get(arr[i]).toString().length() > Integer.parseInt(arr[i + 1])) {
                return new String[]{arr[i + 1], arr[i + 2]};
            }
        }
        return null;
    }
}
