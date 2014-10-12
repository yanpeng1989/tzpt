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
            <div class="row" style="width: 60%;float: right;margin-right:110px;margin-top: 50px">
                <div class="span2">
                    <ul class="nav nav-pills nav-stacked">
                        <ul>
                            <h1>上海总部</h1>
                            <p>【地址待定】</p>
                            <h1>郑州分部</h1>
                            <p>【地址待定】</p>
                            <p>电话联系</p>
                            <p>全国客服专线：【400-xxx-xxxx】</p>
                            <p>人工服务时间：9:00 － 21:00</p>
                            <p>在线留言</p>
                            <p>如果您有任何疑问，也可点击【在线留言】，我们将在第一时间回复您。</p>
                            <p>微信平台</p>
                            <p>如果您想了解我们更多最新信息，请关注我们的微信平台【xxxxx】。</p>
                        </ul>
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
<script src="<c:url value='/script/pc/login.js' />"></script>
<script src="<c:url value='/script/pc/register.js' />"></script>
