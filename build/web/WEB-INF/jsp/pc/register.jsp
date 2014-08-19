<%-- 
    Document   : register
    Created on : 2014-8-17, 17:31:45
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div id="_modal_register" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div style="text-align: center; width: 100%;" class="container">
                <div class="row">
                    <h4>用户注册</h4>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                            <input class="form-control input-hint-text" id="_register_phone_num" type="text" placeholder="注册手机号" />
                        </div>
                        <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                            <input class="form-control input-hint-text" id="_register_pwd" type="password" placeholder="登录密码" />
                        </div>
                        <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                            <input class="form-control input-hint-text" id="_register_pwd_again" type="password" placeholder="登录密码确认" />
                        </div>
                        <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                            <input class="form-control input-hint-text" id="_register_yzm" type="text" placeholder="手机验证码" />
                            <span class="input-group-btn"><button class="glow btn btn-default">获取手机验证码</button></span>
                        </div>
                        <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                            <input class="form-control input-hint-text" id="_register_email" type="text" placeholder="注册邮箱" />
                        </div>
                        <button style="width: 90%;margin-top: 3px;" class="button button-primary glow">注册</button>
                    </div>
                </div>
            </div>
        </div>
    </div>