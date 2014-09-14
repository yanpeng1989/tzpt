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

    <body>
        <jsp:include page="../top.jsp"></jsp:include>
   <%
          String ywflag="000";
           Object obj = session.getAttribute(GlobalUtil.session_tag);
           Map<String, Object> ses =   (HashMap<String, Object>) obj;
                if(ses!=null){
                ywflag=(String)ses.get("ywflag");
                }
            %> 
            <table style="margin: 0px;" border="0" cellpacing="0" cellpadding="0" width="100%">
                <tr>
                    <td width="325" height="1000">
                        <div style="height: 1000px;"> 
                            <div id="function_type" class="frame-color">
                                <ul id="function_type_list">
                                    <li ref="#personal_info" class="funciton-type-item">
                                        <div id="f1"></div>
                                        <label>个人</label>
                                    </li>
                                    <li ref="#account_info" class="funciton-type-item">
                                        <div id="f2"></div>
                                        <label>账户</label>
                                    </li>
                                    <li ref="#project_info" class="funciton-type-item">
                                        <div id="f3"></div>
                                        <label>项目</label>
                                    </li>
                                </ul>
                            </div>
                            <div id="function_list">
                                <div id="personal_info" class="function-list-item">
                                    <h4>个人信息</h4>
                                    <ul class="function-child-list">
                                        <li id="base" href="<c:url value='/pc/p2p/information/person_info.do' />">基本信息</li>
                                        <li id="job" href="<c:url value='/pc/p2p/information/work_info.do' />">工作信息</li>
                                        <li href="<c:url value='/pc/p2p/account/account_bankcard.do' />">银行卡绑定</li>
                                         <li id="education" href="<c:url value='/pc/p2p/information/education_info.do' />">学历信息</li>
                                          <li id="car" href="<c:url value='/pc/p2p/information/car_info.do' />">车辆信息</li>
                                           <li id="house"  href="<c:url value='/pc/p2p/information/house_info.do' />">房产信息</li>
                                        
                                    </ul>
                                </div>
                                <div id="account_info" class="function-list-item">
                                    <h4>个人账户</h4>
                                    <ul class="function-child-list">
                                       <li href="<c:url value='/pc/p2p/account/account_info.do' />">账户信息</li>
                                       <li href="<c:url value='/pc/p2p/account/account_recharge.do' />">充值提现</li>
                                       
                                    </ul>
                                </div>
                                <div id="project_info" class="function-list-item">
                                    <h4>参与项目</h4>
                                    <ul class="function-child-list">
                                        <li>投资项目</li>
                                        <li>借贷项目</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div style="height: 2px;width: 100%;background-color: #efefef;margin-top: 6px;margin-bottom: 1px;"><input id="ywflag" type="hidden" value="<%=ywflag%>"></div>
                        
                        <iframe id="_personal_iframe" src="" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" width="100%" height="1000">

                        </iframe>
                    </td>
                </tr>
            </table>
        <jsp:include page="../foot.jsp" ></jsp:include>
        <jsp:include page="../login.jsp" ></jsp:include>
        <jsp:include page="../register.jsp" ></jsp:include>
    </body>
</html>
   <script src="<c:url value='/script/pc/index.js' />"></script>
 <script src="<c:url value='/script/pc/login.js' />"></script>
<script src="<c:url value='/script/pc/register.js' />"></script>
