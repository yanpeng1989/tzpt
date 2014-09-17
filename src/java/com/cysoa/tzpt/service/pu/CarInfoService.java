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
 * S30011 车辆信息提交
 * @author tenssion
 */
@Service
public class CarInfoService extends UniversalService{
  private static Logger log = Logger.getLogger(HouseInfoService.class);
    @Override
    public String[] checkNull() {
        return new String[]{
            "xczbh", "行车证编号" 
   
        };
    }
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
    String status="0";
    String xczbh=in.get("xczbh").toString();
    String dkbz=in.get("dkbz").toString();
    
    String fid = GlobalUtil.getUniqueNumber();     
     
     Map session = getSession(inHead);
    String id= session.get("id").toString();
     
   
        try {
          int result = update("pu_insert_car_check", new Object[]{
                  fid,id,"",fid+"-xcz",xczbh,dkbz,fid+"-cardk",status
                 });
          
           
        } catch (Exception ex) {
            ex.printStackTrace();
             throw new CustomException(999998); 
        }
    }
    
}
