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
 * S30008 工作信息提交
 * @author tenssion
 */
@Service
public class WorkInfoService extends UniversalService{
  private static Logger log = Logger.getLogger(PersonInfoService.class);
    @Override
    public String[] checkNull() {
        return new String[]{
            /*"company", "单位名称",
            "address", "单位地址",
            "department", "部门",
            "jobtel","工作电话",
            "post","职位",
            "jobname","工作名称",
            "jobtime","工作年限",
            "property","工作单位性质",
            "industry","企业所处行业",
            "scale","企业规模",
            "income","月收入"*/
   
        };
    }
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
     Map session = getSession(inHead);
     String id = session.get("id").toString();
     try {
      Map<String, Object> baseinfo = this.queryData("pu_get_person_work", id);
             if (in.get("company") != null) {
                   String status="0";
    String company=in.get("company").toString();
    String address=in.get("address").toString();
    String department= in.get("department").toString();
    String jobtel=in.get("jobtel").toString();
    String post=in.get("post").toString();
    String jobname=in.get("jobname").toString();
    
    String jobtime=in.get("jobtime").toString();
    String property=in.get("property").toString();       
    String industry=in.get("industry").toString();
    String scale=in.get("scale").toString();
    int income=Integer.parseInt(in.get("income").toString());
                    if (baseinfo != null) {
                    out.put("status", (String) baseinfo.get("STATUS"));
                    out.put("rz_msg", (String) baseinfo.get("RZ_MSG"));
                    int result = update("pu_update_job_info", new Object[]{
                income,company,department,post,jobname,jobtime,jobtel,property,industry,scale,address,"0", id
                 });
                    }
                    else{
                  int result = update("pu_insert_job_info", new Object[]{
                  id,income,company,department,post,jobname,jobtime,jobtel,property,industry,scale,address,"0",""
                 });
                    }
              }
             else{
                if (baseinfo != null) {
                  ////查询
                 for (Map.Entry<String, Object> entry : baseinfo.entrySet()) {
                        System.out.println(entry.getKey() + "--->" + entry.getValue());
                        out.put(entry.getKey(), entry.getValue());
                 }
                 out.put("status", (String) baseinfo.get("STATUS"));
                 out.put("rz_msg", (String) baseinfo.get("RZ_MSG"));
                 }
             
             }
             
        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new CustomException(999998);
        }  
     
     
     
        
   
        
        
    }
    
}
