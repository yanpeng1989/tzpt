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
       Map<String, Object> loadinfo = this.queryData("pu_get_pu_load", loadid);
       Map Borrowusrinf=  queryData("pu_get_custidbyuserid", loadinfo.get("ID"));
       String BcustId=(String) Borrowusrinf.get("USR_CUSTID");
       String usr_custid =getSession(inHead).get("usr_custid").toString();
       String FreezeOrdId=GlobalUtil.getUniqueNumber();
       String transAmt=in.get("tzje").toString()+".00";
      String BorrowAmt=new java.text.DecimalFormat("#.00").format((Double)loadinfo.get("SUM"));
    //    String BorrowAmt="9000.00";
       Date dt = new Date();   
       SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");   
       String order_date=sdf.format(dt);  
       String BorrowerDetails="[{\"BorrowerCustId\":\""+ BcustId+"\",\"BorrowerAmt\":\""+transAmt+"\",\"BorrowerRate\":\""+ LoanModelUtil.borrowrate+"\"}]";
       in.put("UsrCustId", usr_custid);
       in.put("OrdId", FreezeOrdId);
       in.put("OrdDate",order_date);
       in.put("TransAmt",transAmt);
       in.put("MaxTenderRate",LoanModelUtil.tenderate);
       in.put("BorrowerDetails",BorrowerDetails);
       in.put("BorrowerCustId", BcustId);
       in.put("BorrowerAmt",transAmt);
       in.put("BorrowerRate", LoanModelUtil.borrowrate);
       in.put("IsFreeze", "Y");
       in.put("FreezeOrdId", FreezeOrdId);
       in.put("MerPriv",loadid); 
    
   }
}
