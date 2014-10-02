/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *
 * @author long
 */
@Service
public class UserBindcardResHF extends UniversalService{

    @Override
 public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
       Map session = getSession(inHead);
       String id = session.get("id").toString();
       in.put("OpenAcctId",   GlobalUtil.getSysConfig("HFTX_RES_TAG") + in.get("OpenAcctId"));
       in.put("OpenBankId",   GlobalUtil.getSysConfig("HFTX_RES_TAG") + in.get("OpenBankId"));
       
       out.put("to_jsp", "pc/p2p/account.do");
       
   }
    
}
