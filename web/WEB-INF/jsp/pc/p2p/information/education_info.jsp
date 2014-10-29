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
        <%
            Map<String, Object> ses = (HashMap<String, Object>) session.getAttribute(GlobalUtil.session_tag);
        %>
        <div class="row" style=" margin-left: 10px; width: 98%">
          
            <form id="_education_form_"    class="form-horizontal" > 
                <div class="panel panel-default" >
                    <div class="panel-body">
                        <div class="col-xs-10">
                            <div class="col-xs-3">
                                <div> <span class="glyphicon glyphicon-user" style="margin-top: 50px;padding-left: 20px;font-size: 53px"/> </div>
                                <div><h5>我的学历信息</h5></div>
                                <div><input type="hidden" id="regid" name="regid" value="<%=ses.get("id") == null ? "" : ses.get("id").toString()%>"></div>
                            </div>
                            <div class="col-xs-7">
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">毕业证图片</span>
                                    <span style="display: none">  <input id="byz" name="byz" type="file" /> </span>
                                    <span><button id="byz_btn" class="btn btn-default" type="button"style="border: 1px solid #EB5D68;">修改上传图片</button></span>
                                </div>
                                <div >
                                    <span id="byzyl"></span>  
                                </div>     
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">毕业证书编号</span>
                                    <input type="text" class="form-control" name="byzbh" id="byzbh" placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>           
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">学位证图片</span>
                                    <span style="display: none">  <input id="xwz" name="xwz" type="file" /> </span>
                                    <span><button id="xwz_btn" class="btn btn-default" type="button"style="border: 1px solid #EB5D68;">修改上传图片</button></span>
                                </div>
                                <div >
                                    <span id="xwzyl"></span>  
                                </div>     
                                <div class="input-group" style="margin-bottom: 10px;width:100%">
                                    <span class="input-group-addon"style="width: 140px">学位证书编号</span>
                                    <input type="text" class="form-control" name="xwzbh" id="xwzbh" placeholder=""style="border: 1px solid #EB5D68;"> 
                                </div>          
                                <center><input type="submit" id="_person_submit_btn" style="width: 60%;" class="button button-primary glow"></button></center>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <br/><br/>
        </div>
    </body>
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
