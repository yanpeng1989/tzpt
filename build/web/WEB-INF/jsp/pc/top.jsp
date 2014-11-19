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
<div id="top_bar" align='center' class="container navbar-fixed-top" style="margin-bottom: 0px;background-color: #efefef;border: 1px #ddd solid">
    <div class="row row-top-bar">
        <div id="connect_method">
            <label>客服电话：400-88989-xxx</label>
        </div>
        <div id="quick_login">
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


                <button type="button" class="btn btn-info dropdown-toggle" style="border: 0px;background-color: #eeeeee" data-toggle="dropdown">
                    <font style="color: #000">   <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<%=(String) ses.get("nc")%>的账户</font>
                    <span class="caret"></span>
                </button>


                <ul class="dropdown-menu" role="menu">
                    <li><a href="<c:url value="/pc/user/index.do" />"><font color="#000">我的信息中心</font></a></li>
                    <li><a href="#this" id="logout_a"><font color="#000">退出</font></a></li>  
                </ul>



            </div>
            <%
            } else {
            %>  
            <a href="<c:url value="/pc/login_new.do" />"><button id="top_login_btn" class="button glow button-flat-royal">登录</button></a>
            <a href="<c:url value="/pc/register_new.do" />"><button id="top_register_btn" class="button glow button-flat-primary">注册</button></a>
            <%                 }
            %> 
        </div>
    </div>
</div>
<div id="sample_link" class="sample_link" class="container" align="center" style="background-color: #fff">
    <div class="row sample_link_row_top" >
        <div id="logo_img" class="pull-left"></div>
        <div  id="function_link" class="pull-right">   
            <ul class="nav nav-tabs top-nav" role="tablist" style="border: 0px;">
                <li role="presentation" id="wytz"  ><a href="<c:url value="/pc/p2p/pro_list.do" />">我要投资</a></li>
                <li role="presentation" id="loan"  ><a href="<c:url value="/pc/p2p/loan.do" />">我要借贷</a></li>

                <li role="presentation" id="wyjd" > <a href="<c:url value="/pc/p2p/pro_give_list.do" />">投资转让</a></li>
                <li role="presentation" id="bzsm">  <a href="<c:url value="/pc/static/help.do" />">帮助指引</a></li>
                <li role="presentation" id="gywm">  <a href=<c:url value="/pc/static/company_profile.do"/>>关于我们</a></li>
            </ul>  
        </div>  
    </div>
</div>





