/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.service;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.frame.util.StringUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

/**
 * S10001
 *
 * @author cyss210
 */
@Service
public class CutPageServiceImpl extends UniversalService {

    private static final String pageTag = "_page_para";
    
    private static Logger log = Logger.getLogger(CutPageServiceImpl.class);

    @Override
    public String[] checkNull() {
        return new String[]{
            "sql", "sql"
        };
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        String sqlName = in.get("sql").toString();
        String sql = getSql(sqlName);
        Object _pagePara = in.get(pageTag);
        int toPage = 1;
        int rowNum = 20;
        int pageNum = 10;
        if (_pagePara != null) {
            Map pagePara = (Map) _pagePara;
            if (!StringUtil.isNull("to_page", pagePara)) {
                toPage = Integer.parseInt(pagePara.get("to_page").toString());
            }
            if (toPage <= 0) {
                toPage = 1;
            }
            if (!StringUtil.isNull("row_num", pagePara)) {
                rowNum = Integer.parseInt(pagePara.get("row_num").toString());
            }
            if (!StringUtil.isNull("page_num", pagePara)) {
                pageNum = Integer.parseInt(pagePara.get("page_num").toString());
            }
        }
        String countSql = getCountSql(sql);
        String resSql = null;
        if (GlobalUtil.DB_TYPE.startsWith("oracle")) {
            resSql = getOraResultSql(sql, (toPage - 1) * rowNum + 1, toPage * rowNum + 1);
        } else if (GlobalUtil.DB_TYPE.startsWith("sqlserver")) {
            resSql = getSqlServerResSql(sql, (toPage - 1) * rowNum + 1, rowNum);
        } else if (GlobalUtil.DB_TYPE.startsWith("mysql")) {
            resSql = getMySqlResSql(sql, (toPage - 1) * rowNum + 1, rowNum);
        }
        int totalNum = 0;
        Object _args = in.get("args");
        Map totalMap = null;
        List result = null;
        log.info(countSql);
        log.info(resSql);
        if (_args == null) {
            totalMap = getJdbcTemplate().queryForMap(countSql);
            result = getJdbcTemplate().queryForList(resSql);
        } else {
            Object[] args = (Object[]) _args;
            totalMap = getJdbcTemplate().queryForMap(countSql, args);
            result = getJdbcTemplate().queryForList(resSql, args);
        }
        totalNum = Integer.parseInt(totalMap.get("total_num").toString());
        int maxPage = totalNum / rowNum + 1;

        Map outPage = new HashMap();
        outPage.put("total_num", totalNum);
        outPage.put("to_page", toPage);
        outPage.put("max_page", maxPage);
        out.put(pageTag, outPage);
        out.put("result", result);
    }

    public String getCountSql(String sql) {
        StringBuilder countSql = new StringBuilder();
        countSql.append("select count(*) as total_num from (");
        countSql.append(sql);
        countSql.append(") a");
        return countSql.toString();
    }

    public String getOraResultSql(String sql, int begin, int end) {
        StringBuilder resSql = new StringBuilder();
        resSql.append("select * from (select a.*, rownum as r from (");
        resSql.append(sql);
        resSql.append(") a) where r>=");
        resSql.append(begin);
        resSql.append(" and r<");
        resSql.append(end);
        return resSql.toString();
    }

    public String getSqlServerResSql(String sql, int begin, int rowNum) {
        StringBuilder resSql = new StringBuilder();
        resSql.append("select top ");
        resSql.append(rowNum);
        resSql.append("* from(select top ");
        resSql.append(begin + rowNum - 1);
        resSql.append("* from (");
        resSql.append(sql);
        resSql.append(") a order by _id desc) b order by _id");
        return resSql.toString();
    }
    
    public String getMySqlResSql(String sql, int begin, int rowNum) {
        StringBuilder resSql = new StringBuilder();
        resSql.append("select * from (");
        resSql.append(sql);
        resSql.append(") a limit ");
        resSql.append(begin);
        resSql.append(",");
        resSql.append(rowNum);
        return resSql.toString();
    }
}
