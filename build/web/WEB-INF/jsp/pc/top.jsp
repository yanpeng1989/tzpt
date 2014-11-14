<%-- 
    Document   : top
    Created on : 2014-8-17, 16:53:41
    Author     : cyss210
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.cysoa.frame.util.GlobalUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="temp-top-bar">
</div>
<div id="top_bar" class="container navbar-fixed-top">
    <div class="row">
        <div id="connect_method" class="col-sm-4">
            <label>客服电话：400-88989-xxx</label>
        </div>
        <div class="col-sm-3"></div>
        <div id="quick_login" class="col-sm-5">
            <%
                Object obj = session.getAttribute(GlobalUtil.session_tag);
                Map<String, Object> ses = null;
                if (obj == null) {
                    ses = new HashMap<String, Object>();
                    session.setAttribute(GlobalUtil.session_tag, ses);
                } else {
                    ses = (HashMap<String, Object>) obj;
                }
                //  session.setAttribute(GlobalUtil.login_tag,"tenssion" );
                if (ses.get("nc") != null) {
            %> 
            <div class="btn-group">
                <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                    <%=(String) ses.get("nc")%>的账户<span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="<c:url value="/pc/user/index.do" />"><font color="blue">我的信息中心</font></a></li>
                    <li><a href="#this" id="logout_a"><font color="blue">退出</font></a></li>  
                </ul>
            </div>
            <%
            } else {
            %>  
            <button id="top_login_btn" class="button glow button-flat-royal">登录</button>
            <button id="top_register_btn" class="button glow button-flat-primary">注册</button>
            <%                 }
            %> 
        </div>
    </div>
</div>
<div id="sample_link" class="sample_link" class="container">
    <div class="row">
        <div class="col-sm-3">
            <div id="logo"></div>
        </div>
        <div class="col-sm-1"></div>
        <div  id="function_link" class="col-sm-8">   
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" id="wytz"  ><a href="<c:url value="/pc/p2p/pro_list.do" />">我要投资</a></li>
                 <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">我要借贷 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                          <li><a href=<c:url value="/pc/loan/index.do?step=1&loan_type=company" />>个人经营贷</a></li>
                          <li><a href=<c:url value="/pc/loan/index.do?step=1&loan_type=personal" />>个人消费贷</a></li>
                          
                        </ul>
                      </li>
                 
                <li role="presentation" id="wyjd" > <a href="<c:url value="/pc/p2p/pro_give_list.do" />">投资转让</a></li>
                <li role="presentation" id="bzsm">  <a href="<c:url value="/pc/static/help.do" />">帮助指引</a></li>
                <li role="presentation" id="gywm">  <a href=<c:url value="/pc/static/company_profile.do"/>>关于我们</a></li>
            </ul>  
        </div>  
    </div>
</div>