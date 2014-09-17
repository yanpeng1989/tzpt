/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.AES;
import com.cysoa.frame.util.GlobalUtil;
import java.util.Map;
import java.util.logging.Level;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * S20001 登录测试
 * @author Administrator
 */
@Service
public class MyLoginService extends UniversalService{
    
    private static Logger log = Logger.getLogger(MyLoginService.class);

    @Override
    public String[] checkNull() {
        return new String[]{
         
        };
    }
    
    
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        String username = in.get("tel").toString();
        String pwd = in.get("pwd").toString();
        if(in.get("yzm")==null)   throw new CustomException(100006); //验证码错误
        String yzm = in.get("yzm").toString();
        in.put("validate_code", yzm);
        callService("S10005", in, inHead, out, outHead); 
        Map<String, Object> user = queryData("pu_get_one_user", username);
        if(user == null) {
            throw new CustomException(100004); //用户不存在
        }
        String dbPwd = user.get("PWD").toString();
        try {
            dbPwd=AES.decrypt(dbPwd);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        System.out.println(dbPwd);
        
        if(!dbPwd.equals(pwd)) {
            throw new CustomException(100008); //密码错误
        } 
         Map session = getSession(inHead);
         session.putAll(user);
         session.put(GlobalUtil.login_tag,user.get("TEL").toString() );
          
         //log.debug("登陆成功！");
    }
    
}
