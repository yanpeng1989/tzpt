<%-- 
    Document   : invest.jsp
    Created on : 2014-8-17, 17:47:42
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../head.jsp"></jsp:include>
    <link href="<c:url value='/css/pc/p2p/loan.css' />" rel="stylesheet" />

    <body>
        <jsp:include page="../top.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div id="personal_loan" class="col-sm-4 loan-panel">
                        <div class="panel panel-primary">
                            <div class="panel-heading">个人借贷</div>
                            <div class="panel-body">
                                <div class="thumbnail">
                                    <img data-src="holder.js/330x280" src="<c:url value="/images/pc/personal_loan.jpg" />" />
                            </div>
                            <h4>
                                申请条件：
                            </h4>
                            <div class="loan-desc-p" align="center">
                                <p>1. 企业认证</p>
                                <a href="#this">查看详细说明</a>
                            </div>
                            <button class="button button-3d-primary glow loan-btn button-rounded">立即申请</button>
                        </div>
                    </div>
                </div>
                <div id="company_loan" class="col-sm-4 loan-panel">
                    <div class="panel panel-success">
                        <div class="panel-heading">企业借贷</div>
                        <div class="panel-body">
                            <div class="thumbnail">
                                <img data-src="holder.js/330x280" src="http://picapi.ooopic.com/01/19/29/43b1OOOPIC0a.jpg" />
                            </div>
                            <h4>
                                申请条件：
                            </h4>
                            <div class="loan-desc-p"  align="center">
                                <p>1. 身份认证</p>
                                <p>2. 房产证明</p>
                                <a href="#this">查看详细说明</a>
                            </div>
                            <button class="button button-3d-action glow loan-btn button-rounded">立即申请</button>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                </div>
            </div>
        </div>
        <jsp:include page="../foot.jsp" ></jsp:include>
        <jsp:include page="../login.jsp" ></jsp:include>
        <jsp:include page="../register.jsp" ></jsp:include>
        </body>
    </html>
    <script src="<c:url value='/script/pc/login_new.js' />"></script>
<script src="<c:url value='/script/pc/register_new.js' />"></script>