<%-- 
    Document   : testhf
    Created on : 2014-9-30, 22:00:38
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../head.jsp" />
    <body>
        <input type="text" id="user_id" /> 
        <button id="btn1">用户开户</button>
    </body>
</html>
<script type="text/javascript">
    $(function(){
        $("#btn1").click(function(){
            callUserRegister("S70020", {"id" : $("#user_id").val()});
        });
    });
</script>
