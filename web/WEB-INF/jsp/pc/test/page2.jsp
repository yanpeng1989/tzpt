<%-- 
    Document   : page1
    Created on : 2014-10-24, 14:47:12
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../head.jsp" />
    <link href="<c:url value="/css/pc/test/page2.css" />" rel="stylesheet" />
    <body>
        <jsp:include page="../top.jsp"></jsp:include>
            <div align="center">
                <div id="top_tip" class="alert alert-danger" role="alert">
                    <strong>温馨提示：</strong>
                    亲爱的客户，我们会有严格的信息和安全加密机制，确保您的信息安全，不会向外界泄露。 请您认真填写。如有造假，您的贷款资格会被取消；并加入黑名单系统将无法贷款。
                </div>

                <div id="main_container">
                    <table style="margin: 0px;" border="0" cellpacing="0" cellpadding="0">
                        <tr>
                            <td width="264">
                                <div id="menu_list" class="panel panel-default">
                                    <div class="panel-heading" align="center">
                                        <strong class="menu-title">我的账户</strong>
                                    </div>
                                    <div class="panel-body">
                                        <ul class="sub-menu-list">
                                            <li class="sub-menu-title">
                                                <img src="<c:url value="/images/pc/menu_icon.jpg" />" width="20" height="auto" />
                                            资金管理
                                        </li>
                                        <li class="sub-menu-item"  href="<c:url value='/pc/p2p/account/account_recharge.do' />">
                                            <label class="dot"></label>充值
                                        </li>
                                        <li class="sub-menu-item"  href="<c:url value='/pc/p2p/account/account_recharge.do' />">
                                            <label class="dot"></label>提现
                                        </li>
                                    </ul>

                                    <ul class="sub-menu-list">
                                        <li class="sub-menu-title">
                                            <img src="<c:url value="/images/pc/menu_icon.jpg" />" width="20" height="auto" />
                                            账户管理
                                        </li>
                                        <li class="sub-menu-item"   id="base"  href="<c:url value='/pc/p2p/information/person_info.do' />">
                                            <label class="dot"></label>基本信息
                                        </li>
                                        <li class="sub-menu-item"  id="job"  href="<c:url value='/pc/p2p/information/work_info.do' />">
                                            <label class="dot" ></label>工作信息
                                        </li>
                                        <li class="sub-menu-item" href="<c:url value='/pc/p2p/account/account_bankcard.do' />">
                                            <label class="dot"></label>银行卡绑定
                                        </li>
                                        <li class="sub-menu-item"  id="education" href="<c:url value='/pc/p2p/information/education_info.do' />">
                                            <label class="dot"></label>学历信息
                                        </li>
                                        <li class="sub-menu-item"  id="house"  href="<c:url value='/pc/p2p/information/house_info.do' />">
                                            <label class="dot"></label>房产信息
                                        </li>
                                        <li class="sub-menu-item"  id="stat"  href="<c:url value='/pc/p2p/information/person_statement.do' />">
                                            <label class="dot"></label>个人资料上传
                                        </li>
                                        <li class="sub-menu-item" id="qy_stat"  href="<c:url value='/pc/p2p/information/company_statement.do' />">
                                            <label class="dot" ></label>企业资料上传
                                        </li>
                                        <li class="sub-menu-item"  id="pwdpro"  href="<c:url value='/pc/pwd_protection.do' />">
                                            <label class="dot"></label>密码信息
                                        </li>
                                    </ul>

                                    <ul class="sub-menu-list">
                                        <li class="sub-menu-title">
                                            <img src="<c:url value="/images/pc/menu_icon.jpg" />" width="20" height="auto" />
                                            投资管理
                                        </li>
                                        <li class="sub-menu-item" id="projecttz" href="<c:url value='/pc/p2p/user_invest_list.do' />">
                                            <label class="dot"></label>我的投资
                                        </li>
                                        <li class="sub-menu-item" id="projectjk" href="<c:url value='/pc/p2p/user_loan_list.do' />">
                                            <label class="dot" ></label>我的融资
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div id="iframe_container">
                                <iframe id="_personal_iframe" style="margin-top: -11px;" src="" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes" width="100%" height="600">

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
        $(".sub-menu-item").click(function(){
            var href = $(this).attr("href");
            $("#_personal_iframe").attr("src", href);
        });
    });
</script>
