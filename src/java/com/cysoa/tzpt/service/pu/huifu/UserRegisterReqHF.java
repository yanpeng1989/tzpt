/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *
 * @author long
 */
@Service
public class UserRegisterReqHF extends UniversalService{

    @Override
 public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        String id = "";
        if (session.get("id") != null) {
            id = session.get("id").toString();
        }
        if(id.equals("")){
         throw new CustomException(100004); //用户不存在
        }
        Map<String, Object> user = queryData("pu_get_one_userByid", id);
        if (user == null) {
                throw new CustomException(100004); //用户不存在
        }
       else{
        in.put("UsrId", id);
        in.put("UsrEmail", user.get("MAIL"));
        in.put("UsrMp", user.get("TEL"));  
       }
   }
    
}
