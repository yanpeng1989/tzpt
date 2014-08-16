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
        <body>
            <div id="top_bar" class="container">
                <div class="row">
                    <div id="connect_method" class="col-sm-3">
                        <label>客服电话：400-88989-xxx</label>
                    </div>
                    <div class="col-sm-5"></div>
                    <div id="quick_login" class="col-sm-4">
                        <a id="login_link" href="#this">登录</a>
                        <button id="register_btn" class="button glow button-flat-primary">注册</button>
                    </div>
                </div>
            </div>

            <div id="ad_list">
                <div class="sample_link"></div>
                <div id="sample_link" class="sample_link" class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div id="logo"></div>
                        </div>
                        <div class="col-sm-3"></div>
                        <div id="function_link" class="col-sm-5">
                            <a href="#this">我要投资</a>
                            <a href="#this">我要借贷</a>
                            <a href="#this">帮助说明</a>
                            <a href="#this">关于我们</a>
                        </div>
                    </div>
                </div>
                <div class="login_panel">
                </div>
                <div id="login_panel" class="login_panel">
                    <div id="big_title">xxx历史年化收益率</div>
                    <div id="average_content" class="login_content">
                        <label>平均</label>
                        <i>16.08%</i>
                    </div>
                    <div class="login_content">
                        <label class="login-panel-label"><i>40</i>倍活期存款收益</label>
                        <label style="margin-left: 4px;" class="login-panel-label"><i>3</i>倍货币基金收益</label>
                    </div>
                    <button id="register_right_now" class="button glow button-flat-royal register_btn">立即注册</button>
                    <div id="login_link_div" >
                        <label>
                            已有帐号?<a href="#this" id="login_link">立即登录</a>
                        </label>
                    </div>
                </div>
            </div>

            <div id="simple_introduce" class="container">
                <div class="row">
                    <div class="col-sm-4 introduce">
                        <div id="first"></div>
                        <div class="introduce_title">安全</div>
                        <div class="introduce_content">运用技术分散投资</div>
                        <div class="introduce_content">帮助投资人进入本金保障计划</div>
                    </div>
                    <div class="col-sm-4 introduce">
                        <div id="second"></div>
                        <div class="introduce_title">收益</div>
                        <div class="introduce_content">我们不介入交易</div>
                        <div class="introduce_content">借款人的利息100%给到投资人</div>
                    </div>
                    <div class="col-sm-4 introduce">
                        <div id="third"></div>
                        <div class="introduce_title">保障</div>
                        <div class="introduce_content">不接触资金不赚利差</div>
                        <div class="introduce_content">最大地保障了平台安全</div>
                    </div>
                </div>
            </div>

        <jsp:include page="foot.jsp" ></jsp:include>
        </body>
    </html>
    <!-- 在此引用相应页面的js -->
    <script src="<c:url value='/script/pc/index.js' />"></script>
