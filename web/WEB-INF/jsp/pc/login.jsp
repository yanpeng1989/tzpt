<%-- 
    Document   : login
    Created on : 2014-8-17, 17:03:57
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div id="_modal_login" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div style="text-align: center; width: 100%;" class="container">
                <div class="row">
                    <h4>用户登录</h4>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                            <input class="form-control input-hint-text" id="_login_phone_num" type="text" placeholder="注册手机号" />
                        </div>
                        <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                            <input class="form-control input-hint-text" id="_login_pwd" type="password" placeholder="登录密码" />
                        </div>
                        <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                            <input class="form-control input-hint-text" id="_login_yzm" type="text" placeholder="验证码" />
                            <span class="input-group-addon"><a href="#this"><img class="_validate_code" src="<c:url value="/validate/code.do"/>" /></a></span>
                        </div>
                        <button style="width: 90%;" class="button button-primary glow">登录</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
