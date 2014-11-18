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
 * P40003 保存资产信息
 *
 * @author cyss210
 */
@Service
public class SaveAssetsInfo extends UniversalService {

    @Override
    public String[] checkNull() {
        return new String[]{
            "houses_situation", "房产情况",
            "car_situation", "车辆情况",
            "other_asset", "其他财产",
            "debt_proporition", "债务比例"
        };
    }

    @Transactional
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        update("ln_save_pu_loan_material_assetsinfo",
                in.get("houses_situation"),
                in.get("car_situation"),
                in.get("other_asset"),
                in.get("debt_proporition"),
                session.get("loan_id"));
        callService("P41002", in, inHead, out, outHead);
    }
}
