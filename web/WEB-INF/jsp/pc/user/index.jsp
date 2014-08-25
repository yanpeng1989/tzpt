<%-- 
    Document   : index
    Created on : 2014-8-25, 11:19:29
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
    <link href="<c:url value='/css/pc/user/index.css' />" rel="stylesheet" />

    <body>
        <jsp:include page="../top.jsp"></jsp:include>

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
                                        <li href="<c:url value='/pc/user/basic_info.do' />">基本信息</li>
                                        <li href="http://zhidao.baidu.com">工作信息</li>
                                        <li>房产信息</li>
                                    </ul>
                                </div>
                                <div id="account_info" class="function-list-item">
                                    <h4>个人账户</h4>
                                    <ul class="function-child-list">
                                        <li>账户信息</li>
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
                        <div style="height: 2px;width: 100%;background-color: #efefef;margin-top: 6px;margin-bottom: 1px;"></div>
                        <iframe id="_personal_iframe" src="" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" width="100%" height="1000">

                        </iframe>
                    </td>
                </tr>
            </table>
        <jsp:include page="../foot.jsp" ></jsp:include>
    </body>
</html>
