/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.service;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.util.GlobalUtil;
import java.net.URL;
import java.util.Map;
import org.codehaus.xfire.client.Client;
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
        Client client = null;
        String phoneNum = in.get("phone_num").toString();
        String smsMsg = in.get("sms_msg").toString();
        try {
            String id = GlobalUtil.getUniqueNumber();
            client = new Client(new URL(GlobalUtil.getSysConfig("sms_wsdl")));
            Object[] objs = client.invoke("sendSMS", new Object[]{
                GlobalUtil.getSysConfig("sms_serial"),
                GlobalUtil.getSysConfig("sms_key"),
                "",
                phoneNum.split(","),
                smsMsg,
                "", "GBK", 3, id
            });
            int code = 3000;
            if (objs != null && objs.length == 1) {
                code = Integer.parseInt(objs[0].toString());
            }
            update("st_add_sms_log", new Object[]{
                id, phoneNum, smsMsg, code
            });
        } catch (Exception ex) {
            throw new CustomException(100001);
        } finally {
            if (client != null) {
                try {
                    client.close();
                } catch (Exception ex) {
                }
            }
        }
    }
}
