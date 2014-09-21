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
                                <div><h5>  我的账户信息</h5></div>
                            </div>
                            <div class="col-xs-7">

                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon">账户余额</span>
                                    <input type="text" class="form-control" id="available_assets" name="available_assets" placeholder=""> 
                                </div>           
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon">已投资资产</span>
                                    <input type="text" class="form-control" id="invested_assets" name="invested_assets" placeholder=""> 
                                </div>                    
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon">可以借款额度</span>
                                    <input type="text" class="form-control"id="credit_line" name="credit_line" placeholder=""> 
                                </div>     
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon">已借金额</span>
                                    <input type="text" class="form-control" id="debt_assets" name="debt_assets" placeholder=""> 
                                </div>     
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon">冻结资金</span>
                                    <input type="text" class="form-control" id="frozen_assets" name="frozen_assets" placeholder=""> 
                                </div>   
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon">我的金币</span>
                                    <input type="text" class="form-control" id="gold_coin" name="gold_coin" placeholder=""> 
                                </div>                   
                            </div>
                        </div>
                    </div>
                </div>
                <!--
                
                  <button id="_person_submit_btn" style="width: 60%;" class="button button-primary glow">我要充值</button>-->
            </form>
            <br/><br/>


        </div>


    </body>
</html>

 