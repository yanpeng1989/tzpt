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
 * P40001 保存借款信息
 *
 * @author cyss210
 */
@Service
public class SaveLoanInfo extends UniversalService {

    @Override
    public String[] checkNull() {
        return new String[]{
            "load_title", "借款用途",
            "sum", "借款金额",
            "payment_times", "借款期限",
            "payment_method", "还款方式",
            "load_introduce", "借款详情"
        };
    }

    @Transactional
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        update("ln_save_pu_loan_loaninfo", 
                in.get("load_title"), 
                in.get("sum"), 
                in.get("payment_times"), 
                in.get("payment_method"), 
                in.get("load_introduce"), 
                session.get("loan_id"));
        update("ln_save_pu_loan_material_loaninfo", 
                in.get("load_title"), 
                in.get("sum"), 
                in.get("payment_times"), 
                in.get("payment_method"), 
                in.get("load_introduce"),
                session.get("loan_id"));
    }
}
