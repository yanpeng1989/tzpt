<%-- 
    Document   : basic_info
    Created on : 2014-8-25, 15:55:38
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <jsp:include page="../head.jsp"></jsp:include>
    <link href="<c:url value='/css/pc/user/basic_info.css' />" rel="stylesheet" />
    <body>
    <center style="padding: 16px;">
        <div class="personal-content-title">
            个人基本信息
        </div>
        <div class="personal-input-panel">
            <form id="basic_info_form" class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="" class="col-sm-2 control-label">注册邮箱：</label>
                    <div class="col-sm-2"></div>
                    <div class="col-sm-6">
                        <span>976603499@qq.com</span>
                        <a style="margin-left: 40px;" href="#this">更改...</a>
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-sm-2 control-label">注册手机号：</label>
                    <div class="col-sm-2"></div>
                    <div class="col-sm-6">
                        <span>15639766731</span>
                        <a style="margin-left: 40px;" href="#this">更改...</a>
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-sm-2 control-label">性别：</label>
                    <div class="col-sm-2"></div>
                    <div class="col-sm-6">
                        <label><input type="radio" name="sex" value="男" /> &nbsp;男</label>
                        <label style="margin-left: 40px;"><input type="radio" name="sex" value="女" /> &nbsp;女</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-sm-2 control-label">身份证号：</label>
                    <div class="col-sm-2"></div>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-sm-2 control-label">身份证信息：</label>
                    <div class="col-sm-2"></div>
                    <div class="col-sm-6">
                        <div class="input-group">
                            <span class="input-group-btn">
                                <button id="sfz1_btn" class="btn btn-default" type="button">选择正面</button>
                            </span>
                            <span class="input-group-btn">
                                <button id="sfz2_btn" class="btn btn-default" type="button">选择反面</button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div id="sfz_img" align="center" class="col-lg-12">
                        <span id="sfz1_img"></span>
                        <span id="sfz2_img" style="margin-left: 12px;"></span>
                    </div>
                </div>
                <div id="file_group" style="display: none">
                    <!-- 身份证正面图片上传 -->
                    <input type="file" id="sfz_1"  />
                    <!-- 身份证反面图片上传 -->
                    <input type="file" id="sfz_2"  />
                </div>
            </form>
        </div>
        <button id="save_btn" class="button button-flat-primary button-large pull-left">保存</button>
    </center>
</body>
</html>
