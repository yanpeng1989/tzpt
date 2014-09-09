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
           <div><h5>  我的基本信息</h5></div>
      </div>
          <div class="col-xs-7">
  <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">真实姓名</span>
  <input type="text" class="form-control" name="truename"  placeholder=""> 
  </div>
  
  <div class="input-group" style="width:100%">
  <label><input type="radio" name="sex" value="男" /> &nbsp;男</label>
                        <label style="margin-left: 40px;"><input type="radio" name="sex" value="女" /> &nbsp;女</label>
 </div>
 <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">出生日期</span>
    <input id="startDate"  class="form-control dateTime" type="text" name="birthday"/>
  </div>   
    <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon"> 籍 &nbsp;&nbsp;&nbsp;&nbsp;贯 </span>
  <input type="text" class="form-control" name="birth_address" placeholder=""> 
  </div>   
     <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">现居住地</span>
  <input type="text" class="form-control" name="present_address"  placeholder=""> 
  </div>   
  <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">现居住地居住时间</span>
  <select class="selectpicker" name="jztime">
   <option value="0">请选择</option> 
  <option value="1">半年以内</option>
<option  value="2">1年以内</option>
<option  value="3">2年以内</option>
<option  value="4">3年以内</option>
<option  value="5">3年以上</option>
  </select>
  </div>    
   <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">手机号码</span>
  <input type="text" class="form-control" name="tel" placeholder=""> 
  </div>     
      
   <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">身份证号</span>
  <input type="text" class="form-control" name="sfzmhm" placeholder=""> 
  </div>       
           
   <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">身份证正面照片</span>
     <input id="sfzzm" name="sfzzm" type="file" />   <label id="loading1" style="display: none">loading</label>
  </div>     
                <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">身份证反面照片</span>
      <input id="sfzfm" name="sfzfm" type="file" />  <label id="loading2" style="display: none">loading</label>
  </div>   
    <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">户口本照片</span>
      <input id="hkb" name="hkb" type="file" />  <label id="loading3" style="display: none">loading</label>
  </div>             
      <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">教育程度  
</span>
  <select class="selectpicker" name="education">
   <option value="0">请选择</option> 
<option  value="1">研究生以上</option>
<option  value="2">本科</option>
<option  value="3">大专</option>
<option  value="4">高中</option>
<option  value="5">中专</option>
<option  value="6">初中及以下</option>
</select>
  </div>     
    <div class="input-group" style="margin-bottom: 10px;width:100%">
  <span class="input-group-addon">婚姻状态</span>
  <select class="selectpicker" name="marital_status">
 <option value="0">请选择</option> 
<option>已婚</option>
<option>未婚</option>
<option>离异</option>
<option>丧偶</option>

</select>
  
  
  </div>               
  </div>
      </form>
  </div>
</div>
   </div><!--end pannel-->
 
     <button id="_person_submit_btn" style="width: 60%;" class="button button-primary glow">提交</button>
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
