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
 * P41005 保存用户文件
 *
 * @author cyss210
 */
@Service
public class SaveNUserFile extends UniversalService {

    @Override
    public String[] checkNull() {
        return new String[]{
            "id_copy_front", "身份证（正面）",
            "id_copy_back", "身份证（反面）",
            "credit_statement", "征信记录",
            "bank_statement", "收入证明",
            "job_statement", "工作证明"
        };
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        callService("P41000", in, inHead, out, outHead);
        Map session = getSession(inHead);
        update("nu_save_user_file",
                in.get("id_copy_front"),
                in.get("id_copy_back"),
                in.get("credit_statement"),
                in.get("bank_statement"),
                in.get("job_statement"),
                in.get("house_card_copy"),
                in.get("car_card_copy"),
                in.get("graduation"),
                in.get("married_card"),
                in.get("rests"),
                in.get("birth"),
                in.get("utility_bills"),
                in.get("tel_bills"),
                in.get("debt_proporition"),
                in.get("others"),
                in.get("back_letter"),
                in.get("capital_report"),
                in.get("company_loan_explain"),
                in.get("business_card"),
                in.get("organization_card"),
                in.get("tax_card"),
                session.get("id"));
    }
}
