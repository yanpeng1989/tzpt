<%-- 
    Document   : test_cutpage
    Created on : 2014-8-31, 12:09:20
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../head.jsp" />
    <body>
    <center>
        <label>==========分页表单提交(pageService.properties里设置服务)============</label>
        <form action="<c:url value="/pc/p2p/pro_list.do" />" method="post">
            错误码：<input name="load_id" value="${out['params']['load_id']}" />
            <input type="submit" id="fy1" value="查询" />
        </form>
        <c:forEach items="${out['result']}" var="res">
            <p>${res['load_id']}  ***********   ${res['load_title']}</p>
        </c:forEach>
        <c:set var="page" scope="page" value="${out['_page_para']}" />
        <form action="<c:url value="/pc/test/cutpage.do" />">
            <ul class="pager">      
                <c:if test="${page['to_page'] != 1}">
                    <li><a class="_cut_page_index" topage="${page['to_page'] - 1}" href="#this">上一页</a></li>
                </c:if>
                <c:forEach begin="${page['begin_page']}" end="${page['end_page']}" varStatus="status" >
                    <li><a class="_cut_page_index" topage="${status.index}" href="#this">${status.index}</a></li>
                    </c:forEach>
                <c:if test="${page['to_page'] != page['max_page']}">
                    <li><a class="_cut_page_index" topage="${page['max_page']}" href="#this">下222一页</a></li>
                </c:if>
            </ul>
            <input type="hidden" name="load_id" value="${out['params']['load_id']}" />
        </form>
        <hr />
     
        
    </center>
</body>
</html>
<script type="text/javascript">

    $(function() {
        
        
        $("#ajax_btn").click(function() {
            $("#ajax_table").cytable({
                "service_code": "S70008",
                "_form": "#ajax_form"
            }).on("rowSelected", function(e, data){
                alert(JSON.stringify(data));
            });
        });
        $("#ajax_btn").click();

        var nowPage = 1;
          
    });
</script>
