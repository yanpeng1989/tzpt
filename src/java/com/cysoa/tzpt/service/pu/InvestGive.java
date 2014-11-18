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
import com.cysoa.tzpt.service.pu.huifu.UserRepayMentReqHF;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
   private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(InvestGive.class);
  
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
       
        Map session = getSession(inHead);
        String id = session.get("id").toString();
        String invest_id=in.get("invest_id").toString();
        String status=in.get("status").toString();
        String zrje=in.get("zrje")==null?"":in.get("zrje").toString();
        if(invest_id.equals("")){
             throw new CustomException(400007); //传参错误
        }
       
        if (status.equals("4")) {
            try {
                int result1 = update("pu_update_invest_status", new Object[]{
                    status, Double.parseDouble(zrje), invest_id
                });

            } catch (Exception ex) {
                ex.printStackTrace();
                throw new CustomException(999998);
            }
        }
        if (status.equals("5")) {
        try {
               int result1 = update("pu_trans_everyinvest", new Object[]{
                  session.get("usr_custid").toString() , invest_id
                });
               int result2 = update("pu_trans_invest", new Object[]{
                 session.get("id").toString() , invest_id
                });
               int result3 = update("pu_update_invest_status", new Object[]{
                    status, Double.parseDouble(zrje), invest_id
                });
               
         } catch (Exception ex) {
                ex.printStackTrace();
                throw new CustomException(999998);
         }
       String OrdId = GlobalUtil.getUniqueNumber();   
       Map<String, Object> invest = this.queryData("pu_get_custid_invest", invest_id);
       String sellCustid= invest.get("usr_custid").toString();
       
       in.put("SellCustId",sellCustid);
    
       Double TransAmt = Double.parseDouble(zrje);
       DecimalFormat df = new DecimalFormat("#0.00");
       Date dt = new Date();   
       SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");   
       String order_date=sdf.format(dt);  
       Double borrowsum;
       Double creditAmt;
       String borrowCustId="";
      
       Map<String, Object> repay_sum = this.queryData("pu_get_repay_sum", invest_id); 
       Map<String, Object> borrow_detail=this.queryData("pu_get_borrow_detail", invest_id);
       if(borrow_detail!=null){
        borrowsum=Double.parseDouble(borrow_detail.get("stages_assests").toString());
        borrowCustId=borrow_detail.get("custid").toString();
       }else{
        throw new CustomException("未查询到原始的借款信息！");
       }
       Double PrintAmt=0.00;
       if(repay_sum.get("total")!=null){
       PrintAmt = Double.parseDouble((String)repay_sum.get("total"));
       }
       creditAmt=borrowsum-PrintAmt;
       
       in.put("CreditAmt",df.format(creditAmt));
       in.put("CreditDealAmt",df.format(TransAmt) );
       in.put("BidDetails","{\"BidDetails\":[{\"BidOrdId\":\""+invest_id+"\",\"BidOrdDate\":\""+order_date+"\",\"BidCreditAmt\":\""+
               df.format(creditAmt)+"\",\"BorrowerDetails\":[{\"BorrowerCustId\":\""+borrowCustId+"\",\"BorrowerCreditAmt\":\""+
               df.format(creditAmt) +"\",\"PrinAmt\":\""+df.format(PrintAmt)+"\"}]}]} ");
       in.put("Fee","0.00" );
       in.put("BuyCustId", session.get("usr_custid").toString());
       in.put("OrdId",OrdId);
       in.put("OrdDate",order_date);
       //in.put("DivDetails","[]");
       //callService("P80008", in, inHead, out, outHead);
       /*
       try {
                 String code = out.get("RespCode").toString();
                 log.debug("code!!!!!!!!!!!!!!!!!"+code);
                if ("000".equals(code)) {
                    log.info("调用转账接口成功");
                  } 
                else if("343".equals(code)){
                throw new CustomException("账户余额不足，请先进行充值！");
                }
                else {
                    log.error("调用转账接口出现错误" + out.get("RespCode") + ":" + out.get("RespDesc"));
                    throw new CustomException("调用还款接口出现错误" + out.get("RespCode") + ":" + out.get("RespDesc"));
                }
            } catch (Exception ex) {
                log.error("调用转账接口出现错误", ex);
                throw new CustomException("调用转账接口出现错误");
            }
            
          */
        
        }
       
       
    }
}
