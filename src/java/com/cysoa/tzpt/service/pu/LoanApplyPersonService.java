/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import java.util.HashMap;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


/**
 * S30013 个人借贷申请
 * @author tenssion
 */

@Service
public class LoanApplyPersonService extends UniversalService{
  private static Logger log = Logger.getLogger(LoanApplyPersonService.class);
   
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
       log.debug("personloan..");  
     int ywflag=0;
     int tjflag=0;
     Map session = getSession(inHead);
     String id=session.get("id").toString();
     Map<String, Object> baseinfo= this.queryData("pu_get_person_msg",id);
     if(baseinfo!=null&&baseinfo.get("STATUS").toString().equals("1")){
         Map<String, Object> workinfo= this.queryData("pu_get_person_work",id);
          if(workinfo!=null&&workinfo.get("STATUS").toString().equals("1")){
                 Map<String, Object> cardinfo= this.queryData("pu_get_person_card",id);
                 if(cardinfo==null){
                 ywflag=3;
                 }else{
                 ywflag=4;
                 }
                 
            }
          else{
              //跳转工作信息
          ywflag=2;
           if(workinfo!=null){
             tjflag=1;
          }
         }
          
     }else{
         //跳转基本信息
         ywflag=1;
         if(baseinfo!=null){
             tjflag=1;
         }
     }
      out.put("ywflag", ywflag+"");
      out.put("tjflag", tjflag+"");
      
       session.put("touserindex","fromloan");
       Map map=new HashMap();
       map.put("ywflag", ywflag+"");
        map.put("tjflag", tjflag+"");
       session.putAll(map);
    }
    
}
