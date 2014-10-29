<%-- 
    Document   : index
    Created on : 2014-8-25, 11:19:29
    Author     : cyss210
--%>

<%@page import="com.cysoa.frame.util.GlobalUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <jsp:include page="../head.jsp"></jsp:include>
    <link href="<c:url value='/css/pc/user/index.css' />" rel="stylesheet" />
    <link href="<c:url value='/css/frame/famo/bootstrap.min.css' />" rel="stylesheet" />

    <body>
        <jsp:include page="../top.jsp"></jsp:include>
        <div  style="height: 900px;width: 220px;margin-top: 30px;margin-left: 10%;background:#4DCFBF ">
            <div class="row">
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
        </div>
        <div style="height: 20px">
        </div>

        <jsp:include page="../foot.jsp" ></jsp:include>
        <jsp:include page="../login.jsp" ></jsp:include>
        <jsp:include page="../register.jsp" ></jsp:include>
    </body>
</html>
<script src="<c:url value='/script/pc/index.js' />"></script>
<script src="<c:url value='/script/pc/login_new.js' />"></script>
<script src="<c:url value='/script/pc/register_new.js' />"></script>
