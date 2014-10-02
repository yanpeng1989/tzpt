/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.AES;
import com.cysoa.frame.util.GlobalUtil;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *
 * @author long
 */
@Service
public class UserRegisterResHF extends UniversalService{

    @Override
 public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
           
       // System.out.println("!!!!!!!!!"+out.get("UsrCustId").toString());
       // out.put("result", GlobalUtil.getSysConfig("HFTX_RES_TAG") + in.get("TrxId"));
         try {
               int result2 = update("pu_update_user_custid", new Object[]{
               GlobalUtil.getSysConfig("HFTX_RES_TAG") + in.get("UsrCustId")
               }); 
         } catch (Exception ex) {
            ex.printStackTrace();
        }
       out.put("to_jsp", "pc/index.do");
       out.put("ywlx", "reg");
   }
    
}
