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
 * @author  
 */
@Service
public class UserTransResHF extends UniversalService{

    @Override
 public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
         
         out.put("result", "RECV_ORD_ID_" + in.get("OrdId"));
        // out.put("to_jsp", "pc/user/index.do"); 
   }
    
}
 
