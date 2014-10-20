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
 * S30038  
 *
 * @author tenssion
 */
@Service
public class UserStatementService extends UniversalService {

    private static Logger log = Logger.getLogger(UserStatementService.class);
 
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
    String method=in.get("method").toString();
    String ywlx=in.get("ywlx").toString();
     Map session = getSession(inHead);
     String id = session.get("id").toString();
    if(ywlx.equals("person")){
    Map<String, Object> cxinfo=null; 
     int result = 0;
     if(method.equals("tj")){
          //   String fid = GlobalUtil.getUniqueNumber();
          try{    
            cxinfo = this.queryData("pu_get_person_check", id);
          }catch(Exception e){
          }   
          if(cxinfo==null){
          result = update("pu_insert_person_check", new Object[]{
          id,  ImgUploadService.getImgUploadPath(id, "stat1"),  ImgUploadService.getImgUploadPath(id, "stat2"),  ImgUploadService.getImgUploadPath(id, "stat3"),  ImgUploadService.getImgUploadPath(id, "stat4"),  ImgUploadService.getImgUploadPath(id, "stat5"),  ImgUploadService.getImgUploadPath(id, "stat6"),"0"
          });
          }
         
     } 
     else if(method.equals("cx")){
         try{    
              cxinfo = this.queryData("pu_get_person_check", id);
          }catch(Exception e){
          }   
          if(cxinfo!=null){
               out.put("result", "1");
          }else{
               out.put("result", "0");
          }
     }
    }
    
    else if(ywlx.equals("company")){
    
    }else{
    
    }
        
    }
}
