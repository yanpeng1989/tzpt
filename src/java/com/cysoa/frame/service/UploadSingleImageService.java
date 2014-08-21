/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.service;

import com.cysoa.frame.exception.CustomException;
import static com.cysoa.frame.service.UniversalService.callService;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.frame.util.StringUtil;
import java.io.File;
import java.util.Map;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 * S10004 上传单张图片
 *
 * @author cyss210
 */
@Service
public class UploadSingleImageService extends UniversalService {

    private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(UploadSingleImageService.class);

    @Override
    protected String[] checkNull() {
        return new String[]{
            "image", "图片"
        };
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        MultipartFile file = (MultipartFile) in.get("image");
        String fileName = file.getOriginalFilename();
        String type = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        if (GlobalUtil.getSysConfig("suport_upload_image_type").indexOf(type) != -1) {
            String uploadPath = GlobalUtil.uploadPath;
            String imageUrl = "/" + GlobalUtil.getSysConfig("root_name") + "/" + GlobalUtil.getSysConfig("fileupload_path");
            if (!StringUtil.isNull("upload_path", in)) {
                uploadPath += File.separator + in.get("upload_path").toString().replaceAll("/", File.separator).replaceAll("\\", File.separator);
                imageUrl += in.get("upload_path").toString().replaceAll(File.separator, "/");
            }

            if (!StringUtil.isNull("custom_code", in)) {
                String code = in.get("custom_code").toString();
                callService(code, in, inHead, out, outHead);
                return;
            }
            try {
                String saveFileName = GlobalUtil.getUniqueNumber() + "."
                        + type;
                GlobalUtil.saveFile(uploadPath, saveFileName, file.getInputStream());
                out.put("img_url", imageUrl + "/" + saveFileName);
            } catch (Exception ex) {
                throw new CustomException(100003);
            }
        } else {
            throw new CustomException(100002);
        }
    }
}
