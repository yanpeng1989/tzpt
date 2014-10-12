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

        <div class="row" style="margin-left: 80px;">
  <%
            Map<String, Object> ses = (HashMap<String, Object>) session.getAttribute(GlobalUtil.session_tag);

        %>

            <div class="alert alert-warning"  id="msg"   role="alert"> 
                温馨提示：亲爱的客户，车辆认证为借款授信额度提供参考，如有造假，您的贷款资格会被取消；并加入黑名单系统将无法贷款。
            </div>
            <form id="_person_form_"> 
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-xs-10">
                            <div class="col-xs-3">

                                <div> <span class="glyphicon glyphicon-user" style="margin-top: 50px;padding-left: 20px;font-size: 53px"/> </div>
                                <div><h5>  我的车辆信息</h5></div>
                                  <div><input type="hidden" id="regid" name="regid" value="<%=ses.get("id")==null?"":ses.get("id").toString()%>"></div>
              </div>
                            <div class="col-xs-7">
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon">行车证照片</span>
                                    <span style="display: none">  <input id="xcz" name="xcz" type="file" /> </span>
                                    <span>     <button id="xcz_btn" class="btn btn-default" type="button">上传照片</button></span>
                                </div>
                                <div >
                                    <span id="xczyl"></span>  
                                </div>             

                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon">行车证编号</span>
                                    <input type="text" class="form-control" id="xczbh" name="xczbh" placeholder=""> 
                                </div>           

                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon">车辆所有人姓名</span>
                                    <input type="text" class="form-control" id="name" name="name" placeholder=""> 
                                </div>       
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon">车辆贷款</span>
                                    <label><input type="radio"   checked="checked"  name="dkbz" value="0" /> &nbsp;无</label>
                                    <label style="margin-left: 40px;"><input type="radio"    name="dkbz" value="1" /> &nbsp;有</label>
                                </div>          

                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon">车辆贷款材料照片</span>
                                    <span style="display: none">  <input id="cardk" name="cardk" type="file" /> </span>
                                    <span>     <button id="dk_btn" class="btn btn-default" type="button">上传照片</button></span>
                                </div>
                                <div >
                                    <span id="dkyl"></span>  
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
        language: 'zh-CN',
        format: "yyyy-mm-dd",
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
</script>
