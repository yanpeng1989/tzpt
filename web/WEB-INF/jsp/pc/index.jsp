<%-- 
    Document   : index
    Created on : 2014-7-31, 11:38:53
    Author     : cyss210
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.cysoa.frame.util.GlobalUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <jsp:include page="head.jsp"></jsp:include>
    <link href="<c:url value='/css/pc/index.css' />" rel="stylesheet" />
    <body>
        <jsp:include page="top.jsp"></jsp:include>
            <style>
                .hot_pro {
                    display: inline-block;
                    border-left: 1px #ccc solid;
                    border-right: 1px #ccc solid
                }
            </style>
            <div id="ad_list">
            <%String ywlx = request.getParameter("ywlx") == null ? "" : (String) request.getParameter("ywlx");
            %>
            <div class="login_panel">
            </div>
            <div id="login_panel" class="login_panel">
                <div id="big_title">历史年化收益率</div>
                <div id="average_content" class="login_content">
                    <label>平均</label>
                    <i>16.08%</i>
                </div>
                <div class="login_content">
                    <label class="login-panel-label"><i>40</i>倍活期存款收益</label>
                    <label style="margin-left: 4px;" class="login-panel-label"><i>3</i>倍货币基金收益</label>
                </div>
                <%
               
                Object obj = session.getAttribute(GlobalUtil.session_tag);
                Map<String, Object> ses = null;
                if (obj == null) {
                    ses = new HashMap<String, Object>();
                    session.setAttribute(GlobalUtil.session_tag, ses);
                } else {
                    ses = (HashMap<String, Object>) obj;
                }
                //  session.setAttribute(GlobalUtil.login_tag,"tenssion" );
                if (ses.get("nc") == null) {
             
                
                %>
                <button id="register_right_now" onclick="_registerModal();" class="button glow button-flat-royal register_btn">立即注册</button>
                <div id="login_link_div" >
                    <label>
                        已有帐号?<a href="#this" onclick="_loginModal();" id="login_link">立即登录</a>
                    </label>
                </div>
                <%} else {%>
                <div id="login_link_div">
                    <center>
                        <font color="red" szie="2"> 恭喜您登录成功！</font>
                    </center>
                </div>  
                <%}%>
            </div>
        </div>

        <div id="simple_introduce" class="container">
            <div class="row">
                <div class="col-sm-4 introduce">
                    <div id="first" class=""></div>
                    <div class="introduce_title introduce_content_first">安全性</div>
                    <div class="introduce_content introduce_content_first">河南投资集团担保公司本息全额担保</div>
                    <div class="introduce_content"></div>
                </div>
                <div class="col-sm-4 introduce">
                    <div id="second"></div>
                    <div class="introduce_title">高收益</div>
                    <div class="introduce_content introduce_content_second">年化收益8%～9%</div>
                    <div class="introduce_content"> </div>
                </div>
                <div class="col-sm-4 introduce">
                    <div id="third"></div>
                    <div class="introduce_title">便捷度</div>
                    <div class="introduce_content introduce_content_third">最快1小时放款</div>
                    <div class="introduce_content"></div>
                </div>
            </div>
        </div>
        <div style="background: #FFFFFF;height: 350px;text-align: center">
            <div class="introduce_title" style="text-align: center">热点投资推荐</div>
            <div class="hot_pro" style="margin-right: 10px;">
                <a href="<c:url value="/pc/p2p/invest_tj.do?load_id=1415697116196" />"><img src="/tzpt/images/pc/advertisement_1.png"></a>
            </div>
            <div class="hot_pro">
                <a href="#this"><img src="/tzpt/images/pc/advertisement_1.png"></a>
            </div>
            <div class="hot_pro" style="margin-left: 10px;">
                <a href="#this"><img src="/tzpt/images/pc/advertisement_1.png"></a>
            </div>
        </div>

        <jsp:include page="foot.jsp" ></jsp:include>
        <jsp:include page="login.jsp" ></jsp:include>
        <jsp:include page="register.jsp" ></jsp:include>
        </body>
    </html>
    <!-- 在此引用相应页面的js -->
<script src="<c:url value='/script/pc/index.js' />"></script>
<script src="<c:url value='/script/pc/login_new.js' />"></script>
<script src="<c:url value='/script/pc/register_new.js' />"></script>
