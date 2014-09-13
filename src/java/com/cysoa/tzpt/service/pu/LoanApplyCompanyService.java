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


/**
 * S30013 公司借贷申请
 * @author tenssion
 */
@Service
public class LoanApplyCompanyService extends UniversalService{
  private static Logger log = Logger.getLogger(LoanApplyCompanyService.class);
   
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
   
    
    }
    
}
