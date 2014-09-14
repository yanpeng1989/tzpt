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
         温馨提示：亲爱的客户，我们会有严格的信息和安全加密机制，确保您的信息安全，不会向外界泄露。
请您认真填写。如有造假，您的贷款资格会被取消；并加入黑名单系统将无法贷款。
       </div>
 <form id="_person_form_"> 
<div class="panel panel-default">
  <div class="panel-body">
  <div class="col-xs-10">
      <div class="col-xs-3">
          
          <div> <span class="glyphicon glyphicon-user" style="margin-top: 50px;padding-left: 20px;font-size: 53px"/> </div>
           <div><h5>  我的工作信息</h5></div>
      </div>
          <div class="col-xs-7">
  <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">单位名称</span>
  <input type="text" class="form-control" name="company" placeholder=""> 
  </div>
   <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">单位地址</span>
  <input type="text" class="form-control" name="address" placeholder=""> 
  </div>           
   <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">部门</span>
  <input type="text" class="form-control" name="department" placeholder=""> 
  </div>
   <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">工作电话</span>
  <input type="text" class="form-control" name="jobtel" placeholder=""> 
  </div>            
  <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">职位</span>
  <input type="text" class="form-control" name="post"  placeholder=""> 
  </div>
      <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">工作名称</span>
  <input type="text" class="form-control" name="jobname"  placeholder=""> 
  </div>
               <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">工作年限</span>
 
    <select class="selectpicker" name="jobtime">
   <option value="">请选择</option> 
  <option value="1">5年以上</option>
<option  value="2">3～5年</option>
<option  value="3">1～3年</option>
<option  value="4">1年以内</option>
  </select>
  </div>
       <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">工作单位性质</span>
 
   <select class="selectpicker" name="property">
   <option value="">请选择</option> 
  <option value="1">国家机关、事业单位</option>
<option  value="2">企业</option>
<option  value="3">个体工商户</option>
<option  value="4">其他</option>
  </select>
  </div>
     <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">企业所处行业</span> 
   <select class="selectpicker" name="industry">
   <option value="">请选择</option> 
  <option value="1">公务员</option>
<option  value="2">科研教育医疗</option>
<option  value="3">金融电信电力</option>
<option  value="4">注册事务所</option>
<option  value="6">邮政交通公用</option>
<option  value="7">媒体文艺体育</option>
<option  value="8">工业商业贸易</option>
<option  value="9"> 其他</option>

  </select>
  </div>
   <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">企业规模</span>
  <input type="text" class="form-control" name="scale"   placeholder=""> 
  </div>     
   <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">月收入</span>
  <input type="text" class="form-control" name="income"  placeholder=""> 
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
 
    
    <script type="text/javascript">
      $('#startDate').datetimepicker({
        language:  'zh-CN',
        format:"yyyy-mm-dd",
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    </script>
