<%-- 
    Document   : loan
    Created on : 2014-11-12, 10:25:36
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="item-header">
    个人信息
</div>
<form id="personal_form">
    <div class="container">
        <div class="row form-row">
            <div class="col-sm-2">
                <div class="pull-right" for="name">真实姓名 </div>
            </div>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="name" id="name" value="${out["name"]}" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="id_number" class="pull-right">身份证号 </div>
            </div>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="id_number" id="id_number" value="${out["id_number"]}" maxlength="18" min="18" />
            </div>
            <div class="col-sm-3">
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="education" class="pull-right">教育程度</div>
            </div>
            <div class="col-sm-3">
                <c:set var="education_arrstr" value="高中,大学,专科,研究生,博士,博士后,其他" />
                <c:set var="delim" value=","/> 
                <c:set var="education_array" value="${fn:split(education_arrstr, delim)}"/>
                <select class="form-control" name="education" id="education">
                    <c:forEach var="education_item" items="${education_array}">
                        <option value="${education_item}" <c:if test="${education_item eq out['edcation']}">selected="selected"</c:if> />${education_item}
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div class="pull-right">婚姻状况</div>
            </div>
            <div class="col-sm-3">
                <c:set var="marital_status_arrstr" value="已婚(有子女),已婚(无子女),未婚,其他" />
                <c:set var="marital_status_array" value="${fn:split(marital_status_arrstr, delim)}"/>
                <c:forEach var="marital_status_item" items="${marital_status_array}">
                    <label style="font-weight: 200;float: left;margin-left: 15px;">
                        <input type="radio" name="marital_status" value="${marital_status_item}" <c:if test="${marital_status_item eq out['marital_status']}"> checked="checked"</c:if> /> ${marital_status_item}</label>
                    </c:forEach>
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="present_address" class="pull-right">现居住地</div>
            </div>
            <div class="col-sm-3">
                <input id="present_address" name="present_address" type="text" class="form-control" value="${out["present_address"]}" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="time" class="pull-right">现居时长（年）</div>
            </div>
            <div class="col-sm-3">
                <input name="time" id="time" type="text" class="form-control" value="${out["time"]}" maxlength="5" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="birth_address" class="pull-right">户口地址</div>
            </div>
            <div class="col-sm-3">
                <input name="birth_address" id="birth_address" value="${out["birth_address"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div for="birth_nature" class="pull-right">户口性质</div>
            </div>
            <div class="col-sm-3">
                <input id="birth_nature" name="birth_nature" value="${out["birth_nature"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-4" align="center">
                <input id="personal_save_btn" class="button button-flat-royal" type="button" value="保存并继续" />
            </div>
        </div>
    </div>
</form>