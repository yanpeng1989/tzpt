/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

/**
 * S20007 工作信息提交
 * @author tenssion
 */
@Service
public class SetPwdProtection extends UniversalService{
  private static Logger log = Logger.getLogger(SetPwdProtection.class);
    @Override
    public String[] checkNull() {
        return new String[]{
              
        };
    }
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
   
       Map session = getSession(inHead);
      String id= session.get("id").toString();
       
        try {
              Map<String, Object> mibao = queryData("pu_get_pwd_protect", id);
                 if(mibao!=null){
                        out.put("qu1", (String)mibao.get("QUESTION_1"));
                        out.put("qu2", (String)mibao.get("QUESTION_2"));
                        out.put("qu3", (String)mibao.get("QUESTION_3"));
                          
                        
                  } 
              else{
                   if(in.get("qu1")!=null){
                       
                   int result = update("pu_insert_pwd_protect", new Object[]{
                    id,in.get("qu1").toString(),in.get("an1").toString(),in.get("qu2").toString(),in.get("an2").toString(),in.get("qu3").toString(),in.get("an3").toString() 
                    }); 
                   out.put("insert", "success");
                     }
                    
                     }
             
       
           
        } catch (Exception ex) {
            // ex.printStackTrace();
           //  throw new CustomException(999998); 
        }
        
        
    }
    
}
