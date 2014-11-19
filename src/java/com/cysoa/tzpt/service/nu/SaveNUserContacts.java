/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.nu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import static com.cysoa.frame.service.UniversalService.callService;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * P41007 保存用户联系人
 * @author cyss210
 */
@Service
public class SaveNUserContacts extends UniversalService {

    @Override
    public String[] checkNull() {
        return new String[]{
            "name_1", "直系亲属姓名",
            "relationship_1", "直系亲属关系",
            "tel_1", "直系亲属移动电话",
            "name_2", "联系人1姓名",
            "relationship_2", "联系人1关系",
            "tel_2", "联系人1移动电话",
            "name_3", "联系人2姓名",
            "relationship_3", "联系人2关系",
            "tel_3", "联系人2移动电话"};
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        callService("P41000", in, inHead, out, outHead);
        Map session = getSession(inHead);
        update("nu_save_user_contacts", in.get("name_1"),
                in.get("relationship_1"),
                in.get("tel_1"),
                in.get("name_2"),
                in.get("relationship_2"),
                in.get("tel_2"),
                in.get("name_3"),
                in.get("relationship_3"),
                in.get("tel_3"),
                session.get("id"));
    }
}
