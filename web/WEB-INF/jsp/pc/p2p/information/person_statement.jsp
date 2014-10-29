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
                                    <h5> 个人证明材料信息</h5>  <hr>
                                    <div><input type="hidden" id="regid" name="regid" value="<%=ses.get("id") == null ? "" : ses.get("id").toString()%>"></div>
                                </div>  
                                <div style="margin-left: 5px;">   
                                    <div class="input-group" style="margin-bottom: 5px;width:100%">
                                        <span class="input-group-addon"style="width: 190px">银行流水文件</span>
                                        <span style="display: none">  <input id="stat1" name="stat1" type="file" /> </span>
                                        <button id="stat1_btn" class="btn btn-default" type="button"style="border: 1px solid #EB5D68;">上传文件</button>
                                        <span  id="stat1status">  未上传  </span>  
                                    </div>
                                    <div class="input-group" style="margin-bottom: 5px;width:100%">
                                        <span class="input-group-addon"style="width: 190px">工作证明文件</span>
                                        <span style="display: none">  <input id="stat2" name="stat2" type="file" /> </span>
                                        <button id="stat2_btn" class="btn btn-default" type="button"style="border: 1px solid #EB5D68;">上传文件</button>
                                        <span  id="stat2status">  未上传  </span>  
                                    </div>    
                                    <div >
                                        <span id="stat1yl"></span>    <span id="stat2yl" style="margin-left: 30px"></span>  
                                    </div>      
                                    <div class="input-group" style="margin-bottom: 5px;width:100%">
                                        <span class="input-group-addon"style="width: 190px">征信记录文件</span>
                                        <span style="display: none">  <input id="stat3" name="stat3" type="file" /> </span>
                                        <button id="stat3_btn" class="btn btn-default" type="button"style="border: 1px solid #EB5D68;">上传文件</button>
                                          <span  id="stat3status">  未上传  </span>  
                                        
                                    </div>
                                    <div class="input-group" style="margin-bottom: 5px;width:100%">
                                        <span class="input-group-addon"style="width: 190px">水电费详单文件</span>
                                        <span style="display: none">  <input id="stat4" name="stat4" type="file" /> </span>
                                        <button id="stat4_btn" class="btn btn-default" type="button"style="border: 1px solid #EB5D68;">上传文件</button>
                                         <span  id="stat4status">  未上传  </span>  
                                    </div>    
                                    <div >
                                        <span id="stat3yl"></span>    <span id="stat4yl"  style="margin-left: 30px"></span>  
                                    </div>              
                                    <div class="input-group" style="margin-bottom: 5px;width:100%">
                                        <span class="input-group-addon"style="width: 190px">手机话费详单文件</span>
                                        <span style="display: none"> <input id="stat5" name="stat5" type="file" /> </span>
                                        <button id="stat5_btn" class="btn btn-default" type="button"style="border: 1px solid #EB5D68;">上传文件</button>
                                           <span  id="stat5status">  未上传  </span>  
                                    </div>
                                    <div class="input-group" style="margin-bottom: 5px;width:100%">
                                        <span class="input-group-addon"style="width: 190px">其他证明文件</span>
                                        <span style="display: none">  <input id="stat6" name="stat6" type="file" /> </span>
                                        <button id="stat6_btn" class="btn btn-default" type="button"style="border: 1px solid #EB5D68;">上传文件</button>
                                          <span  id="stat6status">  未上传  </span>  
                                    </div>    
                                    <div >
                                        <span id="stat5yl"></span>   <span id="stat6yl"  style="margin-left: 30px"></span>  
                                    </div>                             
                                </div>
                            </div>   
                            <center><button id="_person_submit_btn" style="width: 60%;" class="button button-primary glow">提交</button></center>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div> 
</body>
</html>


