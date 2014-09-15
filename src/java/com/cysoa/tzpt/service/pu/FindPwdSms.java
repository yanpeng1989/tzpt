/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.AES;
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
        String resetfs=in.get("resetfs")==null?"":in.get("resetfs").toString();
        String yzfs=in.get("yzfs")==null?"":in.get("yzfs").toString();
        
        if(!yzfs.equals("")){
              if(yzfs.equals("sms")){
               //发送短信验证码
         //记录短信验证码
       //  throw new CustomException(100004); //用户不存在
              }
              else if(yzfs.equals("mibao")){
                  String id=(String)user.get("ID");
                  Map<String, Object> mibao = queryData("pu_get_pwd_protect", id);
                  if(mibao!=null){
                     out.put("qu1", (String)mibao.get("QUESTION_1"));
                        out.put("qu2", (String)mibao.get("QUESTION_2"));
                           out.put("qu3", (String)mibao.get("QUESTION_3"));
                              out.put("an1", (String)mibao.get("ANSWER_1"));
                              out.put("an2", (String)mibao.get("ANSWER_2"));
                              out.put("an3", (String)mibao.get("ANSWER_3"));
                              out.put("tel", tel);
                  }
                  else{
                   throw new CustomException(400001);   
                  }         
              }
         
        }
        if(!resetfs.equals("")){
         if(resetfs.equals("sms")){
               //发送短信验证码
               //记录短信验证码
               //throw new CustomException(100004); //用户不存在
                String id=(String)user.get("ID");
                resetpwd(id,in.get("newpwd3").toString());
              }
         else if(resetfs.equals("mibao")){
                  String id=(String)user.get("ID");
                  Map<String, Object> mibao = queryData("pu_get_pwd_protect",id);
                   if(!((String)mibao.get("ANSWER_1")).equals(in.get("an1").toString())||!((String)mibao.get("ANSWER_2")).equals(in.get("an2").toString())||!((String)mibao.get("ANSWER_3")).equals(in.get("an3").toString())){
                     throw new CustomException(400002); 
                  }else{
                  //重置密码
                   resetpwd(id,in.get("newpwd1").toString());
                  }
                  
                  
              }
        }
    }
    public void  resetpwd(String id,String pwd) throws CustomException 
    {    
         try {
        int result = update("pu_reset_pwd", new Object[]{
                   AES.encrypt(pwd),id
          });
                
          } catch (Exception ex) {
            ex.printStackTrace();
            throw new CustomException(999998); 
        }
       
         
    }    
}
