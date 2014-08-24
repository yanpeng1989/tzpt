/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.service;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.frame.util.StringUtil;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * S10007 验证短信验证码
 *
 * @author cyss210
 */
@Service
public class CheckSmsValidateService extends UniversalService {

    @Override
    protected String[] checkNull() {
        return new String[]{
            "sms_validate_code", "短信验证码"
        };
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        if (StringUtil.isNull(GlobalUtil.sms_validate_code_tag, session)) {
            throw new CustomException(100007); //未请求验证码
        } else {
            String code = session.get(GlobalUtil.sms_validate_code_tag).toString();
            if (in.get("sms_validate_code").toString().equals(code)) {
                out.put("sms_validate_res", true);
            } else {
                throw new CustomException(100006); //验证码错误
            }
        }
    }
}
