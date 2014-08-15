<%-- 
    Document   : test
    Created on : 2014-7-4, 9:45:09
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value='/css/frame/bootstrap.min.css' />" rel="stylesheet" />
        <link href="<c:url value='/css/frame/bootstrap-theme.min.css' />" rel="stylesheet" />
        <link href="<c:url value='/css/frame/bootstrap-datetimepicker.min.css' />" rel="stylesheet" />
        <link href="<c:url value='/css/frame/frame-cyss.css' />" rel="stylesheet" />
        <script src="<c:url value='/script/frame/jquery-1.11.1.min.js' />"></script>
        <script src="<c:url value='/script/frame/bootstrap.min.js' />"></script>
        <script src="<c:url value='/script/frame/bootstrap-treeview.js' />"></script>
        <script src="<c:url value='/script/frame/bootstrap-datetimepicker.min.js' />"></script>
        <script src="<c:url value='/script/frame/bootstrap-datetimepicker.zh-CN.js' />"></script>
        <script src="<c:url value='/script/frame/bootstrap3-validation.js' />"></script>
        <script src="<c:url value='/script/frame/string.min.js' />"></script>
        <script src="<c:url value='/script/frame/frame-manage.js' />"></script>
        <script src="<c:url value='/script/template/default.js' />"></script>
        <title></title>
        <script type="text/javascript">
            var outJson = '${out_json}';
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <form id="search_form" role="form" class="form-inline">
                    <div class="navbar-form navbar-left page-header row custom-search">
                        
                        <button id="search" type="button" class="btn btn-primary">查询</button>
                    </div>
                </form>
            </div>
            <div class="row well well-sm">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary">添加</button>
                    <button type="button" class="btn btn-default">修改</button>
                    <button type="button" class="btn btn-danger">删除</button>
                </div>
            </div>
            <div class="row">
                <table id="auto_table" class="table table-hover">
                    <thead>
                        
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
