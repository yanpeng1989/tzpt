/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.cysoa.tzpt.service.pu;
import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 * S20007
 *
 * @author cyss210
 */
@Service
public class ImgUploadService extends UniversalService {

    private static Logger log = Logger.getLogger(ImgUploadService.class);

    @Transactional
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
         log.debug("img UPload..."); 
         String imgType= (in.get("uploadpath").toString().split("-"))[1];
         MultipartFile file  =(MultipartFile) in.get(imgType);
          
        try {
            GlobalUtil.saveFile(in.get("uploadpath").toString()+".jpg", file.getInputStream());
          
        } catch (Exception ex) {
            log.error(ex);
        }
        
    }
    public static String  getImgUploadPath(String id,String ywlx){
    return "/tzpt/upload/" + id + "-"+ywlx+".jpg";
    }
}
