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
    <jsp:include page="../head.jsp"></jsp:include>
    <link href="<c:url value='/css/pc/index.css' />" rel="stylesheet" />
    <body>
        <jsp:include page="../top.jsp"></jsp:include>
        <div class="container">
            <div class="row" style="width: 200px;float: left;margin-left: 110px;margin-top: 50px">
                <div class="span2">
                    <ul class="nav nav-pills nav-stacked">
                       <li><a href="/tzpt/pc/static/company_profile.do">企业介绍</a></li>
                                <li><a href="/tzpt/pc/static/help.do">帮助中心</a></li>
                                <li><a href="/tzpt/pc/static/partner.do">合作伙伴</a></li>
                                <li><a href="/tzpt/pc/static/join_us.do">加入我们</a></li> 
                                 <li><a href="/tzpt/pc/static/contact_us.do">联系我们</a></li>
                    </ul>
                </div>
            </div>
            <div class="row" style="width: 60%;min-height:600px ;float: right;margin-right:110px;margin-top: 50px">
                <div class="span2">
                    <ul class="nav nav-pills nav-stacked">
                        <h2>合作伙伴</h2>
                        <h1>河南投资集团担保有限公司</h1>
                        <p>河南投资集团担保有限公司注册资本金10亿元人民币，隶属于河南投资集团有限公司，河南省政府国有独资公司，注册资本金120亿元人民币。</p>
                        <h1>汇付天下</h1>
                        <p>汇付天下拥有中国人民银行颁发的《支付业务许可证》， 在中国支付行业排名三甲，2013年交易规模逾万亿元，网贷行业第一支付合作平台。</p>
                    </ul>
                </div>
            </div>
        </div>
        <jsp:include page="../foot.jsp" ></jsp:include>
        <jsp:include page="../login.jsp" ></jsp:include>
        <jsp:include page="../register.jsp" ></jsp:include>
        </body>
    </html>
    <!-- 在此引用相应页面的js -->
    <script src="<c:url value='/script/pc/index.js' />"></script>
<script src="<c:url value='/script/pc/login_new.js' />"></script>
<script src="<c:url value='/script/pc/register_new.js' />"></script>