<%-- 
    Document   : nologin
    Created on : 2014-7-31, 15:17:52
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <script type="text/javascript">
            alert("${out['head']['res_desc']}");
            history.go(-1);
        </script>
    </head>
    <body>
        
    </body>
</html>
