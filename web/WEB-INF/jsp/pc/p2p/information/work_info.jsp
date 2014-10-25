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
                </div>
                <div class="col-sm-9">
                    <form id="_person_form_"  class="form-horizontal">
                        <div class="panel panel-default">
                            <div class="panel-body" style="width:80%" > 
                                <div>    
                                    <h5>工作信息</h5>   <hr>
                                </div>  
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">单位名称</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required" id="company"   name="company"  placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">单位地址</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required" id="address"   name="address"  placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">部门</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required" id="department"   name="department"  placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">工作电话</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required" id="jobtel"   name="jobtel"  placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">职 &nbsp;&nbsp;&nbsp;&nbsp;位</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required" id="post"   name="post"  placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">工作名称</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required" id="jobname"   name="jobname"  placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">工作年限</span>
                                    <select class="form-control" id="jobtime" name="jobtime"style="border: 1px solid #EB5D68;">
                                        <option value="">请选择</option> 
                                        <option value="1">5年以上</option>
                                        <option  value="2">3～5年</option>
                                        <option  value="3">1～3年</option>
                                        <option  value="4">1年以内</option>
                                    </select>
                                </div>
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">工作单位性质</span>
                                    <select class="form-control" id="property" name="property"style="border: 1px solid #EB5D68;">
                                        <option value="">请选择</option> 
                                        <option value="1">国家机关、事业单位</option>
                                        <option  value="2">企业</option>
                                        <option  value="3">个体工商户</option>
                                        <option  value="4">其他</option>
                                    </select>
                                </div>    
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">企业所处行业</span>
                                    <select class="form-control" id="industry" name="industry"style="border: 1px solid #EB5D68;">
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
                                    <span class="input-group-addon"style="width: 140px">企业规模</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required" id="scale"   name="scale"  placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">月收入</span>
                                    <input type="text" class="form-control" minlength="2" check-type="required" id="income"   name="income"  placeholder=""style="border: 1px solid #EB5D68;">  
                                </div>           
                                <center> <button id="_work_submit_btn" style="width: 60%;" class="button button-primary glow">提交</button></center>
                            </div>
                        </div>  
                    </form>
                </div>
            </div>
        </div> 
    </body>
</html>


