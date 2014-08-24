/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.service;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.util.GlobalUtil;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * S10006 发送亿美软通短信验证码
 *
 * @author cyss210
 */
@Service
public class SendValidateMsgService extends UniversalService {

    @Override
    protected String[] checkNull() {
        return new String[]{
            "phone_num", "手机号"
        };
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        String code = "";
        for (int i = 0; i < 6; i++) {
            code += (int) Math.random() * 10;
        }
        String msg = GlobalUtil.getSysConfig("sms_validate_msg").replace("!#!", code);
        in.put("sms_msg", msg);
        callService("S10003", in, inHead, out, outHead);
        getSession(inHead).put(GlobalUtil.sms_validate_code_tag, code);
    }
}
