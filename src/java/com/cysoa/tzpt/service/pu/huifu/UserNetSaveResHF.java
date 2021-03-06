/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import static com.cysoa.frame.service.UniversalService.callService;
import com.cysoa.frame.util.GlobalUtil;
import java.text.SimpleDateFormat;  
import java.util.Date;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * S30027
 *
 * @author long
 */
@Service
public class UserNetSaveResHF extends UniversalService {

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        String cmd = in.get("CmdId").toString();
        String returnCode=in.get("RespCode").toString();
        if (cmd.equals("NetSave")) {
            System.out.println("NetSave back");
        }
        if (cmd.equals("Cash")) {
            System.out.println("Cash back");
            
        }
        out.put("to_jsp", "pc/p2p/huifu_return.do?cmd="+cmd+"&returnCode="+returnCode); 
        out.put("result", GlobalUtil.getSysConfig("HFTX_RES_TAG") + in.get("TrxId"));
        out.put("returnCode", returnCode);
        out.put("cmd",cmd);
    }
}
