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
 * S30010 个人房产信息提交
 *
 * @author tenssion
 */
@Service
public class HouseInfoService extends UniversalService {

    private static Logger log = Logger.getLogger(HouseInfoService.class);

    @Override
    public String[] checkNull() {
        return new String[]{ //"bh", "房产编号" 
        };
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        String id = session.get("id").toString();
        try {
            Map<String, Object> houseinfo = this.queryData("pu_get_house_check", id);
            if (in.get("bh") != null) {
                String status = "0";
                String bh = in.get("bh").toString();
                String dkbz = in.get("dkbz").toString();
                String fid = GlobalUtil.getUniqueNumber();
                int result = 0;
                if (houseinfo != null) {
                    out.put("status", (String) houseinfo.get("STATUS"));
                    out.put("rz_msg", (String) houseinfo.get("RZ_MSG"));
                    result = update("pu_update_house_check", new Object[]{
                        bh, dkbz, "0", id
                    });
                } else {
                    result = update("pu_insert_house_check", new Object[]{
                        fid, id, ImgUploadService.getImgUploadPath(id, "fcz"), bh, dkbz, ImgUploadService.getImgUploadPath(id, "fcdk"), status,""
                    });
                }
                if (result == 0) {
                    throw new CustomException(999998);
                }
            } else {
                if (houseinfo != null) {
                    ////查询
                    for (Map.Entry<String, Object> entry : houseinfo.entrySet()) {
                        System.out.println(entry.getKey() + "--->" + entry.getValue());
                        out.put(entry.getKey(), entry.getValue());
                    }
                    out.put("status", (String) houseinfo.get("STATUS"));
                    out.put("rz_msg", (String) houseinfo.get("RZ_MSG"));
                }

            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new CustomException(999998);
        }
    }
}
