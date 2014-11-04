/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import static com.cysoa.frame.service.UniversalService.callService;
import com.cysoa.frame.util.AES;
import com.cysoa.frame.util.GlobalUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *    
 *
 * @author tensison
 */
@Service
public class InvestGive extends UniversalService {

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        
        Map session = getSession(inHead);
        String id = session.get("id").toString();
        String invest_id=in.get("invest_id").toString();
        String status=in.get("status").toString();
        if(invest_id.equals("")){
             throw new CustomException(400007); //传参错误
        }
        
         try {
            int result1 = update("pu_update_invest_status", new Object[]{
               status,invest_id
            });
          
         } catch (Exception ex) {
            ex.printStackTrace();
              throw new CustomException(999998);  
        }
        
        
       
    }
}
