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
        return null;
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        if (in.containsKey("image")) {
            MultipartFile file = (MultipartFile) in.get("image");
            String fileName = file.getOriginalFilename();
            if (file.getSize() == 0) {
                throw new CustomException(100005);
            }
            String type = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            if (GlobalUtil.getSysConfig("suport_upload_image_type").indexOf(type) != -1) {
                String uploadPath = GlobalUtil.uploadPath;
                String imageUrl = "/" + GlobalUtil.getSysConfig("root_name") + "/" + GlobalUtil.getSysConfig("fileupload_path");
                String _uploadPath = null;
                if (!StringUtil.isNull("uploadpath", in)) {
                    _uploadPath = in.get("uploadpath").toString();
                    if (!_uploadPath.startsWith("/") || !_uploadPath.startsWith("\\")) {
                        _uploadPath = File.separator + _uploadPath;
                    }
                    //uploadPath += File.separator + _uploadPath.replaceAll("/", File.separator);
                    imageUrl += _uploadPath.replaceAll(File.separator, "/");
                }

                if (!StringUtil.isNull("custom_code", in)) {
                    String code = in.get("custom_code").toString();
                    callService(code, in, inHead, out, outHead);
                    return;
                }
                try {
                    String saveFileName = GlobalUtil.getUniqueNumber() + "."
                            + type;
                    if (StringUtil.isNull(_uploadPath)) {
                        GlobalUtil.saveFile(uploadPath, saveFileName, file.getInputStream());
                    } else {
                        GlobalUtil.saveFile(uploadPath, _uploadPath, saveFileName, file.getInputStream());
                    }
                    out.put("img_url", imageUrl + "/" + saveFileName);
                } catch (Exception ex) {
                    throw new CustomException(100003, ex);
                }
            } else {
                throw new CustomException(100002);
            }
        } else {
            if (!StringUtil.isNull("custom_code", in)) {
                String code = in.get("custom_code").toString();
                callService(code, in, inHead, out, outHead);
            } else {
                throw new CustomException(100002);
            }
        }
    }
}
