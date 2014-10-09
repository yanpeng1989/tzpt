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
                                <h5> 我的基本信息</h5>  <hr>
                 <div><input type="hidden" id="regid" name="regid" value="<%=ses.get("id").toString()%>"></div>
                             </div>  
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">真实姓名</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required" id="truename"   name="truename"  placeholder=""> 
                                </div>
                                 <!--
                                <div   style="width:100%">
                                    <span class="input-group-addon"><input type="radio" name="sex" checked="checked" value="男" /> &nbsp;男</span>
                                    <span  class="input-group-addon"><input type="radio" name="sex" value="女" /> &nbsp;女</span>
                                </div>

                                <div class="input-group" style="margin-top: 10px;margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon">出生日期</span>
                                    <input class="text" class="form-control"  data-role="date" minlength="1" check-type="required"  id="birthday" type="text" name="birthday"/>
                                </div>  -->
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"> 籍 &nbsp;&nbsp;&nbsp;&nbsp;贯 </span>
                                    <input type="text" class="form-control" id="birth_address" name="birth_address"  minlength="2" check-type="required"  placeholder=""> 
                                </div>   
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">现居住地</span>
                                    <input type="text" class="form-control" name="present_address"  id="present_address" minlength="2" check-type="required"  placeholder=""> 
                                </div>   
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">现居住地居住时间</span>
                                    <span class="input-group-addon"><select class="selectpicker" id="jztime" name="jztime">
                                            <option value="0">请选择</option> 
                                            <option value="1">半年以内</option>
                                            <option  value="2">1年以内</option>
                                            <option  value="3">2年以内</option>
                                            <option  value="4">3年以内</option>
                                            <option  value="5">3年以上</option>
                                        </select></span>
                                </div>    
                                <div class="input-group" style="display: none;margin-bottom: 10px;width:100%" >
                                    <span class="input-group-addon">手机号码</span>
                                    <input type="text" class="form-control" name="tel"  minlength="11" check-type="required"  placeholder=""> 
                                </div>     

                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">身份证号</span>
                                    <input type="text" class="form-control"  id="sfzmhm"  name="sfzmhm"  minlength="15" check-type="required"  placeholder=""> 
                                </div>       


                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">身份证正面照片</span>
                                    <span style="display: none">  <input id="sfzzm" name="sfzzm" type="file" /> </span>
                                    <span class="input-group-addon">     <button id="sfzzm_btn" class="btn btn-default" type="button">上传照片</button></span>
                                </div>    
                                <div >
                                    <span id="sfzzmyl"></span>    <span id="sfzfmyl"></span>  
                                </div>             
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">身份证反面照片</span>
                                    <span style="display: none">  <input id="sfzfm" name="sfzfm" type="file" /> </span>
                                    <span class="input-group-addon">      <button id="sfzfm_btn" class="btn btn-default" type="button">上传照片</button></span>
                                </div>    

                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">户口本照片</span>
                                    <span style="display: none">  <input id="hkb" name="hkb" type="file" /> </span>
                                    <span class="input-group-addon">       <button id="hkb_btn" class="btn btn-default" type="button">上传照片</button></span>
                                </div>    
                                <div >
                                    <span id="hkbyl"></span>  
                                </div>              
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon">教育程度  
                                    </span>
                                    <span class="input-group-addon"> <select class="selectpicker" class="form-control" id="education"  name="education">
                                            <option value="0">请选择</option> 
                                            <option  value="1">研究生以上</option>
                                            <option  value="2">本科</option>
                                            <option  value="3">大专</option>
                                            <option  value="4">高中</option>
                                            <option  value="5">中专</option>
                                            <option  value="6">初中及以下</option>
                                        </select></span>
                                    
                                      <span class="input-group-addon">婚姻状态</span>
                                    <span class="input-group-addon"> 
                                        <select class="selectpicker" id="marital_status" name="marital_status">
                                            <option value="0">请选择</option> 
                                            <option value="1">已婚有子女</option>
                                            <option value="2">已婚无子女</option>
                                            <option value="3">未婚</option>
                                            <option value="4">其他</option>
                                        </select>
                                    </span>
                                </div>   
                             <div>    
                                <h5> 我的常用联系人信息</h5> <hr>
                             </div>  
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"  >直系亲属姓名</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required"    id="name_1"   name="name_1"  placeholder="请输入姓名"> 
                                    <span class="input-group-addon"  >直系亲属电话</span>
                                    <input type="text" class="form-control" minlength="5"  check-type="required"  id="tel_1"   name="tel_1"  placeholder="请输入联系电话"> 
                                 </div>               
                                  <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"  >同事姓名</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required"    id="name_2"   name="name_2"  placeholder="请输入姓名"> 
                                    <span class="input-group-addon"  >同事电话</span>
                                       <input type="text" class="form-control" minlength="5" check-type="required"  id="tel_2"   name="tel_2"  placeholder="请输入联系电话"> 
                                 </div>
                                  <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"  >朋友姓名</span>
                                    <input type="text" class="form-control" minlength="2"   check-type="required"   id="name_3"   name="name_3"  placeholder="请输入姓名"> 
                                   <span class="input-group-addon"  >朋友电话</span>
                                    <input type="text" class="form-control" minlength="5" check-type="required"  id="tel_3"   name="tel_3"  placeholder="请输入联系电话"> 
                                 </div>
                                <button id="_person_submit_btn" style="width: 60%;" class="button button-primary glow">提交</button>
                                </form></div>
                        </div>
                </div>
            </div>
        </div> 
    </body>
</html>


