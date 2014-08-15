/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.minli.service.cyss;

import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

/**
 * S24004
 *
 * @author cyss210
 */
@Service
public class GetExamTest extends UniversalService {
    private static Logger log = Logger.getLogger(GetExamTest.class);

    @Override
    public void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException {
        out.put("menus", GlobalUtil.getTableParamet("test.tt", "0"));
        out.put("tt", GlobalUtil.getTableParamet("test.tt", "1"));
    }
}
