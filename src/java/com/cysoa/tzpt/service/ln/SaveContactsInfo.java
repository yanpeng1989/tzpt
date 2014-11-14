/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.ln;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import java.util.Map;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * P40005 保存联系人信息
 *
 * @author cyss210
 */
@Service
public class SaveContactsInfo extends UniversalService {

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
            "tel_3", "联系人2移动电话",};
    }

    @Transactional
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        update("ln_save_pu_loan_material_contactsinfo",
                in.get("name_1"),
                in.get("relationship_1"),
                in.get("tel_1"),
                in.get("name_2"),
                in.get("relationship_2"),
                in.get("tel_2"),
                in.get("name_3"),
                in.get("relationship_3"),
                in.get("tel_3"),
                session.get("loan_id"));
        int count = queryList("ln_get_pu_personnal_contacts", session.get("id")).size();
        if (count > 0) {
            update("ln_save_pu_personnal_contacts",
                    in.get("name_1"),
                    in.get("tel_1"),
                    in.get("name_2"),
                    in.get("tel_2"),
                    in.get("name_3"),
                    in.get("tel_3"),
                    session.get("id"));
        } else {
            update("ln_add_pu_personnal_contacts",
                    session.get("id"),
                    in.get("name_1"),
                    in.get("tel_1"),
                    in.get("name_2"),
                    in.get("tel_2"),
                    in.get("name_3"),
                    in.get("tel_3"));
        }
    }
}
