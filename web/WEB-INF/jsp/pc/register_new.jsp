<%-- 
    Document   : register_new
    Created on : 2014-10-22, 16:54:47
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <jsp:include page="head.jsp"></jsp:include>
    <link href="<c:url value='/css/pc/register_new.css' />" rel="stylesheet" />
    <jsp:include page="top.jsp"></jsp:include>
        <body>
            <form id="_register_form_"   >
                <div align="center" style="width: 100%;background: #eee;padding-bottom: 20px;padding-top: 20px;">
                    <div id="register_container">
                        <div id="login_panel">
                            <h4 id="login_title">注册</h4>
                            <div class="input-group new_input_div" >
                                <span class="glyphicon glyphicon-lock" ></span>
                                <input id="_register_nc" name="nc" type="text" class="new_input input-hint-text"style="" minlength="3" check-type="required"  placeholder="昵称" /> 
                            </div>
                            <div class="input-group new_input_div" >
                                <span class="glyphicon glyphicon-lock" ></span>
                                <input id="_register_phone_num" name="tel" type="text" class="new_input input-hint-text"style="" minlength="3" check-type="required"  placeholder="手机号" /> 
                            </div>
                            <div class="input-group new_input_div" >
                                <span class="glyphicon glyphicon-lock" ></span>
                                <input id="_register_pwd" name="pwd1" type="password" class="new_input input-hint-text"style="" minlength="3" check-type="required"    placeholder="设置密码" /> 
                            </div>
                            <div class="input-group new_input_div" >
                                <span class="glyphicon glyphicon-lock" ></span>
                                <input id="_register_pwd_again" name="pwd2" type="password" class="new_input input-hint-text"style="" minlength="3" check-type="required"   placeholder="重复密码" /> 
                            </div>
                            <div class="input-group new_input_div" >
                                <span class="glyphicon glyphicon-lock" ></span>
                                <input id="_register_email" name="email" type="text" class="new_input input-hint-text"style="" minlength="3" check-type="required"   placeholder="常用邮箱" /> 
                            </div>
                            <div class="input-group yzm-group" >
                                <input id="register_yzm" type="text" class="form-control input-hint-text" style="" minlength="3" check-type="required" name="phoneyzm"  placeholder="短信验证码"> 
                                <input id="get_sms_yzm" type="button" class="button button-primary glow" value="获取" />
                            </div>
                            <div style="margin-top: 12px;">
                                <input type="checkbox"  id="agree" name="agree" value="1" checked /><a href="#this">同意 <a href="#this">《金交市使用协议》</a>
                            </div>
                            <button id="_register_frame_btn" style="margin-top: 12px;width: 300px;" class="button button-primary glow">注册</button>
                        </div>
                        <div id="img_panel">
                            <img src="<c:url value="/images/pc/register.png" />" />
                    </div>
                </div>
            </div>
        </form>
    </body>
    <jsp:include page="foot.jsp" ></jsp:include>
    <jsp:include page="login.jsp" ></jsp:include>
    <jsp:include page="register.jsp" ></jsp:include>
    </html>
    <!-- 在此引用相应页面的js -->
    <script src="<c:url value='/script/pc/index.js' />"></script>
<script src="<c:url value='/script/pc/login_new.js' />"></script> 