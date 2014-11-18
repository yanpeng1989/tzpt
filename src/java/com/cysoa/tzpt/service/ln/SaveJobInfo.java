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
 * P40004 保存工作信息
 *
 * @author cyss210
 */
@Service
public class SaveJobInfo extends UniversalService {

    @Override
    public String[] checkNull() {
        return new String[]{
            "company", "单位名称",
            "company_property", "单位性质",
            "company_industry", "行业分类",
            "department", "部门",
            "post", "职位",
            "company_scale", "规模",
            "income", "月收入",
            "join_time", "工作年限",
            "company_address", "单位地址",
            "job_tel", "公司电话"
        };
    }

    @Transactional
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);

        update("ln_save_pu_loan_material_jobinfo",
                in.get("company"),
                in.get("company_property"),
                in.get("company_industry"),
                in.get("department"),
                in.get("post"),
                in.get("company_scale"),
                in.get("income"),
                in.get("join_time"),
                in.get("company_address"),
                in.get("job_tel"),
                session.get("loan_id"));
        callService("P41003", in, inHead, out, outHead);
    }
}
