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
 * P41003 保存用户工作信息
 *
 * @author cyss210
 */
@Service
public class SaveNUserJob extends UniversalService {

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

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        callService("P41000", in, inHead, out, outHead);
        Map session = getSession(inHead);
        try {
            Integer.parseInt(in.get("company_scale").toString());
        } catch (Exception ex) {
            throw new CustomException("规模必须为数字");
        }
        try {
            Integer.parseInt(in.get("income").toString());
        } catch (Exception ex) {
            throw new CustomException("月收入必须为数字");
        }
        update("nu_save_job_message", in.get("company"),
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
