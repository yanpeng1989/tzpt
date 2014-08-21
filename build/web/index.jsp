<%-- 
    Document   : index
    Created on : 2014-6-30, 9:51:46
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <img src="<c:url value='/validate/code.do' />" />
        <div>
            <form method="post" action="<c:url value='/multipart/form.do' />" enctype="multipart/form-data">
                <input id="file" name="image" type="file" />
                <br />
                <input name="service_code" value="S10004" type="hidden" />
                <input type="submit" value="上传" />
            </form>
        </div>
    </body>
</html>
