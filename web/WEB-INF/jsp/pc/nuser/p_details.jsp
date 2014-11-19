<%-- 
    Document   : p_details
    Created on : 2014-11-18, 23:44:09
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../head.jsp"></jsp:include>
    <link href="<c:url value='/css/pc/nuser/nuser-common.css' />" rel="stylesheet" />
    <script type="text/javascript" src="<c:url value='/script/pc/nuser/nuser-common.js' />"></script>
    <body>
        <div class="outer-container">
            <jsp:include page="../loan/p_details.jsp"></jsp:include>
        </div>
    </body>
</html>
