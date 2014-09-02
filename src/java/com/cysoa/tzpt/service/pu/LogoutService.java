/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException; 
import com.cysoa.frame.service.UniversalService;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

/**
 * S20005 登录注销
 * @author Administrator
 */
@Service
public class LogoutService extends UniversalService
{
     private static Logger log = Logger.getLogger(LogoutService.class);

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
           Map session = getSession(inHead);
           session.clear();
    }
     
}
