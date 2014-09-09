<%-- 
    Document   : mytest
    Created on : 2014-7-31, 14:43:32
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <jsp:include page="../../head.jsp" />
    <body>
      
            <input id="image" name="my_img" type="file" />
            <br />
            <input id="u" type="button" value="上传11" />
       
     
    </body>
</html>
<script type="text/javascript">
    $(function() {
       $("#u").click(function() {
            uploadImage("#image", {
                 data:{
                    "ss": "3213"
                },
                "sus": function(data) {
                    alert("成功")
                },
               "service_code": "S24004"
            });
        });
    });
</script>
