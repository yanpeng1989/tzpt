<%-- 
    Document   : assets
    Created on : 2014-11-12, 11:12:05
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="item-header">
    资产信息
</div>
<form id="assets_form">
    <div class="container">
        <c:set var="assets_status_arrstr" value="有,无" />
        <c:set var="delim" value=","/> 
        <c:set var="assets_status_array" value="${fn:split(assets_status_arrstr, delim)}"/>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="houses_situation" class="pull-right">房产情况 </div>
            </div>
            <div class="col-sm-3">
                <select class="form-control" name="houses_situation" id="houses_situation">
                    <c:forEach var="assets_status_item" items="${assets_status_array}">
                        <option value="${assets_status_item}" <c:if test="${assets_status_item eq out['houses_situation']}">selected="selected"</c:if> />${assets_status_item}
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="car_situation" class="pull-right">车辆情况 </div>
            </div>
            <div class="col-sm-3">
                <select class="form-control" name="car_situation" id="car_situation">
                    <c:forEach var="assets_status_item" items="${assets_status_array}">
                        <option value="${assets_status_item}" <c:if test="${assets_status_item eq out['car_situation']}">selected="selected"</c:if> />${assets_status_item}
                    </c:forEach>
                </select>
            </div>
            <div class="col-sm-3">
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="other_asset" class="pull-right">其他财产</div>
            </div>
            <div class="col-sm-3">
                <input id="other_asset" name="other_asset" type="text" class="form-control" value="${out["other_asset"]}" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="debt_proporition" class="pull-right">债务比例</div>
            </div>
            <div class="col-sm-3">
                <input id="debt_proporition" name="debt_proporition" type="text" class="form-control" value="${out["debt_proporition"]}" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-4" align="center">
                <input id="assets_save_btn" class="button button-flat-royal" type="button" value="保存并继续" />
            </div>
        </div>
    </div>
</form>
