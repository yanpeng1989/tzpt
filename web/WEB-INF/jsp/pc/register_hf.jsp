<%-- 
    Document   : register_hf
    Created on : 2014-11-11, 22:50:43
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <%
    
    %>
    <jsp:include page="head.jsp"></jsp:include>
    <body>
        <jsp:include page="top.jsp"></jsp:include>
        <center>
        <div class="" style="background: url(<c:url value="/images/pc/regist_hf.png" />);height:550px ;width:850px;line-height: 550px">
            <div>
                <div style="">
                    <button class="button glow button-flat-royal" id="ljkt" onclick="kt();" style="">立即开通</button>
                    <label style="width: 20px;"></label>
                </div>
              
            </div>
        </div>
        </center>
        <jsp:include page="foot.jsp" ></jsp:include>
        <jsp:include page="login.jsp" ></jsp:include>
        <jsp:include page="register.jsp" ></jsp:include>
    </body>
</html>
<script>
    function kt(){
     // var regid=$("#regid").val();
      callUserRegister("S30020", {"id":0 });
      loction.href="/tzpt";
      
    
    }
</script>
<script src="<c:url value='/script/pc/index.js' />"></script>
<script src="<c:url value='/script/pc/login_new.js' />"></script>
<script src="<c:url value='/script/pc/register_new.js' />"></script>