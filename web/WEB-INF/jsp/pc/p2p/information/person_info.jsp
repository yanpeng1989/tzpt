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
        <div  >
             
            <div class="form-group">
                <div class="col-sm-1">  
                </div>
                <div class="col-sm-9">
                    <form id="_person_form_"  class="form-horizontal">
                        <div class="panel panel-default">
                            <div class="panel-body" style="width:80%" >   
                                <div>    
                                    <h5> 我的基本信息</h5>  <hr>
                                    <div><input type="hidden" id="regid" name="regid" value="<%=ses.get("id") == null ? "" : ses.get("id").toString()%>"></div>
                                </div>  
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">真实姓名</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required" id="truename"   name="truename"  placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"style="width: 140px"> 籍 &nbsp;&nbsp;&nbsp;&nbsp;贯 </span>
                                    <input type="text" class="form-control" id="birth_address" name="birth_address"  minlength="2" check-type="required"  placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>   
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">现居住地</span>
                                    <input type="text" class="form-control" name="present_address"  id="present_address" minlength="2" check-type="required"  placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>   
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">居住时间</span>
                                    <select class="form-control" id="jztime" name="jztime"style="border: 1px solid #EB5D68;">
                                        <option value="0">请选择</option> 
                                        <option value="1">半年以内</option>
                                        <option  value="2">1年以内</option>
                                        <option  value="3">2年以内</option>
                                        <option  value="4">3年以内</option>
                                        <option  value="5">3年以上</option>
                                    </select>
                                </div>    
                                <div class="input-group" style="display: none;margin-bottom: 10px;width:100%" >
                                    <span class="input-group-addon"style="width: 140px">手机号码</span>
                                    <input type="text" class="form-control" name="tel"  minlength="11" check-type="required"  placeholder=""> 
                                </div>     
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">身份证号</span>
                                    <input type="text" class="form-control"  id="sfzmhm"  name="sfzmhm"  minlength="15" check-type="required"  placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>       
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">身份证正面图片</span>
                                    <span style="display: none"><input id="sfzzm" name="sfzzm" type="file" /> </span>
                                    <button id="sfzzm_btn" class="btn btn-default" type="button"style="width: 140px;border: 1px solid #EB5D68;">修改上传图片</button></span>
                                </div>             
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">身份证反面图片</span>
                                    <span style="display: none"><input id="sfzfm" name="sfzfm" type="file" /></span>
                                    <button id="sfzfm_btn" class="btn btn-default" type="button"style="width: 140px;border: 1px solid #EB5D68;">修改上传图片</button>
                                </div>
                                <div >
                                    <span id="sfzzmyl"></span><span id="sfzfmyl"></span>  
                                </div> 
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">户口本图片</span>
                                    <span style="display: none">  <input id="hkb" name="hkb" type="file" /> </span>
                                    <button id="hkb_btn" class="btn btn-default" type="button"style="width: 140px;border: 1px solid #EB5D68;">修改上传图片</button>
                                </div>    
                                <div >
                                    <span id="hkbyl"></span>  
                                </div>              
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">教育程度</span>
                                    <select class="form-control" id="education"  name="education"style="border: 1px solid #EB5D68;">
                                        <option value="0">请选择</option> 
                                        <option  value="1">研究生以上</option>
                                        <option  value="2">本科</option>
                                        <option  value="3">大专</option>
                                        <option  value="4">高中</option>
                                        <option  value="5">中专</option>
                                        <option  value="6">初中及以下</option>
                                    </select>
                                </div>
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">婚姻状态</span>
                                    <select class="form-control" id="marital_status" name="marital_status"style="border: 1px solid #EB5D68;">
                                        <option value="0">请选择</option> 
                                        <option value="1">已婚有子女</option>
                                        <option value="2">已婚无子女</option>
                                        <option value="3">未婚</option>
                                        <option value="4">其他</option>
                                    </select>
                                </div>   
                                <div style="margin-top: 30px;">    
                                    <h3>常用联系人信息</h3>
                                </div>  
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"  >亲属姓名</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required"    id="name_1"   name="name_1"  placeholder="请输入姓名"style="border: 1px solid #EB5D68;"> 
                                    <span class="input-group-addon"  >亲属电话</span>
                                    <input type="text" class="form-control" minlength="5"  check-type="required"  id="tel_1"   name="tel_1"  placeholder="请输入联系电话"style="border: 1px solid #EB5D68;"> 
                                </div>               
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"  >同事姓名</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required"    id="name_2"   name="name_2"  placeholder="请输入姓名"style="border: 1px solid #EB5D68;"> 
                                    <span class="input-group-addon"  >同事电话</span>
                                    <input type="text" class="form-control" minlength="5" check-type="required"  id="tel_2"   name="tel_2"  placeholder="请输入联系电话"style="border: 1px solid #EB5D68;"> 
                                </div>
                                <div class="input-group" style="margin-bottom: 5px;width:100%">
                                    <span class="input-group-addon"  >朋友姓名</span>
                                    <input type="text" class="form-control" minlength="2"   check-type="required"   id="name_3"   name="name_3"  placeholder="请输入姓名"style="border: 1px solid #EB5D68;"> 
                                    <span class="input-group-addon"  >朋友电话</span>
                                    <input type="text" class="form-control" minlength="5" check-type="required"  id="tel_3"   name="tel_3"  placeholder="请输入联系电话"style="border: 1px solid #EB5D68;"> 
                                </div>
                                <center>  <button id="_person_submit_btn" style="width: 60%;" class="button button-primary glow">提交</button></center>
                                </form>
                            </div>
                        </div>
                </div>
            </div>
        </div> 
    </body>
</html>


