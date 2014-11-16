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
 * S30017 项目投资列表
 *
 * @author tensison
 */
@Service
public class ProListService extends UniversalService {

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        in.put("sql", "pu_get_pro_list");
        //将sql里的参数按顺序放入其中
        int rate1=0; int rate2=0;
        
        String sxtzqx=in.get("sxtzqx")==null?"":in.get("sxtzqx").toString();
        String  orderje=in.get("orderje")==null?"":in.get("orderje").toString();
       if(sxtzqx.equals("1")){
         rate1=1;rate2=12;
        }
       if(sxtzqx.equals("2")){
        rate1=12;rate2=24;
        }
       if(sxtzqx.equals("3")){
        rate1=24;rate2=36;
        }
       if(orderje.equals("1")){
        in.put("sql", "pu_get_pro_list_asc");
       }
       if(orderje.equals("2")){
        in.put("sql", "pu_get_pro_list_desc");
       }
        in.put("args", new Object[]{
                    in.get("load_id"),sxtzqx.equals("")?null:rate1,sxtzqx.equals("")?null:rate2,in.get("sxje1"),in.get("sxje2")
                });
        //设置分页参数，若不设置则为默认参数
        Map pagePara = null;
        if (!in.containsKey(GlobalUtil.cutPageTag)) {
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
            String create_time = m.get("create_time")==null?"":m.get("create_time").toString();
            String begin_time =m.get("begin_time")==null?"":m.get("begin_time").toString();
            String payment_method = m.get("payment_method").toString();
            double rate = Double.parseDouble(m.get("rate").toString());
            //rate=rate*12;
            rate=rate*12*100;
            m.put("rate",new DecimalFormat( "0.00" ).format( rate));
            m.put("create_time", create_time.substring(0, 10));
            m.put("begin_time", create_time.substring(0, 10));
            m.put("payment_method", payment_method.equals("0") ? "等额本息" : payment_method.equals("1") ? "等额本金" : "其他");
           System.out.println("!!!!!!!"+m.get("id").toString());
            Map<String, Object> loaderbaseinfo = this.queryData("pu_get_person_msg", m.get("id").toString());
         //   Map<String, Object> loaderworkinfo = this.queryData("pu_get_person_work", m.get("id").toString());
            if (loaderbaseinfo != null  ) {
                for (Map.Entry<String, Object> entry : loaderbaseinfo.entrySet()) {
                    m.put("loaderbase_" + entry.getKey(), entry.getValue());
                }
                //m.put("loaderbase_marital_status",loaderbaseinfo.get("marital_status").equals("0"));
            /*    for (Map.Entry<String, Object> entry : loaderworkinfo.entrySet()) {
                    m.put("loaderwork_" + entry.getKey(), entry.getValue());
                }*/
            }
          //查询投资人数，投资进度
            Map invRes=  this.queryData("pu_get_investPoject", m.get("load_id"));
            System.out.println("@@@@@@@"+invRes.get("TZJD"));
             m.put("int_tzrs", invRes.get("TZRS")==null?"0":invRes.get("TZRS"));
             m.put("int_tzjd", invRes.get("TZJD")==null?"0":invRes.get("TZJD"));
             m.put("int_ktje",invRes.get("KTJE")==null?"0":invRes.get("KTJE"));  
             m.put("int_ytje",invRes.get("YTJE")==null?"0":invRes.get("YTJE"));
        }
    }
}
