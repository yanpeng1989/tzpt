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
 <jsp:include page="head.jsp"></jsp:include>
  <body>
            <div style="text-align: center; width: 60%;" class="container">
                <div class="row">
                    <h4>我的密保信息</h4>
                  
                </div>
                <div class="row">
                    <div class="form-group">
 <form id="_mibao_form_"  class="form-horizontal" >
     <!--<div class="form-group">
          <label for="" class="col-sm-2 control-label">密保问题1</label>
                            <div class="col-sm-8">
                         <input type="text" class="form-control" minlength="6" check-type="required" name="qu1" id="qu1"   placeholder=""> 
             </div>
        </div>      -->                      
                            
       <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">密保问题1</span>
  <input type="text" class="form-control" minlength="6" check-type="required" name="qu1" id="qu1"   placeholder=""> 
  </div>
   <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">密保答案1</span>
  <input type="text" class="form-control" minlength="3" check-type="required"  name="an1" id="an1"   placeholder=""> 
  </div>
                             <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">密保问题2</span>
  <input type="text" class="form-control" name="qu2" id="qu2"   minlength="6" check-type="required"    placeholder=""> 
  </div>
   <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">密保答案2</span>
  <input type="text" class="form-control" name="an2" id="an2"   minlength="3" check-type="required"   placeholder=""> 
  </div>
                            <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">密保问题3</span>
  <input type="text" class="form-control" name="qu3" id="qu3"  minlength="6" check-type="required"   placeholder=""> 
  </div>
   <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">密保答案3</span>
  <input type="text" class="form-control" name="an3" id="an3"  minlength="3" check-type="required"   placeholder=""> 
  </div>      
             
                    
                            
                        <button id="_mibao_btn" style="width: 90%;" class="button button-primary glow">提交</button>
                        </form>
                    </div>
                </div>
            </div>
     </body>
     
 </html>