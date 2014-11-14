/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.ln;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.StringUtil;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * P40010 更新借款状态
 *
 * @author cyss210
 */
@Service
public class UpdateLoanStatus extends UniversalService {

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        if (StringUtil.isNull("loan_id", session)) {
            throw new CustomException("非法请求");
        }
        Map loan = queryData("ln_get_loan_detail_loanid", session.get("loan_id"));
        if (StringUtil.isNull("sum", loan)
                || StringUtil.isNull("company", loan)
                || StringUtil.isNull("id_copy_front", loan)
                || StringUtil.isNull("id_copy_back", loan)
                || StringUtil.isNull("name_1", loan)
                || StringUtil.isNull("id_number", loan)) {
            throw new CustomException("请按步骤填写数据");
        }
        update("ln_update_pu_loan_status", session.get("loan_id"));
    }
}
