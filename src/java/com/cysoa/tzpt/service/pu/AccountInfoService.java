/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * S20012 账户信息
 * @author Administrator
 */
@Service
public class AccountInfoService  extends UniversalService{
    
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
          Map session = getSession(inHead);
            String id = "";
            if (session.get("id") != null) {
                id = session.get("id").toString();
            }
            Map<String, Object> account = queryData("pu_get_one_account", id);
            out.put("available_assets", account.get("AVAILABLE_ASSETS").toString());
            out.put("invested_assets", account.get("INVESTED_ASSETS").toString());
            out.put("credit_line", account.get("CREDIT_LINE").toString());
            out.put("debt_assets", account.get("DEBT_ASSETS").toString());
            out.put("frozen_assets", account.get("FROZEN_ASSETS").toString());
            out.put("gold_coin", account.get("GOLD_COIN").toString()); 
              
      } 
    
}
