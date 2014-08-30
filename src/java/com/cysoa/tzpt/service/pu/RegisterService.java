/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import static com.cysoa.frame.service.UniversalService.callService;
import com.cysoa.frame.util.AES;
import com.cysoa.frame.util.GlobalUtil;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

/**
 * S20002 注册
 * @author tenssion
 */
@Service
public class RegisterService extends UniversalService{

 
    private static Logger log = Logger.getLogger(RegisterService.class);

    @Override
    public String[] checkNull() {
        return new String[]{
            "tel", "电话号码",
            "pwd1", "密码",
            "pwd2", "确认密码",
            "telyzm","电话验证码",
            "email","邮箱"
        };
    }
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        String tel = in.get("tel").toString();
        String pwd1 = in.get("pwd1").toString();
        String pwd2 = in.get("pwd2").toString();
        String telyzm = in.get("telyzm").toString();
        String email = in.get("email").toString();
        System.out.println(tel+pwd1+pwd2+telyzm+email);
        String id = GlobalUtil.getUniqueNumber();    
        try {
            // in.put("validate_code", yzm);
             //callService("S10005", in, inHead, out, outHead); 
            int result = update("pu_insert_user", new Object[]{
                   id,email,tel,AES.encrypt(pwd1),timeStamp,"",""
                 });
           //  if(user == null) {
             //    throw new CustomException(100004); //用户不存在
             //}
           //  String dbPwd = user.get("PASSWORD").toString();
             //if(!dbPwd.equals(pwd)) {
              //} 
             //}
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    
    }
    
}
