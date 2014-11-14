<%-- 
    Document   : job
    Created on : 2014-11-12, 11:16:56
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="item-header">
    工作信息
</div>
<form id="job_form">
    <div class="container">
        <div class="row form-row">
            <div for="company" class="col-sm-2">
                <div class="pull-right">单位名称 </div>
            </div>
            <div class="col-sm-3">
                <input id="company" name="company" type="text" class="form-control" value="${out["company"]}" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="company_property" class="pull-right">单位性质 </div>
            </div>
            <div class="col-sm-3">
                <input id="company_property" name="company_property" value="${out["company_property"]}" type="text" class="form-control" />
            </div>
            <div class="col-sm-3">
            </div>
        </div>
        <div class="row form-row">
            <div for="company_industry" class="col-sm-2">
                <div class="pull-right">行业分类</div>
            </div>
            <div class="col-sm-3">
                <input id="company_industry" name="company_industry" value="${out["company_industry"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div for="department" class="col-sm-2">
                <div class="pull-right">部门</div>
            </div>
            <div class="col-sm-3">
                <input id="department" name="department" value="${out["department"]}" type="text" class="form-control" />
            </div>
        </div>
         <div class="row form-row">
            <div class="col-sm-2">
                <div for="post" class="pull-right">职位</div>
            </div>
            <div class="col-sm-3">
                <input id="post" name="post" value="${out["post"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="company_scale" class="pull-right">规模(人)</div>
            </div>
            <div class="col-sm-3">
                <input id="company_scale" name="company_scale" value="${out["company_scale"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="income" class="pull-right">月收入(元)</div>
            </div>
            <div class="col-sm-3">
                <input id="income" name="income" value="${out["income"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="join_time" class="pull-right">工作年限</div>
            </div>
            <div class="col-sm-3">
                <select name="join_time" id="join_time" class="form-control" class="form-control">
                    <c:forEach var="i" begin="1" end="60">
                        <option <c:if test="${i eq out['join_time']}">selected="selected"</c:if> value="${i}" />${i}年
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="company_address" class="pull-right">工作地址</div>
            </div>
            <div class="col-sm-3">
                <input id="company_address" name="company_address" value="${out["company_address"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="job_tel" class="pull-right">工作电话</div>
            </div>
            <div class="col-sm-3">
                <input id="job_tel" name="job_tel" value="${out["job_tel"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-4" align="center">
                <input id="job_save_btn" class="button button-flat-royal" type="button" value="保存并继续" />
            </div>
        </div>
    </div>
</form>
