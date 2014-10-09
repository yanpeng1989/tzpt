/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.AES;
import com.cysoa.frame.util.GlobalUtil;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

/**
 * S30011 车辆信息提交
 *
 * @author tenssion
 */
@Service
public class CarInfoService extends UniversalService {

    private static Logger log = Logger.getLogger(HouseInfoService.class);

    @Override
    public String[] checkNull() {
        return new String[]{};
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {

        String fid = GlobalUtil.getUniqueNumber();
        Map session = getSession(inHead);
        String id = session.get("id").toString();
        try {
            Map<String, Object> carinfo = this.queryData("pu_get_car_check", id);
            if (in.get("xczbh") != null) {
                String status = "0";
                String xczbh = in.get("xczbh").toString();
                String dkbz = in.get("dkbz").toString();
                String name = in.get("name").toString();
                int result = 0;
                if (carinfo != null) {
                    out.put("status", (String) carinfo.get("STATUS"));
                    out.put("rz_msg", (String) carinfo.get("RZ_MSG"));
                    result = update("pu_update_car_check", new Object[]{
                        name, xczbh, dkbz, "0", id
                    });
                } else {
                    result = update("pu_insert_car_check", new Object[]{
                        fid, id, name, ImgUploadService.getImgUploadPath(id, "xcz"), xczbh, dkbz, ImgUploadService.getImgUploadPath(id, "cardk"), status, ""
                    });
                }
                if (result == 0) {
                    throw new CustomException(999998);
                }
            } else {
                if (carinfo != null) {
                    ////查询
                    for (Map.Entry<String, Object> entry : carinfo.entrySet()) {
                        System.out.println(entry.getKey() + "--->" + entry.getValue());
                        out.put(entry.getKey(), entry.getValue());
                    }
                    out.put("status", (String) carinfo.get("STATUS"));
                    out.put("rz_msg", (String) carinfo.get("RZ_MSG"));
                }

            }
 
        } catch (Exception ex) {
            ex.printStackTrace();
            //  throw new CustomException(999998); 
        }
    }
}
