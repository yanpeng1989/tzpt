/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.AES;
import com.cysoa.frame.util.GlobalUtil;
import java.util.Map;
import java.util.logging.Level;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * S30034  
 *
 * @author Administrator
 */
@Service
public class CommonYwStatusUtil extends UniversalService {

    private static Logger log = Logger.getLogger(MyLoginService.class);

 
    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        String method=in.get("method").toString();
        String args1=in.get("args1").toString();
        String args2=in.get("args2").toString();
        if(method.equals("checkFullInvest"))
        {
        //判断满标 args1 投标load—id args2 投标金额
             
        }
        else if  (method.equals("updateFullInvest"))
        {
        //更新满标状态 
             
        }
    }
}
