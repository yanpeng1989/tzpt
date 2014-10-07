/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import static com.cysoa.frame.service.UniversalService.callService;
import com.cysoa.frame.util.GlobalUtil;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *
 * @author long
 */
@Service
public class UserNetSave extends UniversalService{

    @Override
 public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        
         String custId=in.get("custid").toString();
         String OrdId= GlobalUtil.getUniqueNumber()+"0000000";   
         Date dt = new Date();   
         SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");   
         String OrdDate=sdf.format(dt);  
         in.put("UsrCustId", custId);
         in.put("OrdId", OrdId);
         if(in.get("method").toString().equals("chongzhi")){   
          String TransAmt=in.get("chongzhi_je").toString();
           in.put("TransAmt",TransAmt);
           in.put("OrdDate", OrdDate);
          // callService("P80004",in,inHead,out,outHead);
           
         }else if(in.get("method").toString().equals("quxian")){
           String TransAmt=in.get("quxian_je").toString();
           in.put("TransAmt",TransAmt);
          // callService("P80009",in,inHead,out,outHead);
         }
       //in.put("UsrCustId", custId);
        
        
   }
}
