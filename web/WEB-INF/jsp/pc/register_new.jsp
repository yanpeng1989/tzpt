<%-- 
    Document   : register_new
    Created on : 2014-10-22, 16:54:47
    Author     : Administrator
--%>

<%-- 
    Document   : index
    Created on : 2014-7-31, 11:38:53
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <jsp:include page="head.jsp"></jsp:include>
    <jsp:include page="top.jsp"></jsp:include>
        <body>
            <div style="height: 500px;margin-top: 90px;">
                <div style="float:left;width: 400px;height: 450px;margin-left:125px; border: 1px solid #EB5D68;">
                    <div style="width: 380px;height: 430px;margin-top: 30px;margin-left: 30px">
                        <form id="_register_form_"  class="form-horizontal" >
                            <div>
                                <h3><font style="color:#EB5D68;">注册</h3>
                            </div>
                            <div class="input-group" style="margin-top: 20px;margin-bottom: 10px;width:100%;">
                                <span style="width:80px" class="input-group-addon">手机号</span>
                                <input class="form-control input-hint-text" id="_register_phone_num" style="border-color: #EB5D68;width: 220px;" type="text" minlength="11" check-type="required" name="tel" placeholder="注册手机号" /> 
                            </div>
                            <div class="input-group" style="margin-top: 20px;margin-bottom: 10px;width:100%">
                                <span style="width:80px" class="input-group-addon">设置密码</span>
                                <input class="form-control input-hint-text" id="_register_pwd" style="border-color: #EB5D68;width: 220px;" type="password" minlength="6" check-type="required" name="pwd1" placeholder="登录密码" />
                            </div>
                            <div class="input-group" style="margin-top: 20px;margin-bottom: 10px;width:100%">
                                <span style="width:80px" class="input-group-addon">重复密码</span>
                                <input class="form-control input-hint-text" id="_register_pwd_again" style="border-color: #EB5D68;width: 220px;" type="password" minlength="6" check-type="required" name="pwd2" placeholder="登录密码" />
                            </div>
                            <div class="input-group" style="margin-top: 20px;margin-bottom: 10px;width:100%">
                                <span style="width:80px" class="input-group-addon">常用邮箱</span>
                                <input class="form-control input-hint-text" id="_register_email" style="border-color: #EB5D68;width: 220px;" type="text" minlength="6" check-type="required" name="email" placeholder="常用邮箱" />
                            </div>
                            <div class="input-group" style="margin-top: 20px;margin-bottom: 10px;width:100%">
                                <span style="width:80px" class="input-group-addon">验证码</span>
                                <input type="text" class="form-control"style="width: 130px;border-color: #EB5D68;" minlength="3" check-type="required" name="phoneyzm" id="_register_yzm" placeholder="短信验证码"> 
                                <button id="_login_frame_btn" style="width: 90px;" class="button button-primary glow">获取</button>
                            </div>
                            <div style="margin-top: 20px;margin-left:50px;width:100%">
                              <input type="checkbox"  id="agree" name="agree" value="1" checked /><a href="#this">同意 <a href="#this">《金交市使用协议》</a>
                            </div>
                            <button id="_register_frame_btn" style="width: 90px;margin-top:20px;margin-left: 100px" class="button button-primary glow">注册</button>
                        </form>
                    </div>
                </div>
                <div style="float:left;width: 400px;height: 450px; margin-top: 50px;margin-left: 50px">
                    <img src="/tzpt/images/pc/register.png" width="390px" height="250px">
                </div>
            </div>
        </body>
    <jsp:include page="foot.jsp" ></jsp:include>
    <jsp:include page="login.jsp" ></jsp:include>
    <jsp:include page="register.jsp" ></jsp:include>
</html>
    <!-- 在此引用相应页面的js -->
<script src="<c:url value='/script/pc/index.js' />"></script>
<script src="<c:url value='/script/pc/login_new.js' />"></script>
<script src="<c:url value='/script/pc/register_new.js' />"></script>