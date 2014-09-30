/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.AES;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.tzpt.service.pu.util.SfrzUtil;

import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

/**
 * S30006 个人基本信息提交
 *
 * @author tenssion
 */
@Service
public class PersonInfoService extends UniversalService {

    private static Logger log = Logger.getLogger(PersonInfoService.class);

    @Override
    public String[] checkNull() {
        return new String[]{ /*   "truename", "真实姓名",
         "sfzmhm", "身份证号",
         "sex", "性别",
         "marital_status","婚姻状态",
         "education","教育程度",
         "birthday","出生日期",
         "birth_address","籍贯",
         "present_address","现居地",
         "jztime","居住时间" 
         */};
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        String id = session.get("id").toString();

        Map<String, Object> baseinfo = this.queryData("pu_get_person_msg", id);
        if (in.get("truename") != null) {
            String status = "0";
            String name = in.get("truename").toString();
            String id_number = in.get("sfzmhm").toString();
           /* String sex = in.get("sex").toString();
            String birthday = in.get("birthday").toString();
            birthday = birthday.replaceAll("-", "");*/
            String sex="";
            String birthday="";
            String marital_Status = in.get("marital_status").toString();
            String education = in.get("education").toString();
            String bith_address = in.get("birth_address").toString();
            String present_address = in.get("present_address").toString();
            String time = in.get("jztime").toString();
            String name_1 = in.get("name_1").toString();
            String tel_1 = in.get("tel_1").toString();
            String name_2 = in.get("name_2").toString();
            String tel_2 = in.get("tel_2").toString();
            String name_3 = in.get("name_3").toString();
            String tel_3 = in.get("tel_3").toString();
            //此处增加身份认证 
            String rzresult = SfrzUtil.simpleCheckByJson(id_number, name, "zzbys_admin", "n33d2239");
            if (rzresult.equals("")) {
                throw new CustomException(400003);
            } else {
                sex = rzresult.split("&")[0];
                birthday = rzresult.split("&")[1];
            }
            try {
                if (baseinfo != null) {
                    out.put("status", (String) baseinfo.get("STATUS"));
                    out.put("rz_msg", (String) baseinfo.get("RZ_MSG"));
                    int result1 = update("pu_update_person_info", new Object[]{
                        name, id_number, sex, marital_Status, education, birthday, bith_address, present_address, time, "", "0", id
                    });
                    int result2 = update("pu_update_person_contacts", new Object[]{
                        name_1, tel_1, name_2, tel_2, name_3, tel_3, id
                    });
                } else {
                    int result1 = update("pu_insert_person_info", new Object[]{
                        id, name, id_number, sex, marital_Status, education, birthday, bith_address, present_address, time, "/tzpt/upload/" + id + "-sfzzm.jpg", "/tzpt/upload/" + id + "-sfzfm.jpg", "/tzpt/upload/" + id + "-hkb.jpg", "0", ""
                    });

                    int result2 = update("pu_insert_person_contacts", new Object[]{
                        id, name_1, tel_1, name_2, tel_2, name_3, tel_3
                    });

                }
            } catch (Exception ex) {
                ex.printStackTrace();
                //throw new CustomException(999998);
            }
        } else {
            if (baseinfo != null) {
                try {
                    ////查询
                    for (Map.Entry<String, Object> entry : baseinfo.entrySet()) {
                        //  System.out.println(entry.getKey() + "--->" + entry.getValue());
                        out.put(entry.getKey(), entry.getValue());
                    }
                    out.put("status", (String) baseinfo.get("STATUS"));
                    out.put("rz_msg", (String) baseinfo.get("RZ_MSG"));
                    //查询常用联系人
                    Map<String, Object> contactinfo = this.queryData("pu_get_person_contacts", id);
                    if (contactinfo != null) {
                        for (Map.Entry<String, Object> entry : contactinfo.entrySet()) {
                            //  System.out.println(entry.getKey() + "--->" + entry.getValue());
                            out.put(entry.getKey(), entry.getValue());
                        }
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                    //throw new CustomException(999998);
                }
            }
        }
    }
}
