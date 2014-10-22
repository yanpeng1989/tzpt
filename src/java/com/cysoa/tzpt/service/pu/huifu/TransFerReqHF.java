/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *
 * @author S 
 */
@Service
public class TransFerReqHF extends UniversalService{

    @Override
 public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
       Map session = getSession(inHead);
       String load_every_id= in.get("load_every_id").toString();
       String load_id=in.get("load_id").toString();
       String OrdId = GlobalUtil.getUniqueNumber() + "";//订单号
       String OutAcctId="";//??????
       String TransAmt="10.00";//?????
       String InCustId="";//？？？？？
       in.put("OrdId",OrdId);
       in.put("OutCustId", session.get("usr_custid").toString());
     //  in.put("OutAcctId", OutAcctId);
       in.put("InAcctId", "MDT000001");
       in.put("InCustId",  InCustId); 
       in.put("TransAmt",TransAmt);
      
       
   }
    
}
 
