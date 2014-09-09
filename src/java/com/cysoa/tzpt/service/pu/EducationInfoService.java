/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.AES;
import com.cysoa.frame.util.GlobalUtil;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


/**
 * S20009 个人学历信息提交
 * @author tenssion
 */
@Service
public class EducationInfoService extends UniversalService{
  private static Logger log = Logger.getLogger(EducationInfoService.class);
    @Override
    public String[] checkNull() {
        return new String[]{
            "bh", "房产编号" 
   
        };
    }
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
    String status="0";
    String bh=in.get("bh").toString();
    String bz=in.get("bz").toString();
    String fid = GlobalUtil.getUniqueNumber();     
     
     Map session = getSession(inHead);
  //   String id= session.get("id").toString();
    String id=   "1409240552049";
   
        try {
          int result = update("pu_insert_education_check", new Object[]{
                  
                 });
          
           
        } catch (Exception ex) {
            ex.printStackTrace();
             throw new CustomException(999998); 
        }
    }
    
}
