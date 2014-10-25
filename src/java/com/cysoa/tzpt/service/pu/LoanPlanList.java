/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException; 
import com.cysoa.frame.service.UniversalService;
import static com.cysoa.frame.service.UniversalService.callService;
import com.cysoa.frame.util.GlobalUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

/**
 * S30036  
 * @author Administrator
 */
@Service
public class LoanPlanList extends UniversalService
{
     private static Logger log = Logger.getLogger(LogoutService.class);

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
           Map session = getSession(inHead);
          // String id=session.get("id").toString();
           String load_id=in.get("load_id").toString();
           in.put("sql", "pu_get_everyload");
        //将sql里的参数按顺序放入其中
        in.put("args", new Object[]{
            load_id 
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
            //String errMsg = m.get("err_msg").toString();
            //m.put("err_msg", "-->" + errMsg);
        }
           
    }
     
}
