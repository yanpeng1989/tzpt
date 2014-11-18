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
 * P41004 保存用户公司信息
 * @author cyss210
 */
@Service
public class SaveNUserCompany extends UniversalService{
    
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

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        callService("P41000", in, inHead, out, outHead);
        Map session = getSession(inHead);
        update("nu_save_company_message", in.get("company"),
                in.get("company_property"),
                in.get("company_industry"),
                in.get("department"),
                in.get("post"),
                in.get("company_scale"),
                in.get("income"),
                in.get("join_time"),
                in.get("company_address"),
                in.get("job_tel"),
                session.get("id"));
    }
    
}
