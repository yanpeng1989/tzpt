<%-- 
    Document   : mytest
    Created on : 2014-7-31, 14:43:32
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../head.jsp" />
    <body>

        <div>
            <form method="post" action="<c:url value='/multipart/form.do' />" enctype="multipart/form-data">
                <input id="file" name="image" type="file" />
                <br />
                <input name="service_code" value="S10004" type="hidden" />
                <input name="type" value="oo" type="hidden" />
                <input name="channel" value="P" type="hidden" />
                <input id="d" type="submit" value="上传" />
            </form>
        </div>
    </body>
</html>
<script type="text/javascript">
    $(function() {
//        $("#pick_file").change(function() {
//            previewImage("#pick_file", "#thumb", {
//                "width": 600,
//                "height": "auto",
//                "scale": "scale"
//            });
//        });
    });
</script>
