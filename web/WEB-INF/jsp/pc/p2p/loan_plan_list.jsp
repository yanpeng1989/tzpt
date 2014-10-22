<%-- 
    Document   : test_cutpage
    Created on : 2014-8-31, 12:09:20
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../head.jsp"></jsp:include>
    <link href="<c:url value='/css/pc/p2p/pro_list.css' />" rel="stylesheet" />
    <body>
        <form action="<c:url value="/pc/p2p/loan_plan_list.do" />" method="post">
        </form>
        <table class="table table-striped">
            <tr><td>还款期数</td><td>本期应还利息</td><td>本期应还本金</td><td>本期应还总额</td><td>期初本金</td></tr>
            <c:forEach items="${out['result']}" var="res">
                <tr><td>${res['number']}</td><td>¥${res['repay_interest']}</td><td>¥${res['repay_capital']}</td><td>¥${res['repay_sum']}</td><td>¥${res['surplus_loan']}</td></tr>
            </c:forEach>
        </table>
        <c:set var="page" scope="page" value="${out['_page_para']}" />
        <form action="<c:url value="/pc/p2p/loan_plan_list.do" />">
            <ul class="pager">      
                <c:if test="${page['to_page'] != 1}">
                    <li><a class="_cut_page_index" topage="${page['to_page'] - 1}" href="#this">上一页</a></li>
                    </c:if>
                    <c:forEach begin="${page['begin_page']}" end="${page['end_page']}" varStatus="status" >
                    <li><a class="_cut_page_index" topage="${status.index}" href="#this">${status.index}</a></li>
                    </c:forEach>
                    <c:if test="${page['to_page'] != page['max_page']}">
                    <li><a class="_cut_page_index" topage="${page['max_page']}" href="#this">下一页</a></li>
                    </c:if>
            </ul>
            <input type="hidden" name="load_id" value="${out['params']['load_id']}" />
        </form>
    </body>
</html>
