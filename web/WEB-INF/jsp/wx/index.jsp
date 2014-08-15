<%-- 
    Document   : index
    Created on : 2014-7-8, 17:52:27
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>My Test App</title>
        <meta name="viewport" content="width=device-width, maximum-scale=1, user-scalable=no" />
        <meta name="mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        
        <script src="<c:url value='/script/frame/jquery-1.11.1.min.js' />"></script>

        <!-- shims for backwards compatibility -->
        <script type="text/javascript" src="<c:url value="/script/frame/famo/functionPrototypeBind.js" />"></script>
        <script type="text/javascript" src="<c:url value="/script/frame/famo/classList.js" />"></script>
        <script type="text/javascript" src="<c:url value="/script/frame/famo/requestAnimationFrame.js" />"></script>

        <!-- module loader -->
        <script type="text/javascript" src="<c:url value="/script/frame/famo/require.js" />"></script>

        <!-- famous -->
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/frame/famo/famous.css" />" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/frame/famo/famous_styles.css" />" />
        <script type="text/javascript" src="<c:url value="/script/frame/famo/famous.min.js" />"></script>

        <!-- app code -->
        <script type="text/javascript">
            require.config({
                baseUrl: '<c:url value="/script/wx/" />'
            });
            require(['main']);
        </script>
    </head>
    <body></body>
</html>
