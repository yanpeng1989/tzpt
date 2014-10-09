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
import org.springframework.web.multipart.MultipartFile;

/**
 * S20009 个人学历信息提交
 *
 * @author tenssion
 */
@Service
public class EducationInfoService extends UniversalService {

    private static Logger log = Logger.getLogger(EducationInfoService.class);

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        String id = session.get("id").toString();
       // String name = session.get("name").toString();
        try {
            Map<String, Object> baseinfo = this.queryData("pu_get_education_check", id);

            if (in.get("byzbh") != null) {
                String status = "0";
                String byzbh = in.get("byzbh").toString();
                String xwzbh = in.get("xwzbh").toString();
                if (baseinfo != null) {
                    out.put("status", (String) baseinfo.get("STATUS"));
                    out.put("rz_msg", (String) baseinfo.get("RZ_MSG"));
                    int result = update("pu_update_education_check", new Object[]{
                         byzbh, xwzbh,"0", id
                    });
                } else {
                    int result = update("pu_insert_education_check", new Object[]{
                        id, "", ImgUploadService.getImgUploadPath(id, "byz"), byzbh, ImgUploadService.getImgUploadPath(id, "xwz"), xwzbh, "0",""
                    });

                }
            } else {
                if (baseinfo != null) {
                    ////查询
                    for (Map.Entry<String, Object> entry : baseinfo.entrySet()) {
                        System.out.println(entry.getKey() + "--->" + entry.getValue());
                        out.put(entry.getKey(), entry.getValue());
                    }
                    out.put("status", (String) baseinfo.get("STATUS"));
                    out.put("rz_msg", (String) baseinfo.get("RZ_MSG"));
                }

            }

        } catch (Exception ex) {
            ex.printStackTrace();
            //throw new CustomException(999998);
        }

    }
}
