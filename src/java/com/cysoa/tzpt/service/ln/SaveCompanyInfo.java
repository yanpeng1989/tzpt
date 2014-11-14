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
 * P40006 保存公司信息
 * @author cyss210
 */
@Service
public class SaveCompanyInfo extends UniversalService {

    @Override
    public String[] checkNull() {
        return new String[]{
            "company", "企业名称",
            "company_property", "企业性质",
            "post", "担任职务",
            "join_time", "年限",
            "income", "月收入(元)",
            "company_scale", "规模(人)",
            "company_address", "企业地址",
            "job_tel", "工作电话"
        };
    }

    @Transactional
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        update("ln_save_pu_loan_material_companyinfo",
                in.get("company"),
                in.get("company_property"),
                in.get("post"),
                in.get("join_time"),
                in.get("income"),
                in.get("company_scale"),
                in.get("company_address"),
                in.get("job_tel"),
                session.get("loan_id"));
    }
}
