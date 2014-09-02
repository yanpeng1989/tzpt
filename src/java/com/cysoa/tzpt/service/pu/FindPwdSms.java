/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import java.util.Map;
import org.springframework.stereotype.Service;
/**
 * S20004 短信找回密码
 * @author Administrator
 */
@Service
public class FindPwdSms extends  UniversalService{
  @Override
    public String[] checkNull() {
        return new String[]{
            "tel", "手机号",
            
        };
    }
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        String tel= in.get("tel").toString();
        //验证用户是否存在
        Map<String, Object> user = queryData("pu_get_one_user", tel);
        if(user == null) {
            throw new CustomException(100004); //用户不存在
        }
        //发送短信验证码
        
        //记录短信验证码
                
      
       //  throw new CustomException(100004); //用户不存在
       
    }
    
}
