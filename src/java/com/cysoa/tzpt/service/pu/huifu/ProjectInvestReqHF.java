/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.tzpt.service.pu.util.LoanModelUtil;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *
 * @  S30025
 */
@Service
public class ProjectInvestReqHF extends UniversalService{

    @Override
 public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
       String loadid =in.get("investid").toString();
       String usr_custid =getSession(inHead).get("usr_custid").toString();
      // String usr_custid="6000060000356500";
       String order_id=GlobalUtil.getUniqueNumber();
       String transAmt="100.00";// 
       Date dt = new Date();   
       SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");   
       String order_date=sdf.format(dt);  
       String BorrowerDetails="[{\"BorrowerCustId\":\"6000060000355244\",\"BorrowerAmt\":\"10000.00\",\"BorrowerRate\":\"0.80\"}]";
       in.put("UsrCustId", usr_custid);
       in.put("OrdId", order_id+"0000000");
       in.put("OrdDate",order_date);
       in.put("TransAmt",transAmt);
       in.put("MaxTenderRate",LoanModelUtil.tenderate);
       in.put("BorrowerDetails",BorrowerDetails);
       in.put("BorrowerCustId","6000060000355244");
       in.put("BorrowerAmt", "10000.00");
       in.put("BorrowerRate", "0.80");
       in.put("IsFreeze", "N");
       in.put("MerPriv",loadid); 
       
       /*
        String investid = GlobalUtil.getUniqueNumber();
        String loadid="3";//????
        String custid="1412268133906";//????
        double stages_assests=100.00;//????
        double fqcount=12.00;
        try {
            int result = update("pu_insert_personnal_invest", new Object[]{
                investid,loadid, custid, stages_assests, null,null,null,null,null, "0"
            });
             //拆分投资表
          List ls= LoanModelUtil.loanmodel(stages_assests, 12);
          for(int i=1;i<=ls.size();i++){
          Map tempM=new HashMap();
          tempM=(HashMap)ls.get(i);
          int result2 = update("pu_insert_every_invest", new Object[]{
          GlobalUtil.getUniqueNumber(),i,investid,custid,tempM.get("surplus"),tempM.get("capital"),tempM.get("interest"),tempM.get("sum"),null,0
            });
          }
           
        
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new CustomException(999998);
        } */
   }
}
