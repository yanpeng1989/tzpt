<%-- 
    Document   : loan
    Created on : 2014-11-12, 10:25:36
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="item-header">
    借款信息
</div>
<form id="loan_form">
    <div class="container">
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="load_title" class="pull-right">借款用途 </div>
            </div>
            <div class="col-sm-3">
                <input type="text" class="form-control" value="${out["load_title"]}" name="load_title" id="load_title" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="sum" class="pull-right">借款金额 </div>
            </div>
            <div class="col-sm-3">
                <input type="text" class="form-control" value="${out["sum"]}" name="sum" id="sum" />
            </div>
            <div class="col-sm-3">
                <div class="pull-left">借款金额在3,000到50万元之间</div>
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="payment_times" class="pull-right">期限</div>
            </div>
            <div class="col-sm-3">
                <select class="form-control" name="payment_times" id="payment_times">
                    <c:forEach var="i" begin="1" end="12">
                        <option value="${i}" <c:if test="${out['payment_times'] eq i}">selected="selected"</c:if> />${i}月
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="payment_method" class="pull-right">还款方式</div>
            </div>
            <div class="col-sm-3" style="margin-left:-90px;">
                <label style="font-weight: 200"><input type="radio" id="payment_method" name="payment_method" value="0" checked="checked" /> 等额本息</label>
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="load_introduce" class="pull-right">借款详情</div>
            </div>
            <div class="col-sm-3">
                <textarea id="load_introduce" name="load_introduce" cols="40" rows="8">${out["load_introduce"]}</textarea>
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-4" align="center">
                <input id="save_and_go_on" class="button button-flat-royal" type="button" value="保存并继续" />
            </div>
        </div>
    </div>
</form>