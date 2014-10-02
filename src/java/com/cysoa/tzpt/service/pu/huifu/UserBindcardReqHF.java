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
public class UserBindcardReqHF extends UniversalService{

    @Override
 public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
       Map session = getSession(inHead);
       String id = session.get("id").toString();
       in.put("UsrId", id);
     //  in.put("UsrName", in.get("测试"));
     //  in.put("UsrEmail", in.get("email"));
     //  in.put("UsrMp", in.get("tel"));  
   }
    
}
