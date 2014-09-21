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
    <jsp:include page="../../head.jsp"></jsp:include>
        <body>
            <div class="row" style="margin-left: 80px;">
                <div class="alert alert-warning" role="alert"> 
                    温馨提示：  
                </div>
                <form id="_person_form_"> 
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="col-xs-10">
                                <div class="col-xs-3">
                                    <div> <span class="glyphicon glyphicon-user" style="margin-top: 50px;padding-left: 20px;font-size: 53px"/> </div>
                                    <div style="padding-left: 20px;"><h5>  我的银行卡</h5></div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="alert alert-info" id="pcard">
                                        <span   class="glyphicon glyphicon-plus"></span> <a id="addcard" href="#">添加银行卡</a>
                                        <br><br><br><br><br>

                                    </div>
                                    <input id='qxbd' style="display: none"   type='button' value='取消绑定'>

                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <br/><br/>
            </div>
        <jsp:include page="bankcard.jsp" ></jsp:include>
    </body>
</html>


