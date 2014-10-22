<%-- 
    Document   : invest.jsp
    Created on : 2014-8-17, 17:47:42
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../head.jsp"></jsp:include>
    <link href="<c:url value='/css/pc/p2p/loan.css' />" rel="stylesheet" />
    <body>
        <jsp:include page="../top.jsp"></jsp:include>
            <div class="container">
                <div class="row" style="margin-left: 80px;">
                    <div class="alert alert-warning" role="alert"> 
                        温馨提示：亲爱的客户，我们会有严格的信息和安全加密机制，确保您的信息安全，不会向外界泄露。
                        请您认真填写。如有造假，您的贷款资格会被取消；并加入黑名单系统将无法贷款。
                    </div>
                    
                    <div class="alert alert-warning" role="alert"> 
              <span class="glyphicon glyphicon-remove-circle" id="basestate" style="margin-right: 60px;">个人基本信息审核</span>
            <span class="glyphicon glyphicon-remove-circle"   id="workstate"  style="margin-right: 60px;">个人工作信息审核</span>   
            <span class="glyphicon glyphicon-ok-circle"  id="cardstate"  style="margin-right: 60px;">个人银行卡信息绑定</span>   
             <span class="glyphicon glyphicon-remove-circle" id="loadstate" style="margin-right: 60px;">借贷信息审核</span>   
             
                    </div>
                    <form id="_person_form_"  method="post"> 
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="col-xs-10">
                                    <div class="col-xs-3">
                                        <div> <span class="glyphicon glyphicon-user" style="margin-top: 50px;padding-left: 20px;font-size: 53px"/> </div>
                                        <div><h5> 我要借款</h5></div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="input-group" style="margin-bottom: 10px;width:100%">
                                            <span class="input-group-addon">借款金额</span>
                                            <input type="text" class="form-control"  id="sum" name="sum" placeholder=""> 
                                        </div>
                                        <div class="input-group" style="margin-bottom: 10px;width:100%">
                                            <label><input type="radio" name="jktype" checked="checked" value="1" /> &nbsp;个人消费</label>
                                            <label style="margin-left: 40px;"><input type="radio" name="jktype" value="2" /> &nbsp;个人经营</label>
                                        </div>           
                                        <div class="input-group" style="margin-bottom: 10px;width:100%;display: none">
                                            <span class="input-group-addon">姓名</span>
                                            <input type="text" name="jkname" id="jkname"  value="name" class="form-control"  placeholder=""> 
                                        </div>
                                        <div class="input-group" style="margin-bottom: 10px;width:100%">
                                            <label><input type="radio" name="paymethod" checked="checked" value="1" /> &nbsp;等额本息</label>
                                          
                                        </div>            
                                        <div class="input-group" style="margin-bottom: 10px;width:100%">
                                            <span class="input-group-addon">还款次数</span>
                                            <select class="selectpicker" id="paytime" name="paytime">
                                                <option value="0">请选择</option> 
                                                <option value="1">1</option>
                                                <option  value="2">2</option>
                                                <option  value="3">3</option>
                                                <option  value="4">4</option>
                                                 <option  value="5">5</option>
                                                  <option  value="6">6</option>
                                                   <option  value="7">7</option>
                                                    <option  value="8">8</option>
                                                     <option  value="9">9</option>
                                                      <option  value="10">10</option>
                                                       <option  value="11">11</option>
                                                        <option  value="12">12</option>
                                                        
                                            </select>
                                        </div>
                                        <div class="input-group" style="margin-bottom: 10px;width:100%">
                                            <span class="input-group-addon">借款标题</span>
                                            <input type="text" class="form-control" id="title" name="title"   placeholder=""> 
                                        </div>    
                                        <div class="input-group" style="margin-bottom: 10px;width:100%">
                                            <span class="input-group-addon">借款详情</span>
                                            <input type="textarea" style="height:70px;width:100%" id="detail" name="detail"   placeholder=""> 
                                        </div>     
                                        
                                      <center><button id="_person_submit_btn" style="width: 60%;" class="button button-primary glow">提交</button></center>
                                    </div>
                                </div>
                            </div>
                        </div>
                      
                    </form>
                    <br/><br/>
                </div>
            </div>
        <jsp:include page="../foot.jsp" ></jsp:include>
        <jsp:include page="../login.jsp" ></jsp:include>
        <jsp:include page="../register.jsp" ></jsp:include>
        </body>
    </html>
<script src="<c:url value='/script/pc/index.js' />"></script>
<script src="<c:url value='/script/pc/login.js' />"></script>
<script src="<c:url value='/script/pc/register.js' />"></script>