/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *
 * @author S30032
 */
@Service
public class UserRepayMentReqHF extends UniversalService{

    @Override
 public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
       Map session = getSession(inHead);
       String load_every_id= in.get("load_every_id").toString();
       String TransAmt="10.00";
       String InCustId="";
       String DivAccId=""; //分散客户号
       String DivAmt="";  //分散客户金额
       String Fee="1.00";  //扣款手续费
       in.put("OrdId","12313213213212");
       in.put("SubOrdId","1231231321");
       in.put("Fee",Fee);
       Date dt = new Date();   
       SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");   
       String order_date=sdf.format(dt); 
       in.put("OutCustId", session.get("usr_custid").toString());
       in.put("OrdDate",order_date);
       in.put("SubOrdDate",order_date);
       in.put("UsrId", in.get("id"));
       in.put("TransAmt",TransAmt);
  
      
       
   }
    
}
 
