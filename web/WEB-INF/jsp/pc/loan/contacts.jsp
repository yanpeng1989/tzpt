<%-- 
    Document   : contacts
    Created on : 2014-11-12, 11:24:45
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="item-header">
    联系人信息
</div>
<form id="contacts_form">
    <div class="sub-title" align="left">
        直系亲属联系人信息
    </div>
    <div class="container">
        <div class="row form-row">
            <div class="col-sm-2">
                <div class="pull-right" for="name_1">直系亲属姓名</div>
            </div>
            <div class="col-sm-3">
                <input id="name_1" name="name_1" value="${out["name_1"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div class="pull-right" for="relationship_1">直系亲属关系</div>
            </div>
            <div class="col-sm-3">
                <input id="relationship_1" name="relationship_1" value="${out["relationship_1"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div class="pull-right" for="tel_1">直系亲属移动电话 </div>
            </div>
            <div class="col-sm-3">
                <input id="tel_1" name="tel_1" value="${out["tel_1"]}" type="text" class="form-control" />
            </div>
        </div>
    </div>
    <div class="sub-title" align="left">
        其他联系人信息1
    </div>
    <div class="container">
        <div class="row form-row">
            <div class="col-sm-2">
                <div class="pull-right" for="name_2">联系人1姓名</div>
            </div>
            <div class="col-sm-3">
                <input id="name_2" name="name_2" value="${out["name_2"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div class="pull-right" for="relationship_2">联系人1关系</div>
            </div>
            <div class="col-sm-3">
                <input id="relationship_2" name="relationship_2" value="${out["relationship_2"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div class="pull-right" for="tel_2">联系人1移动电话 </div>
            </div>
            <div class="col-sm-3">
                <input id="tel_2" name="tel_2" value="${out["tel_2"]}" type="text" class="form-control" />
            </div>
        </div>
    </div>
    <div class="sub-title" align="left">
        其他联系人信息2
    </div>
    <div class="container">
        
        <div class="row form-row">
            <div class="col-sm-2">
                <div class="pull-right" for="name_3">联系人2姓名</div>
            </div>
            <div class="col-sm-3">
                <input id="name_3" name="name_3" value="${out["name_3"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div class="pull-right" for="relationship_3">联系人2关系</div>
            </div>
            <div class="col-sm-3">
                <input id="relationship_3" name="relationship_3" value="${out["relationship_3"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-2">
                <div class="pull-right" for="tel_3">联系人2移动电话 </div>
            </div>
            <div class="col-sm-3">
                <input id="tel_3" name="tel_3" value="${out["tel_3"]}" type="text" class="form-control" />
            </div>
        </div>
        <div class="row form-row">
            <div class="col-sm-4" align="center">
                <input id="contacts_save_btn" class="button button-flat-royal" type="button" value="保存并继续" />
            </div>
        </div>
    </div>
</form>

