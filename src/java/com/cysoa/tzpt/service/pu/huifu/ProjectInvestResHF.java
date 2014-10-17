/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import static com.cysoa.frame.service.UniversalService.callService;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.tzpt.service.pu.util.LoanModelUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *
 * @S30026
 */
@Service
public class ProjectInvestResHF extends UniversalService {

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        Map session = getSession(inHead);
        //String userId = session.get("id").toString();
        
        String loadid = in.get("MerPriv").toString();
        String custid = in.get("UsrCustId").toString();
        //String freeze_id=in.get("FreezeOrdId").toString();
        String freeze_id=in.get("FreezeTrxId").toString();
        String investid = in.get("OrdId").toString();
        double stages_assests = Double.parseDouble(in.get("TransAmt").toString());
        Map<String, Object> loadinfo = this.queryData("pu_get_proById", loadid);
        int fqcount = Integer.parseInt(loadinfo.get("payment_times").toString());
        try{
        Map usrinf=  queryData("pu_get_useridbycustid", custid);
        String userId=(String) usrinf.get("ID");
        int result = update("pu_insert_personnal_invest", new Object[]{
                    investid, loadid, userId, stages_assests, null, null, null, null, null, freeze_id, "0"
                });
        //拆分投资表
        List ls = LoanModelUtil.loanmodel(stages_assests, fqcount);
        for (int i = 1; i <= ls.size(); i++) {
            Map tempM = new HashMap();
            tempM = (HashMap) ls.get(i-1);
            int result2 = update("pu_insert_every_invest", new Object[]{
                        GlobalUtil.getUniqueNumber(), i, investid, custid, tempM.get("surplus"), tempM.get("capital"), tempM.get("interest"), tempM.get("sum"), null, 0
                    });
        }
        
       }catch(Exception e){
       e.printStackTrace();
       }
       out.put("to_jsp", "pc/user/index.do?tomenu=accountinfo");
       out.put("to_menu", "accountinfo");
    }
}
