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
public class InvestHistoryList extends UniversalService
{
     private static Logger log = Logger.getLogger(LogoutService.class);

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
           Map session = getSession(inHead);
           String load_id=in.get("load_id").toString();
           in.put("sql", "pu_invest_list_every");
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
             String create_time = m.get("create_time").toString();
              m.put("create_time",  create_time.substring(0, create_time.length()-5));
                 String tel = m.get("tel").toString();
              m.put("tel",  tel.substring(0, 3)+"****"+ tel.substring(7, tel.length()));
        }
           
    }
     
}
