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
    <style>
        .new_input_div {
            margin-bottom: 10px;
            width: 280px;
            height: 40px;
            border: 1px #EB5D68 solid;
            border-radius: 3px;
        }
        .new_input {
            border-radius: 3px;
            width: 200px;
            border: 0px;
            height: 40px;
            background: #f1f1f1;
            margin-left: 40px;
            display: inline-block;
            color: #000;
        }
    </style>
        <body>
            <div align="center" style="background: #ddd;padding-top: 100px;">
                <div  class="container">
                    <div class="row">
                        <div class="form-group">
                            <form id="_login_form_"  class="form-horizontal" style="width: 400px;border: 1px #ccc solid;background-color: #f1f1f1;padding: 20px;border-radius: 5px;">
                                <div style="margin-left: 0px;text-align: left;padding-left: 40px;padding-bottom: 10px">
                                    <h4><b><font style="color:#EB5D68;">登录</b></h4>
                                </div>
                                <div class="input-group new_input_div" >
                                    <img style="background-color: #aaa;width: 20px;height: 20px;margin-top: 1px;" />
                                    <input class="new_input" id="_login_phone_num" style="" type="text" minlength="11" maxlength="11" check-type="required" name="tel" placeholder="注册手机号" /> 
                                </div>
                                <div class="input-group new_input_div" >
                                    <img style="background-color: #aaa;width: 20px;height: 20px;margin-top: 1px;" />
                                    <input class=" new_input" id="_login_pwd" style="border-color: #EB5D68;" type="password" minlength="6" check-type="required" name="pwd" placeholder="登录密码" />
                                </div>
                                <div class="input-group new_input_div" >
                                    <img style="background-color: #aaa;width: 20px;height: 20px;margin-top: 1px;" />
                                    <input type="text" class="new_input" id="yzm" style="border-color: #EB5D68;" minlength="3" check-type="required"   name="yzm"  placeholder="验证码"> 
                                </div>
                                <div style="width: 90px;margin-top:10px;">
                                <span class="input-group-addon"><a href="#this"><img class="_validate_code" src="<c:url value="/validate/code.do"/>" /></a></span>
                            </div>
                            <div style="margin-left: 240px">
                                <span ><a style="color: #EB5D68;font-weight: 600;" href="<c:url value="/pc/forget_pwd.do" />">忘记密码？</a></span>
                            </div>
                            <button id="_login_frame_btn" style="margin-top:10px;width: 86%;" class="button button-primary glow">登录</button>
                            <div style="text-align: right;padding-right: 20px;padding-top: 11px;">
                                <label style="color: gray">没有账户？</label><a style="color: #EB5D68;font-weight: 600;" href="/tzpt/pc/register_new.do">立即注册</a>
                            </div>
                        </form>
                    </div>
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
 
<script src="<c:url value='/script/pc/register_new.js' />"></script>