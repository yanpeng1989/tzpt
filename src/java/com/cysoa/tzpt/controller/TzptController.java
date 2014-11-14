/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.controller;

import com.cysoa.frame.beans.MapFactory;
import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.frame.util.StringUtil;
import com.cysoa.frame.util.ValidateCode;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author cyss210
 */
@Controller
public class TzptController { 
     private static Logger log = Logger.getLogger(TzptController.class);

    @RequestMapping(value = "/wx/index", method = RequestMethod.GET)
    public String wxLogin(HttpServletRequest request, HttpServletResponse response) {
        return "/wx/index";
    }

    @RequestMapping(value = "/pc/{page}")
    public String getPage(HttpServletRequest request, HttpServletResponse response, @PathVariable("page") String page) {
        Map in = (Map) request.getAttribute("page_data");
        Map inHead = (Map) in.get("head");
        Map out = MapFactory.createPacket();
        Map outHead = (Map) in.get("head");
        HttpSession session = request.getSession();
        inHead.put(GlobalUtil.session_tag, session);
        if (GlobalUtil.allPageServices.containsKey(page)) {
            String[] serviceCodes = GlobalUtil.allPageServices.get(page);
            try {
                for (String code : serviceCodes) {
                    UniversalService.callService(code, in, inHead, out, outHead);
                }
                request.setAttribute("out", out);
            } catch (CustomException ex) {
                log.info("初始化页面服务错误", ex);
                request.setAttribute("out", ex.getBackData());
                return "/pc/error_tip";
            } catch (Exception ex) {
                log.info("初始化页面服务错误", ex);
                request.setAttribute("out", MapFactory.createBackPacket(999999));
                return "/pc/error_tip";
            } finally {
                if(!StringUtil.isNull("_to_jsp", out)) {
                    return out.get("_to_jsp").toString();
                }
            }
        } else {
            request.setAttribute("out", in);
        }

        return "/pc/" + page;
    }

    @RequestMapping(value = "/pc/{p1}/{p2}")
    public String getPage(HttpServletRequest request, HttpServletResponse response, @PathVariable("p1") String p1, @PathVariable("p2") String p2) {
        return getPage(request, response, "" + p1 + "/" + p2);
    }

    @RequestMapping(value = "/pc/{p1}/{p2}/{p3}")
    public String getPage(HttpServletRequest request, HttpServletResponse response, @PathVariable("p1") String p1, @PathVariable("p2") String p2, @PathVariable("p3") String p3) {
        return getPage(request, response, "" + p1 + "/" + p2 + "/" + p3);
    }
}
