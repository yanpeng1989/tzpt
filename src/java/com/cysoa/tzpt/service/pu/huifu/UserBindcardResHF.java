/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import static com.cysoa.frame.service.UniversalService.callService;
import com.cysoa.frame.util.GlobalUtil;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *
 * @author long
 */
@Service
public class UserBindcardResHF extends UniversalService {

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        
        String fid = GlobalUtil.getUniqueNumber();
        try {
            int result = update("pu_insert_bankcard_check", new Object[]{
                fid,"", in.get("OpenAcctId").toString(), in.get("OpenBankId").toString(), in.get("OpenBankId").toString(),in.get("UsrCustId").toString()
            });
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new CustomException(999998);
        }
       out.put("to_jsp", "pc/user/index.do?tomenu=accountinfo");
       out.put("result", GlobalUtil.getSysConfig("HFTX_RES_TAG") + in.get("TrxId"));
      //out.put("to_menu","accountinfo");
    }
}
