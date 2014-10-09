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
         Map session = getSession(inHead);
         String custId=session.get("usr_custid").toString();
         String OrdId= GlobalUtil.getUniqueNumber()+"";   
         Date dt = new Date();   
         SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");   
         String OrdDate=sdf.format(dt);  
         if(in.get("method").toString().equals("chongzhi")){   
          String TransAmt=in.get("chongzhi_je").toString();
           in.put("TransAmt",TransAmt+".00");
           in.put("OrdDate", OrdDate);
           in.put("UsrCustId", custId);
          in.put("OrdId", OrdId);
         }else if(in.get("method").toString().equals("quxian")){
          String TransAmt=in.get("quxian_je").toString();
         
         in.put("TransAmt",TransAmt+".00");
         in.put("UsrCustId", custId);
         in.put("OrdId", OrdId);
          // callService("P80009",in,inHead,out,outHead);
         }
         else if(in.get("method").toString().equals("quxian_yz")){
         String TransAmt=in.get("quxian_je").toString();
         in.put("UsrCustId", session.get("usr_custid").toString());
           //  账户余额 AvlBal
         callService("P80010",in,inHead,out,outHead);
         double count_ye=Double.parseDouble(out.get("AvlBal").toString());
         double  tx_je=Double.parseDouble(TransAmt) ;
         if(count_ye<tx_je){
               out.put("yzresult", "false");
                }else{
         out.put("yzresult", "true");
         }
         }
   }
}
