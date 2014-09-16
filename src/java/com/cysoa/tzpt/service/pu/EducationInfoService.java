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
        String status = "0";
        String byzbh = "";
        if (in.get("byzbh") != null) {
            byzbh = in.get("byzbh").toString();

            String xwzbh = "";
            if (in.get("xwzbh") != null) {
                byzbh = in.get("xwzbh").toString();
            }
            String regid = in.get("regid").toString();

            Map session = getSession(inHead);
            String name = "";
            if (session.get("name") != null) {
                name = session.get("name").toString();
            }
            log.info(name+"!!!!!!");
            try {
                int result = update("pu_insert_education_check", new Object[]{
                    regid, name, regid+"-byz", byzbh, regid+"-xwz", xwzbh, "0"
                });


            } catch (Exception ex) {
                ex.printStackTrace();
                throw new CustomException(999998);
            }


        }
    }
}
