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
                            <h1>企业介绍</h1>
                            <li>【金交市】是【上海金交市互联网金融信息服务有限公司】推出的网络借贷平台。【金交市】利用自身在互联网领域以及信用风险定价领域的多年积淀，破除传统借贷交流的信息不对称特，为借款人以及投资人搭建透明、安全、高效的信息交互平台。</>
                                <h1>企业愿景</h1>
                            <li>【金交市】旨在服务中国广大的个人以及中小微企业用户，为个人以及中小微企业用户实现中国梦提供点滴贡献。</li>
                        </ul>
                    </ul>
                </div>
            </div>
        </div>
        <br/>
        <br/>
        <jsp:include page="../foot.jsp" ></jsp:include>
        <jsp:include page="../login.jsp" ></jsp:include>
        <jsp:include page="../register.jsp" ></jsp:include>
    </body>
</html>
<!-- 在此引用相应页面的js -->
<script src="<c:url value='/script/pc/index.js' />"></script>
<script src="<c:url value='/script/pc/login.js' />"></script>
<script src="<c:url value='/script/pc/register.js' />"></script>
