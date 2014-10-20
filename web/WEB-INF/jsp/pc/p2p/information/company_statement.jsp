<%-- 
    Document   : index
    Created on : 2014-7-31, 11:38:53
    Author     : cyss210
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.cysoa.frame.util.GlobalUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <jsp:include page="../../head.jsp"></jsp:include>
        <body>
        <%
            String ywflag = "000";
            Object obj = session.getAttribute(GlobalUtil.session_tag);
            Map<String, Object> ses = (HashMap<String, Object>) obj;
            if (ses != null) {
                ywflag = (String) ses.get("ywflag");
            }
        %> 
        <input id="ywflag" type="hidden" value="<%=ywflag%>">



        <div  style="margin-left: 80px;">
            <div class="alert alert-warning" id="msg" role="alert"> 
                温馨提示：亲爱的客户，我们会有严格的信息和安全加密机制，确保您的信息安全，不会向外界泄露。
                请您认真填写。如有造假，您的贷款资格会被取消；并加入黑名单系统将无法贷款。<br>
            </div>


            <div class="form-group">
                <div class="col-sm-1">  
                 <!--   <span class="glyphicon glyphicon-user"  > </span>
                    <h5> 我的基本信息</h5> -->
                </div>
                <div class="col-sm-9">
                    <form id="_person_form_"  class="form-horizontal">
                        <div class="panel panel-default">
                            <div class="panel-body" style="width:80%" >   
                            <div>    
                                <h5> 企业证明材料信息</h5>  <hr>
                 <div><input type="hidden" id="regid" name="regid" value="<%=ses.get("id")==null?"":ses.get("id").toString()%>"></div>
                             </div>  
                             <div style="margin-left: 5px;">   
                               <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">企业营业执照照片</span>
                                    <span style="display: none">  <input id="stat1" name="stat1" type="file" /> </span>
                                    <span class="input-group-addon">     <button id="stat1_btn" class="btn btn-default" type="button">上传照片</button></span>
                                     <span class="input-group-addon">组织机构代码照片</span>
                                     <span style="display: none">  <input id="stat2" name="stat2" type="file" /> </span>
                             <span class="input-group-addon">      <button id="stat2_btn" class="btn btn-default" type="button">上传照片</button></span>
                               </div>    
                                <div >
                                    <span id="stat1yl"></span>    <span id="stat2yl" style="margin-left: 30px"></span>  
                                </div>      
                             
                               <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">税务登记证书照片</span>
                                    <span style="display: none">  <input id="stat3" name="stat3" type="file" /> </span>
                                    <span class="input-group-addon">       <button id="stat3_btn" class="btn btn-default" type="button">上传照片</button></span>
                                   <span class="input-group-addon">担保函照片</span>
                                    <span style="display: none">  <input id="stat4" name="stat4" type="file" /> </span>
                                    <span class="input-group-addon">       <button id="stat4_btn" class="btn btn-default" type="button">上传照片</button></span>
                              
                                </div>    
                                <div >
                                    <span id="stat3yl"></span>    <span id="stat4yl"  style="margin-left: 30px"></span>  
                                </div>              
                                 
                               
                                 <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">企业6个月银行对账单照片</span>
                                    <span style="display: none"> <input id="stat5" name="stat5" type="file" /> </span>
                                    <span class="input-group-addon"> <button id="stat5_btn" class="btn btn-default" type="button">上传照片</button></span>
                                    <span class="input-group-addon">个人6个月银行对账单照片</span>
                                    <span style="display: none">  <input id="stat6" name="stat6" type="file" /> </span>
                                    <span class="input-group-addon">       <button id="stat6_btn" class="btn btn-default" type="button">上传照片</button></span>
                          
                                 
                                 </div>    
                                <div >
                                    <span id="stat5yl"></span>   <span id="stat6yl"  style="margin-left: 30px"></span>  
                                </div>   
                           
                                     <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">营收证明照片</span>
                                    <span style="display: none"> <input id="stat7" name="stat7" type="file" /> </span>
                                    <span class="input-group-addon"> <button id="stat5_btn" class="btn btn-default" type="button">上传照片</button></span>
                                    <span class="input-group-addon">公司水电费照片</span>
                                    <span style="display: none">  <input id="stat8" name="stat8" type="file" /> </span>
                                    <span class="input-group-addon">       <button id="stat8_btn" class="btn btn-default" type="button">上传照片</button></span>
                          
                                 
                                 </div>    
                                <div >
                                    <span id="stat7yl"></span>   <span id="stat8yl"  style="margin-left: 30px"></span>  
                                </div>  
                                 
                                   <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">贷款说明文件照片</span>
                                    <span style="display: none"> <input id="stat9" name="stat9" type="file" /> </span>
                                    <span class="input-group-addon"> <button id="stat9_btn" class="btn btn-default" type="button">上传照片</button></span>
                                    <span class="input-group-addon">过去6个月销售合同照片</span>
                                    <span style="display: none">  <input id="stat10" name="stat10" type="file" /> </span>
                                    <span class="input-group-addon">       <button id="stat10_btn" class="btn btn-default" type="button">上传照片</button></span>
                          
                                 
                                 </div>    
                                <div >
                                    <span id="stat9yl"></span>   <span id="stat10yl"  style="margin-left: 30px"></span>  
                                </div>  
                                   <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">企业或个人征信记录照片</span>
                                    <span style="display: none"> <input id="stat11" name="stat11" type="file" /> </span>
                                    <span class="input-group-addon"> <button id="stat11_btn" class="btn btn-default" type="button">上传照片</button></span>
                                    <span class="input-group-addon">公司章程照片</span>
                                    <span style="display: none">  <input id="stat12" name="stat12" type="file" /> </span>
                                    <span class="input-group-addon">       <button id="stat12_btn" class="btn btn-default" type="button">上传照片</button></span>
                          
                                 
                                 </div>    
                                <div >
                                    <span id="stat11yl"></span>   <span id="stat12yl"  style="margin-left: 30px"></span>  
                                </div>  
                            
                                     <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">     资产证明(房产证、土地证、银行存款、基金投资等)照片</span>
                                    <span style="display: none"> <input id="stat13" name="stat13" type="file" /> </span>
                                    <span class="input-group-addon"> <button id="stat13_btn" class="btn btn-default" type="button">上传照片</button></span>
                                     
                                 
                                 </div>    
                                <div >
                                    <span id="stat13yl"></span> 
                                </div>  
                                 
                               </div>
                              </div>   
                              <center>  <button id="_person_submit_btn" style="width: 60%;" class="button button-primary glow">提交</button></center>
                                </form></div>
                        </div>
                </div>
            </div>
        </div> 
    </body>
</html>


