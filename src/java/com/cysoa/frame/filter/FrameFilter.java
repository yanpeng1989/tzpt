/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.filter;

import com.cysoa.frame.beans.MapFactory;
import com.cysoa.frame.util.GlobalUtil;
import com.cysoa.frame.util.StringUtil;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author cyss210
 */
public class FrameFilter implements Filter {

    private static Logger log = Logger.getLogger(FrameFilter.class);
    private String encoding;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.encoding = filterConfig.getInitParameter("encoding");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding(encoding);
        response.setCharacterEncoding(encoding);
        //设置session
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        Object obj = session.getAttribute(GlobalUtil.session_tag);
        if (obj == null) {
            session.setAttribute(GlobalUtil.session_tag, new HashMap<String, Object>());
        }
        //
        Map<String, Object> in = MapFactory.createPacket();
        Map<String, Object> inHead = (Map<String, Object>) in.get("head");
        request.setAttribute("page_data", in);
        //封装数据
        Enumeration<String> names = request.getParameterNames();
        while (names.hasMoreElements()) {
            String name = names.nextElement();
            String para = request.getParameter(name);
            if (!StringUtil.isNull(para)) {
                in.put(name, para);
            }
        }
        //封装分页参数
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
            in.put(GlobalUtil.cutPageTag, page);
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
