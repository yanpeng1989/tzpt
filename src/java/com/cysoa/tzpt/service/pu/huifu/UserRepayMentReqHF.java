/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.tzpt.service.pu.ImgUploadService;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
       String load_id=in.get("load_id").toString();
       String OrdId = GlobalUtil.getUniqueNumber() + "";//订单号
       String num=in.get("num").toString();
       String InCustId="";
       String Fee="1.00";  //扣款手续费
       in.put("Fee",Fee);
       Date dt = new Date();   
       SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");   
       String order_date=sdf.format(dt); 
       //获取放款订单
       Map ordInfo=  this.queryData("pu_get_loans_log",load_id);
       String SubOrdId=(String)ordInfo.get("LOAN_ORD_ID");
       Timestamp SubOrddate=(Timestamp)ordInfo.get("time");
       String SubOrdDate=SubOrddate.toString();
       SubOrdDate=SubOrdDate.replaceAll("-", "");
       SubOrdDate= SubOrdDate.substring(0, 8);
       List<Map<String, Object>> list = queryList("pu_get_all_invest_people",new Object[]{load_id,num});
       for (Map m : list) {
       System.out.println("for:");
      // Map<String, Object> userCustId = queryData("pu_get_custidbyuserid", m.get("invest_person_id").toString());
       in.put("OrdId",OrdId);
       in.put("OutCustId", session.get("usr_custid").toString());
       in.put("OrdDate",order_date);
       in.put("SubOrdId",SubOrdId);
       in.put("SubOrdDate",SubOrdDate); 
       in.put("TransAmt", Double.parseDouble(m.get("invest_sum").toString()));
       in.put("InCustId", (String)m.get("invest_person_id"));//?????
       in.put("DivCustId", "6000060000337675");
       in.put("DivAcctId", "MDT000001");
     //  in.put("DivDetails", "[{\"DivCustId\":\"6000060000337675\",\"DivAcctId\":\"MDT000001\",\"DivAmt\":\"" + Fee + "\"}]");
       in.put("DivAmt", Fee);
        }
   }
    
}
 
