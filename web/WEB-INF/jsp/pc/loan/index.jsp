<%-- 
    Document   : index
    Created on : 2014-11-12, 9:20:08
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../head.jsp"></jsp:include>
        <style>
            #loan_step_container {
                width: 1075px;
                height: 760px;
                text-align: left;
                margin-bottom: 20px;
            }
            #step_menu {
                height: 760px;
                width: 230px;
                float: left;
                background-color: #4CCFBF;
                padding: 10px;
            }
            #loan_form_container {
                float: left;
                height: 760px;
                width: 840px;
                border: 1px #e1e1e1 solid;
                color: grey;
            }
            #loan_form_container input, #loan_form_container select{
                border-radius: 2px;
            }

            #loan_form_container input:focus {
                border: 1px #EB5D68 solid;
            }

            #loan_form_container form {
                margin-top: 40px;
            }
            .form-row {
                margin-top: 10px;
            }
            .loan-menu-item {
                height: 50px;
                border-bottom: 1px #eee solid;
                line-height: 50px;
                color: white;
                position: relative;
                width: 100%;
            }
            .correct-step {
                background-color: white;position: absolute;right: 10px;top: 18px;
            }
            .item-header {
                color: gray;
                font-size: 18px;
                text-align: left;
                padding-left: 20px;
                height: 60px;
                line-height: 60px;
                font-weight: 400;
                border-bottom: 1px #ddd solid;
                width: 90%;
            }
            .require-star {
                color: #EB5D68;
                font-weight: 600;
            }
            .sub-title {
                color: #343434;
                background-color: #ddd;
                line-height: 30px;
                height: 30px;
                padding-left: 20px;
                width: 90%;
                margin-top: 20px;
            }
            .red-title {
                color: #EB5D68;
                font-size: 19px;
                font-weight: 200;
                width: 90%;
                text-align: left;
            }
            .detail-table {
                width: 90%;
            }
            .detail-table thead {
                background-color: #ddd;
            }
            .detail-table thead tr th{
                height: 30px;
                padding-left: 20px;
            }
            .detail-table tbody tr td{
                height: 30px;
                padding-left: 20px;
            }
            .loan-check-img {
                color: #0099c1;
                font-weight: 200;
                cursor: pointer;
                padding-top: 5px;
            }
        </style>
        <body>
        <jsp:include page="../top.jsp"></jsp:include>
            <div align="center">
                <div id="top_tip" style="width: 60%;text-align: left;" class="alert alert-danger" role="alert">
                    <strong>温馨提示：</strong>
                    亲爱的客户，我们会有严格的信息和安全加密机制，确保您的信息安全，不会向外界泄露。 请您认真填写。如有造假，您的贷款资格会被取消；并加入黑名单系统将无法贷款。
                </div>
                <img style="margin-top: 15px; margin-bottom: 10px;" src="<c:url value="/images/pc/steps.png" />" />
            <div id="loan_step_container">
                <div id="step_menu" align="center">
                    <img src="<c:url value="/images/pc/head_icon.jpg" />" />
                    <c:if test='${out["loan_type"] eq "personal"}'>
                        <div class="loan-menu-item">
                            借款信息 
                            <c:if test='${out["step"] eq "1"}'>
                                <img class="correct-step" border="0" width="15" height="15" />
                            </c:if>
                        </div>
                        <div class="loan-menu-item">个人信息
                            <c:if test='${out["step"] eq "2"}'>
                                <img class="correct-step" border="0" width="15" height="15" />
                            </c:if>
                        </div>
                        <div class="loan-menu-item">资产信息
                            <c:if test='${out["step"] eq "3"}'>
                                <img class="correct-step" border="0" width="15" height="15" />
                            </c:if>
                        </div>
                        <div class="loan-menu-item">工作信息
                            <c:if test='${out["step"] eq "4"}'>
                                <img class="correct-step" border="0" width="15" height="15" />
                            </c:if>
                        </div>
                        <div class="loan-menu-item">联系人信息
                            <c:if test='${out["step"] eq "5"}'>
                                <img class="correct-step" border="0" width="15" height="15" />
                            </c:if>
                        </div>
                        <div class="loan-menu-item">上传文件
                            <c:if test='${out["step"] eq "6"}'>
                                <img class="correct-step" border="0" width="15" height="15" />
                            </c:if>
                        </div>
                    </c:if>
                    <c:if test='${out["loan_type"] eq "company"}'>
                        <div class="loan-menu-item">
                            借款信息 
                            <c:if test='${out["step"] eq "1"}'>
                                <img class="correct-step" border="0" width="15" height="15" />
                            </c:if>
                        </div>
                        <div class="loan-menu-item">个人信息
                            <c:if test='${out["step"] eq "2"}'>
                                <img class="correct-step" border="0" width="15" height="15" />
                            </c:if>
                        </div>
                        <div class="loan-menu-item">企业信息
                            <c:if test='${out["step"] eq "3"}'>
                                <img class="correct-step" border="0" width="15" height="15" />
                            </c:if>
                        </div>
                        <div class="loan-menu-item">联系人信息
                            <c:if test='${out["step"] eq "4"}'>
                                <img class="correct-step" border="0" width="15" height="15" />
                            </c:if>
                        </div>
                        <div class="loan-menu-item">上传文件
                            <c:if test='${out["step"] eq "5"}'>
                                <img class="correct-step" border="0" width="15" height="15" />
                            </c:if>
                        </div>
                    </c:if>
                </div>
                <div id="loan_form_container" align="center">
                    <c:if test='${out["loan_type"] eq "personal"}'>
                        <c:if test='${out["step"] eq "1"}'>
                            <jsp:include page="./loan.jsp" ></jsp:include>
                        </c:if>
                        <c:if test='${out["step"] eq "2"}'>
                            <jsp:include page="./personal.jsp" ></jsp:include>
                        </c:if>
                        <c:if test='${out["step"] eq "3"}'>
                            <jsp:include page="./assets.jsp" ></jsp:include>
                        </c:if>
                        <c:if test='${out["step"] eq "4"}'>
                            <jsp:include page="./job.jsp" ></jsp:include>
                        </c:if>
                        <c:if test='${out["step"] eq "5"}'>
                            <jsp:include page="./contacts.jsp" ></jsp:include>
                        </c:if>
                        <c:if test='${out["step"] eq "6"}'>
                            <jsp:include page="./p_details.jsp" ></jsp:include>
                        </c:if>
                    </c:if>
                    <c:if test='${out["loan_type"] eq "company"}'>
                        <c:if test='${out["step"] eq "1"}'>
                            <jsp:include page="./loan.jsp" ></jsp:include>
                        </c:if>
                        <c:if test='${out["step"] eq "2"}'>
                            <jsp:include page="./personal.jsp" ></jsp:include>
                        </c:if>
                        <c:if test='${out["step"] eq "3"}'>
                            <jsp:include page="./company.jsp" ></jsp:include>
                        </c:if>
                        <c:if test='${out["step"] eq "4"}'>
                            <jsp:include page="./contacts.jsp" ></jsp:include>
                        </c:if>
                        <c:if test='${out["step"] eq "5"}'>
                            <jsp:include page="./c_details.jsp" ></jsp:include>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
        <jsp:include page="../foot.jsp" ></jsp:include>
        <jsp:include page="../login.jsp" ></jsp:include>
        <jsp:include page="../register.jsp" ></jsp:include>
        </body>
    </html>
    <script type="text/javascript">
        var loanType = "${out["loan_type"]}";
</script>
<c:if test='${out["step"] eq "1"}'>
    <script type="text/javascript" src="<c:url value="/script/pc/loan/loan.js" />"></script>
</c:if>
<c:if test='${out["step"] eq "2"}'>
    <script type="text/javascript" src="<c:url value="/script/pc/loan/personal.js" />"></script>
</c:if>
<c:if test='${out["loan_type"] eq "personal"}'>
    <c:if test='${out["step"] eq "3"}'>
        <script type="text/javascript" src="<c:url value="/script/pc/loan/assets.js" />"></script>
    </c:if>
    <c:if test='${out["step"] eq "4"}'>
        <script type="text/javascript" src="<c:url value="/script/pc/loan/job.js" />"></script>
    </c:if>
    <c:if test='${out["step"] eq "5"}'>
        <script type="text/javascript" src="<c:url value="/script/pc/loan/contacts.js" />"></script>
    </c:if>
    <c:if test='${out["step"] eq "6"}'>
        <script type="text/javascript" src="<c:url value="/script/pc/loan/p_details.js" />"></script>
    </c:if>
</c:if>
<c:if test='${out["loan_type"] eq "company"}'>
    <c:if test='${out["step"] eq "3"}'>
        <script type="text/javascript" src="<c:url value="/script/pc/loan/company.js" />"></script>
    </c:if>
    <c:if test='${out["step"] eq "4"}'>
        <script type="text/javascript" src="<c:url value="/script/pc/loan/contacts.js" />"></script>
    </c:if>
    <c:if test='${out["step"] eq "5"}'>
        <script type="text/javascript" src="<c:url value="/script/pc/loan/c_details.js" />"></script>
    </c:if>
</c:if>