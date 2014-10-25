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
        <div style="width: 450px;height:350px;margin-top: 90px;margin-left: 35%;" class="container">
            <div class="row">
                <div class="form-group">
                    <form id="_login_form_"  class="form-horizontal" >
                        <div style="margin-left: 0px">
                            <h3><font style="color:#EB5D68;">登陆</h3>
                        </div>
                        <div class="input-group" style="margin-bottom: 10px;width:100%;">
                            <span style="width:80px" class="input-group-addon">用户名</span>
                            <input class="form-control input-hint-text" id="_login_phone_num" style="border-color: #EB5D68;width: 220px;" type="text" minlength="11" check-type="required" name="tel" placeholder="注册手机号" /> 
                        </div>
                        <div class="input-group" style="margin-bottom: 10px;width:100%">
                            <span style="width:80px" class="input-group-addon">密码</span>
                            <input class="form-control input-hint-text" id="_login_pwd" style="border-color: #EB5D68;width: 220px;" type="password" minlength="6" check-type="required" name="pwd" placeholder="登录密码" />
                        </div>
                        <div class="input-group" style="margin-bottom: 10px;width:100%">
                            <span style="width:80px" class="input-group-addon">验证码</span>
                            <input type="text" class="form-control"style="border-color: #EB5D68;width: 220px;" minlength="3" check-type="required"   name="yzm"  placeholder="验证码"> 
                        </div>
                        <div style="width: 90px;margin-top:10px;margin-left: 90px">
                            <span class="input-group-addon"><a href="#this"><img class="_validate_code" src="<c:url value="/validate/code.do"/>" /></a></span>
                        </div>
                        <div style="margin-left: 240px">
                              <span><a href="<c:url value="/pc/forget_pwd.do" />">忘记密码？</a></span>
                        </div>
                        <button id="_login_frame_btn" style="width: 90px;margin-top:10px;margin-left: 100px" class="button button-primary glow">登陆</button>
                    </form>
                </div>
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