/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.minli.service.cyss;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.DateUtil;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 * S24023
 * @author cyss210
 */
@Service
public class LoginSj extends UniversalService{

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        in.put("sql", "get_msg_reply");
        in.put("args", new Object[]{
            in.get("replier"),
            DateUtil.changeBeginDate("begin_time", in),
            DateUtil.changeEndDate("end_time", in)
        });
        callService("S10001", in, inHead, out, outHead);
    }
}
