/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.service;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.util.GlobalUtil;
import com.cyss.emay.util.Client;
import java.rmi.RemoteException;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * S10003 发送亿美软通短信
 *
 * @author cyss210
 */
@Service
public class SendSMSService extends UniversalService {
    private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(SendSMSService.class);

    @Override
    protected String[] checkNull() {
        return new String[]{
            "phone_num", "手机号",
            "sms_msg", "短信内容"
        };
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        String phoneNum = in.get("phone_num").toString();
        String smsMsg = in.get("sms_msg").toString();
        String id = GlobalUtil.getUniqueNumber();

        Client client = GlobalUtil.getEmayClient();
        try {
            int code = client.sendSMS(phoneNum.split(","), smsMsg, "", 5);
            update("st_add_sms_log", new Object[]{
                id, phoneNum, smsMsg, code
            });
            if(code != 0) {
                throw new CustomException("错误码：" + code);
            }
        } catch (RemoteException ex) {
            log.error("发送短信错误", ex);
            throw new CustomException("发送短信错误");
        }
    }
}
