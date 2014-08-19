/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.service;

import cn.emay.sdk.client.api.Client;
import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.util.EmayFactory;
import com.cysoa.frame.util.GlobalUtil;
import java.net.URL;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * S10003 发送亿美软通短信
 *
 * @author cyss210
 */
@Service
public class SendSMSService extends UniversalService {

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
        Client client = EmayFactory.getEmayClient();
        String id = GlobalUtil.getUniqueNumber();
        int code = client.sendSMS(phoneNum.split(","), smsMsg, 3);
        update("st_add_sms_log", new Object[]{
            id, phoneNum, smsMsg, code
        });
    }
}
