/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.ln;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.tzpt.service.pu.util.SfrzUtil;
import java.util.Map;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cysoa.tzpt.service.pu.util.SfrzUtil;
/**
 * P40002 保存个人信息
 *
 * @author cyss210
 */
@Service
public class SavePersonalInfo extends UniversalService {

    @Override
    public String[] checkNull() {
        return new String[]{
            "name", "真实姓名",
            "id_number", "身份证号",
            "education", "教育程度",
            "marital_status", "婚姻状况",
            "present_address", "现居住地",
            "time", "居住时长",
            "birth_address", "户口地址",
            "birth_nature", "户口性质"
        };
    }

    @Transactional
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
      
        /*
        String rzresult = SfrzUtil.simpleCheckByJson(in.get("id_number").toString(), in.get("name").toString(), "zzbys_admin", "n33d2239");
            if (rzresult.equals("")) {
                throw new CustomException(400003);
            } else {
              //  sex = rzresult.split("&")[0];
               // birthday = rzresult.split("&")[1];
               // birthday=birthday.replaceAll("-", "");
            }
        */
        
        update("ln_save_pu_loan_material_personalinfo",
                in.get("name"),
                in.get("id_number"),
                in.get("education"),
                in.get("marital_status"),
                in.get("present_address"),
                in.get("time"), in.get("birth_address"),
                in.get("birth_nature"), session.get("loan_id"));
        int count = queryList("ln_get_pu_personal_message_personalinfo", session.get("id")).size();
        if (count > 0) {
            update("ln_save_pu_personal_message_personalinfo",
                    in.get("name"),
                    in.get("id_number"),
                    in.get("education"),
                    in.get("marital_status"),
                    in.get("present_address"),
                    in.get("time"), in.get("birth_address"),
                    session.get("id"));
        } else {
            update("ln_add_pu_personal_message_personalinfo",
                    session.get("id"),
                    in.get("name"),
                    in.get("id_number"),
                    in.get("education"),
                    in.get("marital_status"),
                    in.get("present_address"),
                    in.get("time"), in.get("birth_address"));
        }
    }
}
