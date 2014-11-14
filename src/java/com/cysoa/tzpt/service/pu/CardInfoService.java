/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

/**
 * S30015 银卡信息提交
 * @author tenssion
 */

@Service
public class CardInfoService extends UniversalService{
  private static Logger log = Logger.getLogger(HouseInfoService.class);
    @Override
    public String[] checkNull() {
        return new String[]{
       //     "kh", "卡号",
        //     "khhmc", "开户行名称",
      //       "hz", "账户姓名",    
         //      "khzhmc", "开户支行",
        };
    }
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
     
    Map session = getSession(inHead);
    String id= session.get("id").toString();
    System.out.println(in.get("method").toString()+"method");
    if(in.get("method").toString().equals("insert")){   
    String status="0";
    String kh=in.get("kh").toString();
    String khhmc=in.get("khhmc").toString();
    String hz=in.get("hz").toString();
    String khzhmc=in.get("khzhmc").toString();
    String fid = GlobalUtil.getUniqueNumber();     

      try {
          int result = update("pu_insert_bankcard_check", new Object[]{
                  fid,id,hz,kh,khhmc,khzhmc
                 });
          
           
        } catch (Exception ex) {
            ex.printStackTrace();
             throw new CustomException(999998); 
        }
    }
    else if(in.get("method").toString().equals("cx")){
          try {
             String card_number="";
             String bank="";
          Map<String, Object> cards = this.queryData("pu_get_person_card",id); 
          if(cards!=null){
            card_number=(String)cards.get("CARD_NUMBER");
            bank=(String)cards.get("BANK");
           }
          out.put("card_number", card_number);
          out.put("bank",bank);
          out.put("custId", session.get("usr_custid").toString());
        } catch (Exception ex) {
            ex.printStackTrace();
          //   throw new CustomException(999998); 
        }   
    }
    else if(in.get("method").toString().equals("delete")){
          int result = update("pu_del_person_card", new Object[]{
                   id 
                 });
    }
    }
}
