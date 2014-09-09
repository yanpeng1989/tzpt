/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.minli.service.cyss;

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
public class PersonImgService extends UniversalService {

    private static Logger log = Logger.getLogger(PersonImgService.class);

    @Transactional
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        MultipartFile file1 = (MultipartFile) in.get("sfzzm");
        MultipartFile file2 = (MultipartFile) in.get("sfzfm");
      //  log.info(file.getContentType());
        try {
            GlobalUtil.saveFile(GlobalUtil.getUniqueNumber() + ".jpg", file1.getInputStream());
            GlobalUtil.saveFile(GlobalUtil.getUniqueNumber() + ".jpg", file2.getInputStream());
        } catch (Exception ex) {
            log.error(ex);
        }
        
    }
}
