/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import com.cysoa.frame.beans.MapFactory;
import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import static com.cysoa.frame.service.UniversalService.callService;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.tzpt.service.pu.ImgUploadService;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.json.JSONException;
import org.springframework.stereotype.Service;

/**
 *
 * @author S30032
 */
@Service
public class UserRepayMentReqHF extends UniversalService {

    private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(UserRepayMentReqHF.class);

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        String load_every_id = in.get("load_every_id").toString();
        String load_id = in.get("load_id").toString();
        String OrdId = GlobalUtil.getUniqueNumber() + "";//订单号
        String num = in.get("num").toString();
        String InCustId = "";
        String Fee = "0.00";  //扣款手续费
        in.put("Fee", Fee);
        Date dt = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String order_date = sdf.format(dt);

        List<Map<String, Object>> list = queryList("pu_get_all_invest_people", new Object[]{load_id, num});
        if (list == null || list.size() == 0) {
            throw new CustomException(400006); // 
        }
        for (Map m : list) {
            // Map<String, Object> userCustId = queryData("pu_get_custidbyuserid", m.get("invest_person_id").toString());
            in.put("OrdId", OrdId);
            in.put("OutCustId", session.get("usr_custid").toString());
            in.put("OrdDate", order_date);
            in.put("SubOrdId", m.get("invest_id"));
            in.put("SubOrdDate", sdf.format((Date) m.get("create_time")));
            Double TransAmt = Double.parseDouble(m.get("invest_sum").toString());
            DecimalFormat df = new DecimalFormat("#.00");
            in.put("TransAmt", df.format(TransAmt));
            in.put("InCustId", (String) m.get("invest_person_id"));//?????
            in.put("DivCustId", "6000060000337675");
            in.put("DivAcctId", "MDT000001");
            //  in.put("DivDetails", "[{\"DivCustId\":\"6000060000337675\",\"DivAcctId\":\"MDT000001\",\"DivAmt\":\"" + Fee + "\"}]");
            // in.put("DivAmt", Fee);
            // in.put("FeeObjFlag", "I");
            callService("P80007", in, inHead, out, outHead);
            try {
                String code = out.get("RespCode").toString();
                log.debug("code!!!!!!!!!!!!!!!!!" + code);
                if ("000".equals(code)) {
                    log.info("调用还款接口成功");
                } else if ("343".equals(code)) {
                    throw new CustomException("账户余额不足，请先进行充值！");
                } else {
                    log.error("调用还款接口出现错误" + out.get("RespCode") + ":" + out.get("RespDesc"));
                    throw new CustomException("调用还款接口出现错误" + out.get("RespCode") + ":" + out.get("RespDesc"));
                }
            } catch (Exception ex) {
                log.error("调用还款接口出现错误", ex);
                throw new CustomException("调用还款接口出现错误");
            }

            this.update("pu_update_every_invest", new Object[]{m.get("invest_id"), in.get("num").toString()});

        }
        this.update("pu_update_every_load", load_every_id);
        Map<String, Object> huankuan_count = this.queryData("pu_check_huankuan_end", load_id);
        if (huankuan_count.get("TOTAL").toString().equals("0")) {
            //huankuanend
            this.update("pu_update_load", "5", load_id);
        }

        //out.put("status", dt);
    }
}
