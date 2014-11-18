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
        update("nu_save_user_single_file", new String[]{
            imgTag
        }, new Object[]{
            reqUrl, session.get("id")
        });
    }
}
