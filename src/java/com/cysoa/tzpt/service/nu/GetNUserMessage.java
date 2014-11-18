/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.nu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import static com.cysoa.frame.service.UniversalService.callService;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * S41000 获取用户所有信息
 * @author cyss210
 */
@Service
public class GetNUserMessage extends UniversalService{

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        callService("P41000", in, inHead, out, outHead);
        Map session = getSession(inHead);
        String id = session.get("id").toString();
        out.putAll(queryData("nu_check_usr_message", id));
    }
    
}
