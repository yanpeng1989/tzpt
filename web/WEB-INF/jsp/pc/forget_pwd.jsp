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
    <jsp:include page="head.jsp"></jsp:include>
    <link href="<c:url value='/css/pc/index.css' />" rel="stylesheet" />
        <body>
        <jsp:include page="top.jsp"></jsp:include>
        <div class="row">
         <div class="col-xs-6 col-xs-offset-3"> 
           <div  style="text-align: center; width: 100%;"  class="panel panel-default">
              <div style="text-align: center; width: 100%;"  >
                     <h2> 找回密码</h2>
               </div>
             <div>
              <HR  />
             </div>   
            <div class="row"> 
                  <form id="_find_form_">
                 <div class="col-md-5"> 
                     <label>注册手机号码:</label>  
                 </div>
              <div class="col-md-5"> 
                <input width="100%" class="form-control input-hint-text" id="_login_phone_num" type="text" name="tel" placeholder="请输入注册手机号" /> 
              </div>
                  </form>
               </div>   
            <br><br>
            <div>
           <button id="_zh_btn1" style="width: 30%;" class="button button-primary glow">通过密保找回密码</button>    <button id="_zh_btn2" style="width: 30%;" class="button button-primary glow">通过短信验证码找回密码</button>
            </div>
        
            
            <br>
         </div>
         </div>
        </div>
      
        <jsp:include page="foot.jsp" ></jsp:include>
        <jsp:include page="forget_pwd_reset_mibao.jsp" ></jsp:include>
        <jsp:include page="forget_pwd_reset.jsp" ></jsp:include>
        <jsp:include page="login.jsp" ></jsp:include>
        <jsp:include page="register.jsp" ></jsp:include>
      
        </body>
    </html>
    <!-- 在此引用相应页面的js -->
    <script src="<c:url value='/script/pc/index.js' />"></script>
    <script src="<c:url value='/script/pc/login.js' />"></script>
    <script src="<c:url value='/script/pc/register.js' />"></script>
 
