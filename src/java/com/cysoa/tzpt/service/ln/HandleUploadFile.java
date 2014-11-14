/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.ln;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import java.util.Map;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 * S40000 处理借贷上传文件
 *
 * @author cyss210
 */
@Service
public class HandleUploadFile extends UniversalService {

    private static final String[] personnalMessage = new String[]{
        "id_copy_front", "id_copy_back"
    };
    private static final String[] personnalCheck = new String[]{
        "credit_statement", "bank_statement", "job_statement", "rests", "utility_bills", "tel_bills"
    };
    private static final String[] houseCheck = new String[]{
        "house_card_copy"
    };
    private static final String[] educationCheck = new String[]{
        "graduation"
    };
    private static final String[] companyCheck = new String[]{
        "back_letter"
    };

    @Override
    public String[] checkNull() {
        return new String[]{
            "img_tag", "图片标记"
        };
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        String imgTag = in.get("img_tag").toString();
        MultipartFile file = (MultipartFile) in.get(imgTag);
        String oriName = file.getOriginalFilename();
        String type = oriName.substring(oriName.lastIndexOf("."));
        String fname = session.get("loan_id") + "_" + imgTag + type;
        String reqUrl = "/" + GlobalUtil.getSysConfig("root_name") + GlobalUtil.getSysConfig("fileupload_path") + "/" + fname;
        try {
            GlobalUtil.saveFile(fname, file.getInputStream());
            out.put("req_url", reqUrl);
        } catch (Exception ex) {
            throw new CustomException("保存文件失败");
        }
        update("ln_save_pu_loan_material_file", new String[]{
            imgTag
        }, new Object[]{
            reqUrl, session.get("loan_id")
        });

        if (isContain(imgTag, personnalMessage)) {
            update("ln_save_pu_personnal_message_file", new String[]{imgTag}, new Object[]{
                reqUrl, session.get("id")
            });
        } else if (isContain(imgTag, personnalCheck)) {
            update("ln_save_pu_personnal_check_file", new String[]{imgTag}, new Object[]{
                reqUrl, session.get("id")
            });
        } else if (isContain(imgTag, houseCheck)) {
            update("ln_save_pu_house_check_file", new String[]{imgTag}, new Object[]{
                reqUrl, session.get("id")
            });
        } else if (isContain(imgTag, educationCheck)) {
            update("ln_save_pu_education_check_file", new String[]{imgTag}, new Object[]{
                reqUrl, session.get("id")
            });
        } else if (isContain(imgTag, companyCheck)) {
            update("ln_save_pu_company_check_file", new String[]{imgTag}, new Object[]{
                reqUrl, session.get("id")
            });
        }
    }

    private boolean isContain(String key, String[] arr) {
        for (String item : arr) {
            if (item.equals(key)) {
                return true;
            }
        }
        return false;
    }
}
