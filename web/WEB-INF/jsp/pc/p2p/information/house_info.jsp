<%-- 
    Document   : index
    Created on : 2014-7-31, 11:38:53
    Author     : cyss210
--%>
<%@page import="java.util.HashMap"%>
<%@page import="com.cysoa.frame.util.GlobalUtil"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <jsp:include page="../../head.jsp"></jsp:include>
    <body>

     <div class="row" style=" margin-left: 10px; width: 98%">
          
            <%
                Map<String, Object> ses = (HashMap<String, Object>) session.getAttribute(GlobalUtil.session_tag);
            %>
            
            <form id="_person_form_"> 
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-xs-10">
                            <div class="col-xs-3">
                                <div> <span class="glyphicon glyphicon-user" style="margin-top: 50px;padding-left: 20px;font-size: 53px"/> </div>
                                <div><h5>房产信息</h5></div>
                                <div><input type="hidden" id="regid" name="regid" value="<%=ses.get("id") == null ? "" : ses.get("id").toString()%>"></div>
                            </div>
                            <div class="col-xs-7">
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">房产证图片</span>
                                    <span style="display: none">  <input id="fcz" name="fcz" type="file" /> </span>
                                    <span><button id="fcz_btn" class="btn btn-default" type="button"style="width: 140px;border: 1px solid #EB5D68;">修改上传图片</button></span>
                                </div>
                                <div >
                                    <span id="fczyl"></span>  
                                </div>   
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">证书编号</span>
                                    <input type="text" class="form-control" id="bh" name="bh" placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>           
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <div>
                                        <span class="input-group-addon"style="float: left;width: 140px;height: 33px">房产贷款</span>
                                    </div>
                                    <div style="float: left;width: 140px;height: 33px;border: 1px solid #EB5D68;">
                                        <label><input type="radio" name="dkbz"  checked="checked" id="redio1"  value="0" /> &nbsp;无</label>
                                        <label style="margin-left: 40px;"><input type="radio" id="redio2"  name="dkbz" value="1" /> &nbsp;有</label>
                                    </div>
                                </div>
                                <div id="dk_xx" style="display:none">
                                    <div class="input-group" style="margin-bottom: 10px;width:100%">
                                        <span class="input-group-addon"style="width: 140px">贷款材料图片</span>
                                        <span style="display: none">  <input id="fcdk" name="fcdk" type="file" /> </span>
                                        <span><button id="fcdk_btn" class="btn btn-default" type="button"style=" width: 140px;border: 1px solid #EB5D68;">修改上传图片</button></span>
                                    </div>
                                    <div >
                                        <span id="fcdkyl"></span>  
                                    </div>  
                                </div>  
                                <div style="margin-top: 30px;">
                                <center><button id="_person_submit_btn" style="width: 60%;" class="button button-primary glow">提交</button></center>    
                                </div>
                                </div>
                        </div>
                    </div>
                </div>
            </form>
            <br/><br/>
        </div>
    </body>
</html>

