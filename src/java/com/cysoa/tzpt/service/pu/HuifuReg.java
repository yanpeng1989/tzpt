/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import static com.cysoa.frame.service.UniversalService.callService;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * S20012 账户信息
 *
 * @author Administrator
 */
@Service
public class HuifuReg extends UniversalService {

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        String id = "";
        if (session.get("id") != null) {
            id = session.get("id").toString();
        }
        Map<String, Object> user = queryData("pu_get_one_userByid", id);
        if (user != null) {
            String custid=user.get("USR_CUSTID")==null?"":user.get("USR_CUSTID").toString();
            if(custid.equals("")) 
                out.put("custflag","0");
            else
                out.put("custflag","1");
        } 
    }
}
