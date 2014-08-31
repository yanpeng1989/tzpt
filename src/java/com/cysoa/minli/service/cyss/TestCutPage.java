/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.minli.service.cyss;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * S70008 测试分页例子
 *
 * @author cyss210
 */
@Service
public class TestCutPage extends UniversalService {

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        in.put("sql", "get_st_err_msg");
        //将sql里的参数按顺序放入其中
        in.put("args", new Object[]{
            in.get("err_code")
        });
        //设置分页参数，若不设置则为默认参数
        Map pagePara = null;
        if(!in.containsKey(GlobalUtil.cutPageTag)){
            pagePara = new HashMap();
        } else {
            pagePara = (Map) in.get(GlobalUtil.cutPageTag);
        }
        in.put(GlobalUtil.cutPageTag, pagePara);
        pagePara.put("row_num", 6);//设置显示行数，默认20行
        //调用分页服务
        callService("S10001", in, inHead, out, outHead);
        //获取分页结果集，循环修改err_msg
        List<Map> res = (List) out.get("result");
        for (Map m : res) {
            String errMsg = m.get("err_msg").toString();
            m.put("err_msg", "-->" + errMsg);
        }
    }
}
