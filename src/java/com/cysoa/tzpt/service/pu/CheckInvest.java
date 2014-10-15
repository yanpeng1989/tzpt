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
 * S30035  yz
 * @author Administrator
 */
@Service
public class CheckInvest  extends UniversalService{
    
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
            Map session = getSession(inHead);
            String id = "";
            String inputje=in.get("je").toString();
            if (session.get("id") != null) {
                id = session.get("id").toString();
                // 账户余额 AvlBal
               in.put("UsrCustId", session.get("usr_custid").toString());
               callService("P80010",in,inHead,out,outHead);
               String avlbal=out.get("AvlBal").toString();
               avlbal=avlbal.replaceAll(",","");
               Double avl=Double.parseDouble(avlbal);
               Double inavl=Double.parseDouble(inputje);
               if(avl<inavl){
                 //余额不足
                     throw new CustomException(400005); 
               }
            }
            
           
      } 
}
