/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.nu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * P41000 初始化用户信息
 * @author cyss210
 */
@Service
public class CheckIfInitUsrMsg extends UniversalService {

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        int count = queryList("nu_check_usr_message", session.get("id")).size();
        if (count == 0) {
            update("ns_add_null_usr_message", session.get("id"));
        }
    }
}
