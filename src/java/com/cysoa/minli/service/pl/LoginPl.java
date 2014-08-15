/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.minli.service.pl;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import java.util.Map;
import org.springframework.stereotype.Service;

/**
 *
 * @author cyss210
 */
@Service
public class LoginPl extends UniversalService{
    
    @Override
    public String[] checkNull() {
        return new String[]{
            "username", "用户名"
        };
    }

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        String username = in.get("username").toString();
        Map user = queryData("get_pl_user", username);
        out.put("user", user);
        Map session = getSession(inHead);
        if(user == null) {
            throw new CustomException(100004);
        }
        session.putAll(user);
        session.put(GlobalUtil.login_tag, username);
    }
}
