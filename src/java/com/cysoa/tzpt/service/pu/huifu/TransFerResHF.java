/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.tzpt.service.pu.InvestGive;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *
 * @author S
 */
@Service
public class TransFerResHF extends UniversalService {

    private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(TransFerResHF.class);

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        try {
            String code = in.get("RespCode").toString();
            String ordId=in.get("OrdId").toString();
            log.debug("code!!!!!!!!!!!!!!!!!" + code);
            if ("000".equals(code)) {
                log.info("调用接口成功");
                String invest_id = in.get("MerPriv").toString();
                String CreditDealAmt = in.get("CreditDealAmt").toString();
                try {
                    int result1 = update("pu_trans_invest", new Object[]{
                        session.get("id").toString(), ordId, invest_id
                    });
                    int result2 = update("pu_trans_everyinvest", new Object[]{
                        session.get("usr_custid").toString(),ordId 
                    });
                    int result3 = update("pu_update_invest_status", new Object[]{
                        "5", Double.parseDouble(CreditDealAmt), ordId
                    });

                } catch (Exception ex) {
                    ex.printStackTrace();
                    throw new CustomException(999998);
                }

 
            } else {
                log.error("调用债权转让接口出现错误" + out.get("RespCode") + ":" + out.get("RespDesc"));
              //  throw new CustomException("调用还款接口出现错误" + out.get("RespCode") + ":" + out.get("RespDesc"));
            }
        } catch (Exception ex) {
            log.error("调用债权转让接口出现错误", ex);
          //  throw new CustomException("调用债权转让接口出现错误");
        }
 
      //  out.put("result", "RECV_ORD_ID_" + in.get("OrdId"));
        out.put("to_jsp", "pc/user/index.do");
    }
}
