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
         温馨提示：亲爱的客户，房产认证为借款授信额度提供参考，如有造假，您的贷款资格会被取消；并加入黑名单系统将无法贷款。
       </div>
 <form id="_person_form_"> 
<div class="panel panel-default">
  <div class="panel-body">
  <div class="col-xs-10">
      <div class="col-xs-3">
          
          <div> <span class="glyphicon glyphicon-user" style="margin-top: 50px;padding-left: 20px;font-size: 53px"/> </div>
           <div><h5>  我的房产信息</h5></div>
      </div>
          <div class="col-xs-7">
          
 <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">房产证照片</span>
  <span style="display: none">  <input id="fcz" name="fcz" type="file" /> </span>
  <span>     <button id="fcz_btn" class="btn btn-default" type="button">上传照片</button></span>
  </div>
   <div >
     <span id="fczyl"></span>  
   </div>   
   <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">证书编号</span>
  <input type="text" class="form-control" name="bh" placeholder=""> 
  </div>           
   <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">房产贷款</span>
 <label><input type="radio" name="dkbz" value="0" /> &nbsp;无</label>
                        <label style="margin-left: 40px;"><input type="radio" name="dkbz" value="1" /> &nbsp;有</label>
  </div>
       
            
    <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">房产贷款材料照片</span>
  <span style="display: none">  <input id="fcdk" name="fcdk" type="file" /> </span>
  <span>     <button id="fcdk_btn" class="btn btn-default" type="button">上传照片</button></span>
  </div>
   <div >
     <span id="fcdkyl"></span>  
   </div>        
  </div>
  </div>
</div>
   </div>
     
     
       <button id="_person_submit_btn" style="width: 60%;" class="button button-primary glow">提交</button>
     </form>
       <br/><br/>

  
   </div>
        
      
        </body>
    </html>
 
 