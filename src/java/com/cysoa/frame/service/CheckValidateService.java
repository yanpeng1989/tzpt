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
 * S10005 判断图片验证码是否正确
 * @author cyss210
 */
@Service
public class CheckValidateService extends UniversalService{
    @Override
    public String[] checkNull() {
        return new String[]{
            "validate_code", "验证码"
        };
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        String code = in.get("validate_code").toString();
        Map session = getSession(inHead);
        if(!StringUtil.isNull(GlobalUtil.validate_code_tag, session)){
            String serverCode = session.get(GlobalUtil.validate_code_tag).toString();
            if(code.equals(serverCode)) {
                out.put("validate_res", true);
            } else {
                out.put("validate_res", false);
                throw new CustomException(100006); //验证码错误
            }
        } else {
            out.put("validate_res", false); //未请求验证码
            throw new CustomException(100007);
        }
    }
    
}
