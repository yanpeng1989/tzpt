/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.controller;

import com.cysoa.frame.beans.DBTableBean;
import com.cysoa.frame.beans.MapFactory;
import com.cysoa.frame.exception.CustomException;
import com.cysoa.frame.service.UniversalService;
import com.cysoa.frame.util.AutoPage;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.frame.util.StringUtil;
import com.cysoa.frame.util.ValidateCode;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author cyss210
 */
@Controller
public class FrameController {

    private static Logger log = Logger.getLogger(FrameController.class);

    @RequestMapping(value = "/wx/index", method = RequestMethod.GET)
    public String wxLogin(HttpServletRequest request, HttpServletResponse response) {
        return "/wx/index";
    }

    @RequestMapping(value = "/pc/{page}", method = RequestMethod.GET)
    public String getPage(HttpServletRequest request, HttpServletResponse response, @PathVariable("page") String page) {
//        HttpSession session = request.getSession();
//        Object obj = session.getAttribute(GlobalUtil.session_tag);
//        String loginUrl = "redirect:/pc/index.do";
//        if (obj == null) {
//            session.setAttribute(GlobalUtil.session_tag, new HashMap<String, Object>());
//            return loginUrl;
//        } else {
//            Map<String, Object> ses = (HashMap<String, Object>) obj;
//            if (StringUtil.isNull(GlobalUtil.login_tag, ses)) {
//                return loginUrl;
//            }
//        }
        Map in = MapFactory.createPacket();
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
            }
        }

        return "/pc/" + page;
    }

    @RequestMapping(value = "/pc/{p1}/{p2}", method = RequestMethod.GET)
    public String getPage(HttpServletRequest request, HttpServletResponse response, @PathVariable("p1") String p1, @PathVariable("p2") String p2) {
        return getPage(request, response, "" + p1 + "/" + p2);
    }

    @RequestMapping(value = "/pc/{p1}/{p2}/{p3}", method = RequestMethod.GET)
    public String getPage(HttpServletRequest request, HttpServletResponse response, @PathVariable("p1") String p1, @PathVariable("p2") String p2, @PathVariable("p3") String p3) {
        return getPage(request, response, "" + p1 + "/" + p2 + "/" + p3);
    }

    @RequestMapping(value = "/validate/code", method = RequestMethod.GET)
    public void getCheckNum(HttpServletRequest request, HttpServletResponse resqonse) {
        ValidateCode vc = new ValidateCode();
        String code = vc.getRandcode(request, resqonse);
        HttpSession session = request.getSession();
        Object obj = session.getAttribute(GlobalUtil.session_tag);
        if (obj != null) {
            HashMap<String, Object> map = (HashMap<String, Object>) obj;
            map.put(GlobalUtil.validate_code_tag, code);
            session.setAttribute(GlobalUtil.session_tag, map);
        } else {
            session.setAttribute(GlobalUtil.session_tag, new HashMap<String, Object>());
        }
    }

    @RequestMapping(value = "/ajax", method = RequestMethod.POST)
    public void ajaxServicePost(HttpServletRequest request, PrintWriter writer) {
        if (log.isDebugEnabled()) {
            log.debug("开始处理ajax请求。");
        }
        Map<String, Object> in = MapFactory.createPacket();
        Map<String, Object> inHead = (Map<String, Object>) in.get("head");
        Map<String, Object> out = MapFactory.createSuscessPacket();
        Map<String, Object> outHead = (Map<String, Object>) out.get("head");
        //设置session
        HttpSession session = request.getSession();
        inHead.put(GlobalUtil.session_tag, session);
        //封装数据
        Enumeration<String> names = request.getParameterNames();
        while (names.hasMoreElements()) {
            String name = names.nextElement();
            String para = request.getParameter(name);
            if (!StringUtil.isNull(para)) {
                in.put(name, para);
            }
        }
        //数据校验
        try {
            if (log.isDebugEnabled()) {
                log.debug("请求数据");
                log.debug(MapFactory.toJson(in));
            }
            if (StringUtil.isNull("service_code", in)) {
                throw new CustomException(999992); //找不到服务码
            }
            if (StringUtil.isNull("type", in)) {
                throw new CustomException(999993); //找不到请求类型
            }
            if (StringUtil.isNull("channel", in)) {
                throw new CustomException(999994); //找不到请求渠道
            }

            String serviceCode = in.get("service_code").toString();
            String type = in.get("type").toString();
            String channel = in.get("channel").toString();

            if (!"ajax_".equals(type)) {
                throw new CustomException(999995); //类型错误
            }

            //组装数据
            in.remove("service_code");
            inHead.put("service_code", serviceCode);
            in.remove("type");
            inHead.put("type", type);
            in.remove("channel");
            inHead.put("channel", channel);

            if (!StringUtil.isNull("_url", in)) {
                inHead.put("_url", in.get("_url"));
                in.remove("_url");
            }
            Map page = new HashMap();
            if (!StringUtil.isNull("_to_page", in)) {
                page.put("to_page", in.get("_to_page"));
                in.remove("_to_page");
            }
            if (!StringUtil.isNull("_row_num", in)) {
                page.put("row_num", in.get("_row_num"));
                in.remove("_row_num");
            }
            if (page.size() > 0) {
                in.put("_page_para", page);
            }
            UniversalService.callService(serviceCode, in, inHead, out, outHead);

        } catch (CustomException ex) {
            out = MapFactory.createBackPacket(ex.getCode(), ex.getDesc());
            log.error(ex.getDesc(), ex);
            //} catch (SQLException ex) {
        } catch (Exception ex) {
            if (ex instanceof SQLException) {
                out = MapFactory.createBackPacket(999998, "数据库异常");
                log.error("数据库异常", ex);
            } else {
                out = MapFactory.createBackPacket(999999, "未知异常");
                log.error("未知异常", ex);
            }
        } finally {
            if (log.isDebugEnabled()) {
                log.debug("返回数据");
                try {
                    log.debug(MapFactory.toLog(out));
                } catch (JSONException ex) {
                }
            }
            try {
                writer.print(MapFactory.toJson(out));
            } catch (JSONException ex) {
                log.error(ex);
                writer.print("{\"head\":{\"res_code\": \"100003\",\"res_desc\":\"包解析错误\"}}");
            }
        }
    }

    @RequestMapping(value = "/_upload/{filename}/{type}", method = RequestMethod.POST)
    public void uploadFile(HttpServletRequest request, HttpServletResponse response, @PathVariable("filename") String fileName, @PathVariable("type") String type) {
    }

    @RequestMapping(value = "/auto/page", method = RequestMethod.GET)
    public String autoPage(HttpServletRequest request, HttpServletResponse response) {
        String url = "/template/" + GlobalUtil.getSysConfig("default_template");
        String type = null;
        String tableName = null;

        String selectKey = "";
        String selectSql = null;
        Map selectCase = new LinkedHashMap();
        Map showKeys = new LinkedHashMap();

        String updateSql = null;
        String addSql = null;
        String deleteSql = null;

        Map outError = null;

        String jsonUrl = request.getParameter("url");
        Map data = GlobalUtil.allJsonConfig.get(jsonUrl);
        if (data != null) {
            if (!StringUtil.isNull("template", data)) {
                url = "/template/" + data.get("template");
            }
            if (!StringUtil.isNull("type", data)) {
                type = data.get("type").toString();
            }

            if ("table".equals(type)) {
                if (!StringUtil.isNull("name", data)) {
                    tableName = data.get("name").toString();
                } else {
                    outError = MapFactory.createBackPacket(999999, "缺少name参数");
                }
                selectSql = AutoPage.initTableSelectSql(tableName, data, selectCase, showKeys);
                DBTableBean tableBean = GlobalUtil.dbTables.get(tableName);
                selectKey = tableBean.getTableKey();
            } else if ("custom".equals(type)) {
                if (!data.containsKey("select")) {
                    outError = MapFactory.createBackPacket(999999, "缺少select参数");
                } else {
                    Map selectMap = (Map) data.get("select");
                    selectSql = GlobalUtil.allSqls.get(selectMap.get("sql").toString());
                    selectKey = selectMap.get("key").toString();
                    AutoPage.constructCustomShowKeys((List) selectMap.get("show_keys"), showKeys);
                    AutoPage.constructCustomSelectCase((List) selectMap.get("args"), selectCase);
                }
            } else if (type == null) {
            }
        } else {
        }

        if (outError != null) {
        } else {
            HttpSession session = request.getSession();
            Object obj = session.getAttribute(GlobalUtil.session_tag);
            Map<String, Object> ses = null;
            if (obj == null) {
                ses = new HashMap<String, Object>();
                session.setAttribute(GlobalUtil.session_tag, ses);
            } else {
                ses = (HashMap<String, Object>) obj;
            }
            Map<String, Object> autoArgs = null;
            if (ses.containsKey(GlobalUtil.AUTO_PAGE_TAG)) {
                autoArgs = (Map<String, Object>) ses.get(GlobalUtil.AUTO_PAGE_TAG);
            } else {
                autoArgs = new HashMap<String, Object>();
            }
            ses.put(GlobalUtil.AUTO_PAGE_TAG, autoArgs);
            autoArgs.put("select_sql", selectSql);
            autoArgs.put("select_case", selectCase);
            autoArgs.put("key", jsonUrl);

            Map<String, Object> outMap = new HashMap<String, Object>();
            outMap.put("select_case", selectCase);
            outMap.put("select_show", showKeys);
            outMap.put("select_key", selectKey);
            try {
                log.info(MapFactory.toLog(outMap));
                request.setAttribute("out_json", MapFactory.toJson(outMap));
            } catch (JSONException ex) {
            }
        }
        return url;
    }
}
