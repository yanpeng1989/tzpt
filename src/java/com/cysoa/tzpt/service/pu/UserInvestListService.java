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
 *   列表
 *
 * @author tensison
 */
@Service
public class UserInvestListService extends UniversalService {

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
      
        Map session = getSession(inHead);
        String id = session.get("id").toString();
        in.put("sql", "pu_get_userInvest_list");
        //将sql里的参数按顺序放入其中
        in.put("args", new Object[]{
               id, in.get("ivt_status")
        });
        //设置分页参数，若不设置则为默认参数
        Map pagePara = null;
        if(!in.containsKey(GlobalUtil.cutPageTag)){
            pagePara = new HashMap();
        } else {
            pagePara = (Map) in.get(GlobalUtil.cutPageTag);
        }
        in.put(GlobalUtil.cutPageTag, pagePara);
        pagePara.put("row_num", 20);//设置显示行数，默认20行
        //调用分页服务
        callService("S10001", in, inHead, out, outHead);
        //获取分页结果集，循环修改err_msg
        List<Map> res = (List) out.get("result");
        for (Map m : res) {
            //sum,type,name,payment_method,payment_times,rate,least_invest,assure,begin_time,end_time,load_title,load_introduce,status,create_time
              String end_time = m.get("end_time")==null?"":m.get("end_time").toString();
              String begin_time = m.get("begin_time")==null?"":m.get("begin_time").toString();
               double rate = m.get("rate")==null?0.0:Double.parseDouble(m.get("rate").toString());
              rate=rate*12*100;
              m.put("rate",new DecimalFormat( "0.00" ).format( rate));
              m.put("end_time", end_time.equals("")?"":end_time.substring(0,10));
              m.put("begin_time", begin_time.equals("")?"":begin_time.substring(0,10));
        }
    }
}
