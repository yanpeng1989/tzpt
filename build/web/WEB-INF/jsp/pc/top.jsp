<%-- 
    Document   : top
    Created on : 2014-8-17, 16:53:41
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="temp-top-bar">

</div>
<div id="top_bar" class="container navbar-fixed-top">
    <div class="row">
        <div id="connect_method" class="col-sm-3">
            <label>客服电话：400-88989-xxx</label>
        </div>
        <div class="col-sm-5"></div>
        <div id="quick_login" class="col-sm-4">
            <button id="top_login_btn" class="button glow button-flat-royal">登录</button>
            <button id="top_register_btn" class="button glow button-flat-primary">注册</button>
        </div>
    </div>
</div>
<div id="sample_link" class="sample_link" class="container">
    <div class="row">
        <div class="col-sm-4">
            <div id="logo"></div>
        </div>
        <div class="col-sm-3"></div>
        <div id="function_link" class="col-sm-5">
            <a href="<c:url value="/pc/p2p/pro_list.do" />">我要投资</a>
            <a href="#this">我要借贷</a>
            <a href="#this">帮助说明</a>
            <a href="#this">关于我们</a>
        </div>
    </div>
</div>