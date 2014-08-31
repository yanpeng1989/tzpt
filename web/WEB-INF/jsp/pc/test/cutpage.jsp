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
        <form action="<c:url value="/pc/test/cutpage.do" />" method="post">
            错误码：<input name="err_code" value="${out['params']['err_code']}" />
            <input type="submit" value="查询" />
        </form>
        <c:forEach items="${out['result']}" var="res">
            <p>${res['err_code']}${res['err_msg']}</p>
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
                    <li><a class="_cut_page_index" topage="${page['max_page']}" href="#this">下一页</a></li>
                </c:if>
            </ul>
            <input type="hidden" name="err_code" value="${out['params']['err_code']}" />
        </form>
        <hr />
        <label>==========分页ajax提交(table样式，一般用于后台管理)============</label>
        <form id="ajax_form">
            错误码：<input name="err_code"  />
            <input type="button" id="ajax_btn" value="查询" />
        </form>
        <table id="ajax_table" class="table">
            <thead>
                <tr row-key="ERR_CODE">
                    <th rel-key="ERR_CODE">错误码</th>
                    <th rel-key="err_msg">错误描述</th>
                </tr>
            <tbody>
            </tbody>
            </thead>
        </table>
        <hr />
        <label>==========分页ajax提交(自定义样式)============</label>
        <form id="ajax_custom_form">
            错误码：<input id="custom_err_code" name="err_code"  />
            <input type="button" id="ajax_custom_btn" value="查询" />
        </form>
        <div id="custom_div">

        </div>
        <ul id="custom_ul" class="pager">
            
        </ul>
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
        $("#ajax_custom_btn").click(function() {
            onlyCutPage("S70008", nowPage, {
                "err_code": $("#custom_err_code").val(),
                sus: function(data) {
                    var div = $("#custom_div");
                    div.empty();
                    for(var i in data.result) {
                        $("<p/>").html(data.result[i]["ERR_CODE"] + data.result[i]["err_msg"]).appendTo(div);
                    }
                    var page = data["_page_para"];
                    for(var i = page["begin_page"]; i <= page["end_page"]; i++) {
                        $("<li/>")
                                .append($("<a/>")
                                .attr("href", "#this").html(i))
                                .appendTo("#custom_ul")
                                .click(function(){
                                    //...这里我就不写了
                                });
                    }
                },
                fal: function(code, desc) {

                }
            });

        });$("#ajax_custom_btn").click();
    });
</script>
