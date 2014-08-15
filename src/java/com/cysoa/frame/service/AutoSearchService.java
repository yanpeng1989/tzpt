/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.service;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.util.DateUtil;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.frame.util.StringUtil;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * S10002 自动页面查询
 *
 * @author cyss210
 */
@Service
public class AutoSearchService extends UniversalService {

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map<String, Object> session = getSession(inHead);
        Map<String, Object> autoPageMap = (Map<String, Object>) session.get(GlobalUtil.AUTO_PAGE_TAG);
        if (!StringUtil.isNull("select_sql", autoPageMap)) {
            String selectSql = autoPageMap.get("select_sql").toString();
            Map<String, Object> selectCase = (Map<String, Object>) autoPageMap.get("select_case");
            List<Object> argsList = new LinkedList<Object>();
            for (String key : selectCase.keySet()) {
                if (key.startsWith("@begin_")) {
                    argsList.add(DateUtil.changeBeginDate(key, in));
                } else if (key.startsWith("@end_")) {
                    argsList.add(DateUtil.changeEndDate(key, in));
                } else if (key.startsWith("@")) {
                    argsList.add(DateUtil.changeAutoDate(key, in));
                } else {
                    argsList.add(in.get(key));
                }
            }
            in.put("sql", selectSql);
            in.put("args", argsList.toArray());
            callService("S10001", in, inHead, out, outHead);
        } else {
        }
    }
}
