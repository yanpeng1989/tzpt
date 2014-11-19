/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import static com.cysoa.frame.service.UniversalService.callService;
import com.cysoa.frame.util.GlobalUtil;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * S30049 项目投资二级页面
 *
 * @author tensison
 */
@Service
public class InvesttjService extends UniversalService {

    @Override
    public String[] checkNull() {
        return new String[]{
            "load_id", "项目编号"
        };
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map m = this.queryData("pu_get_pro_list", in.get("load_id"), null, null, null, null);
        String create_time = m.get("create_time") == null ? "" : m.get("create_time").toString();
        String begin_time = m.get("begin_time") == null ? "" : m.get("begin_time").toString();
        String payment_method = m.get("payment_method").toString();
        double rate = Double.parseDouble(m.get("rate").toString());
        rate = rate * 12 * 100;
        m.put("rate", new DecimalFormat("0.00").format(rate));
        m.put("create_time", create_time.substring(0, 10));
        m.put("begin_time", create_time.substring(0, 10));
        m.put("payment_method", payment_method.equals("0") ? "等额本息" : payment_method.equals("1") ? "等额本金" : "其他");
        Map<String, Object> loaderbaseinfo = this.queryData("pu_get_person_msg", m.get("id").toString());
        if (loaderbaseinfo != null) {
            for (Map.Entry<String, Object> entry : loaderbaseinfo.entrySet()) {
                m.put("loaderbase_" + entry.getKey(), entry.getValue());
            }
        }
        //查询投资人数，投资进度
        Map invRes = this.queryData("pu_get_investPoject", m.get("load_id"));
        m.put("int_tzrs", invRes.get("TZRS") == null ? "0" : invRes.get("TZRS"));
        m.put("int_tzjd", invRes.get("TZJD") == null ? "0" : invRes.get("TZJD"));
        m.put("int_ktje", invRes.get("KTJE") == null ? "0" : invRes.get("KTJE"));
        m.put("int_ytje", invRes.get("YTJE") == null ? "0" : invRes.get("YTJE"));
        out.putAll(m);
    }
}
