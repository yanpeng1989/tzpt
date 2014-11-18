/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.nu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * P41001 保存人员信息
 *
 * @author cyss210
 */
@Service
public class SaveNUsrPersonal extends UniversalService {

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

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        callService("P41000", in, inHead, out, outHead);
        try {
            Integer.parseInt(in.get("time").toString());
        } catch (Exception ex) {
            throw new CustomException("居住时长必须为数字");
        }
        Map session = getSession(inHead);
        update("nu_save_personal_message",
                in.get("name"),
                in.get("id_number"),
                in.get("education"),
                in.get("marital_status"),
                in.get("present_address"),
                in.get("time"), in.get("birth_address"),
                in.get("birth_nature"), session.get("id"));
    }
}
