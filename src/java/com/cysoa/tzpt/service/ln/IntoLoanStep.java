/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.ln;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.frame.util.StringUtil;
import java.util.Map;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * P40000 进入申请借款流程
 *
 * @author cyss210
 */
@Service
public class IntoLoanStep extends UniversalService {

    @Override
    public String[] checkNull() {
        return new String[]{
            "step", "_step",
            "loan_type", "类型"
        };
    }

    @Transactional
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        out.putAll(in);
        Map session = getSession(inHead);
        if (StringUtil.isNull("usr_custid", session)) {
            out.put("_to_jsp", "/pc/register_hf");
        } else {
            String step = in.get("step").toString();
            String loanType = in.get("loan_type").toString();
            String loanTypeCode = null;
            if ("personal".equals(loanType)) {
                loanTypeCode = "0";
            } else if ("company".equals(loanType)) {
                loanTypeCode = "1";
            } else {
                outHead.put("res_desc", "非法请求类型");
                out.put("_to_jsp", "/pc/register_hf");
                return;
            }
            String uid = session.get("id").toString();
            String loadId = null;
            if ("1".equals(step)) {
                Map m = queryData("ln_get_count_loan_status", uid);
                int count = Integer.parseInt(m.get("c").toString());
                if (count == 0) {
                    loadId = GlobalUtil.getUniqueNumber();
                    update("ln_init_loan_step_1", loadId, uid, loanTypeCode);
                    update("ln_init_loan_step_2", GlobalUtil.getUniqueNumber(), loadId, uid);
                } else {
                    Map _m = queryData("ln_get_pu_loan", uid);
                    loadId = _m.get("load_id").toString();
                }
                session.put("loan_id", loadId);
            }
            if (StringUtil.isNull("loan_id", session)) {
                outHead.put("res_desc", "非法请求布数");
                out.put("_to_jsp", "/pc/error_tip");
                return;
            }
            loadId = session.get("loan_id").toString();
            Map m = queryData("ln_get_pu_loan_by_loanid", loadId);
            out.putAll(m);
            if ("2".equals(step) && StringUtil.isNull("id_number", out)) {
                Map personalM = queryData("ln_get_pu_personal_message_personalinfo", uid);
                if (personalM != null) {
                    out.putAll(personalM);
                }
            } else if ("4".equals(step) && "personal".equals(loanType) && StringUtil.isNull("company", out)) {
                Map jobM = queryData("ln_get_pu_personal_job", uid);
                if (jobM != null) {
                    out.putAll(jobM);
                }
            } else if ("5".equals(step) && "personal".equals(loanType) && StringUtil.isNull("name_1", out) || "4".equals(step) && "company".equals(loanType) && StringUtil.isNull("name_1", out)) {
                Map contactsM = queryData("ln_get_pu_personnal_contacts", uid);
                if (contactsM != null) {
                    out.putAll(contactsM);
                }
            } else if ("5".equals(step) && "company".equals(loanType) && StringUtil.isNull("id_copy_front", out)) {
                Map fileM = queryData("ln_get_pu_personnal_message_file", uid);
                if (fileM != null) {
                    out.putAll(fileM);
                }
                fileM = queryData("ln_get_pu_personnal_check_file", uid);
                if (fileM != null) {
                    out.putAll(fileM);
                }
                if (!StringUtil.isNull("id_copy_front", out)) {
                    update("ln_save_pu_loan_material_file", new String[]{
                        "id_copy_front"
                    }, new Object[]{
                        out.get("id_copy_front").toString(), loadId
                    });
                }
                if (!StringUtil.isNull("id_copy_back", out)) {
                    update("ln_save_pu_loan_material_file", new String[]{
                        "id_copy_back"
                    }, new Object[]{
                        out.get("id_copy_back").toString(), loadId
                    });
                }
            }
        }
    }
}
