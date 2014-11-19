<%-- 
    Document   : page1
    Created on : 2014-10-24, 14:47:12
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
            String ywflag = "000";
            Object obj = session.getAttribute(GlobalUtil.session_tag);
            Map<String, Object> ses = (HashMap<String, Object>) obj;
            if (ses != null) {
                ywflag = (String) ses.get("ywflag");
            }
            String toMenu = request.getParameter("tomenu") == null ? "" : request.getParameter("tomenu").toString();
            String errMsg = request.getParameter("errMsg") == null ? "" : request.getParameter("errMsg").toString();
        %> 
        <input type="hidden" id="tomenu" value="<%=toMenu%>">
        <input type="hidden" id="errMsg" value="<%=errMsg%>">
        <input id="ywflag" type="hidden" value="<%=ywflag%>">
        <div align="center">
            <div id="top_tip" class="alert alert-danger" role="alert">
                <strong>温馨提示：</strong>
                亲爱的客户，我们会有严格的信息和安全加密机制，确保您的信息安全，不会向外界泄露。 请您认真填写。如有造假，您的贷款资格会被取消；并加入黑名单系统将无法贷款。
            </div>

            <div id="main_container">
                <table style="margin: 0px;" border="0" cellpacing="0" cellpadding="0">
                    <tr>
                        <td width="264" style="vertical-align: top" >
                            <div id="menu_list" class="panel panel-default">
                                <div class="panel-heading"  align="center">
                                    <a href="/tzpt/pc/user/index.do">   <strong class="menu-title">我的账户</strong> </a>
                                </div>
                                <div class="panel-body">
                                    <ul class="sub-menu-list">
                                        <li class="sub-menu-title">
                                            <img src="<c:url value="/images/pc/menu_icon.jpg" />" width="20" height="auto" />
                                            资金管理
                                        </li>

                                        <li class="sub-menu-item" id="projecttz" href="<c:url value='/pc/p2p/user_invest_list.do' />">
                                            <label class="dot"></label>我的投资
                                        </li>
                                        <li class="sub-menu-item" id="projectjk" href="<c:url value='/pc/p2p/user_loan_list.do' />">
                                            <label class="dot" ></label>我的融资
                                        </li>
                                        <li class="sub-menu-item" id="projectgive" href="<c:url value='/pc/p2p/user_invest_give.do' />">
                                            <label class="dot" ></label>投资转让
                                        </li>
                                    </ul>

                                    <ul class="sub-menu-list">
                                        <li class="sub-menu-title">
                                            <img src="<c:url value="/images/pc/menu_icon.jpg" />" width="20" height="auto" />
                                            账户管理
                                        </li>
                                        <li class="sub-menu-item"   id="base"  href="<c:url value='/pc/nuser/personal.do' />">
                                            <label class="dot"></label>基本信息
                                        </li>
                                        <li class="sub-menu-item"  id="assets"  href="<c:url value='/pc/nuser/assets.do' />">
                                            <label class="dot" ></label>资产信息
                                        </li>
                                        <li class="sub-menu-item"  id="job"  href="<c:url value='/pc/nuser/job.do' />">
                                            <label class="dot" ></label>工作信息
                                        </li>
                                        <li class="sub-menu-item" href="<c:url value='/pc/p2p/account/account_bankcard.do' />">
                                            <label class="dot"></label>银行卡绑定
                                        </li>
                                        <li class="sub-menu-item" href="<c:url value='/pc/nuser/contacts.do' />">
                                            <label class="dot"></label>常用联系人
                                        </li>
                                        <li class="sub-menu-item"  id="stat"  href="<c:url value='/pc/nuser/p_details.do' />">
                                            <label class="dot"></label>个人资料上传
                                        </li>
                                        <li class="sub-menu-item" id="qy_stat"  href="<c:url value='/pc/nuser/c_details.do' />">
                                            <label class="dot" ></label>企业资料上传
                                        </li>
                                        <li class="sub-menu-item"  id="pwdpro"  href="<c:url value='/pc/pwd_protection.do' />">
                                            <label class="dot"></label>密码信息
                                        </li>
                                    </ul>
                                    <!--
                                     <ul class="sub-menu-list">
                                         <li class="sub-menu-title">
                                             <img src="<c:url value="/images/pc/menu_icon.jpg" />" width="20" height="auto" />
                                             投资管理
                                         </li>
                                        
                                     </ul>
                                    -->
                                </div>
                            </div>
                        </td>
                        <td width="800">
                            <div id="iframe_container">
                                <iframe id="_personal_iframe" style="margin-top: 0px;" src="" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes" width="800" height="900">

                                </iframe>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <jsp:include page="../foot.jsp" ></jsp:include>
    </body>
</html>
<script type="text/javascript">
    $(function() {
        $("#_personal_iframe").attr("src", $(".sub-menu-item:first").attr("href"));
        $(".sub-menu-item").click(function() {
            var href = $(this).attr("href");
            $("#_personal_iframe").attr("src", href);
        });
        $("#_personal_iframe").attr("src", "/tzpt/pc/test/page3.do");
    });
</script>
