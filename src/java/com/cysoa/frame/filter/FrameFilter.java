/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.filter;

import com.cysoa.frame.util.GlobalUtil;
import java.io.IOException;
import java.util.HashMap;
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
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        Object obj = session.getAttribute(GlobalUtil.session_tag);
        if (obj == null) {
            session.setAttribute(GlobalUtil.session_tag, new HashMap<String, Object>());
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
