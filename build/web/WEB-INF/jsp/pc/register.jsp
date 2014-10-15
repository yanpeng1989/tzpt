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
                        <form id="_register_form_">
                            <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                                <input class="form-control input-hint-text" id="_register_phone_num" type="text" name="tel" placeholder="注册手机号" />
                            </div>
                            <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                                <input class="form-control input-hint-text" id="_register_pwd" type="password" name="pwd1" placeholder="登录密码" />
                            </div>
                            <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                                <input class="form-control input-hint-text" id="_register_pwd_again" type="password" name="pwd2" placeholder="登录密码确认" />
                            </div>
                            <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                                <input class="form-control input-hint-text" id="_register_yzm" type="text" name="phoneyzm" placeholder="手机验证码" />
                                <span class="input-group-btn"><button class="glow btn btn-default">获取手机验证码</button></span>
                            </div>
                            <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                                <input class="form-control input-hint-text" id="_register_email" type="text" name="email"  placeholder="注册邮箱" />
                            </div>
                            <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                                <label><input type="radio" name="zctype" value="0"  checked="checked" /> &nbsp;个人</label>
                                <label style="margin-left: 40px;"><input type="radio" name="zctype" value="1" /> &nbsp;企业</label>
                            </div>   
                            <input type="checkbox"  id="agree" name="agree" value="1" checked /><a href="#this">同意平台的用户使用规则</a>
                            <button style="width: 90%;margin-top: 3px;" id="_register_frame_btn" class="button button-primary glow">注册</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>