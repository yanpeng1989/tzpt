<%-- 
    Document   : login
    Created on : 2014-8-17, 17:03:57
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div id="_modal_mibao" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div style="text-align: center; width: 80%;" class="container">
                <div class="row">
                    <h4>密保找回</h4>
                </div>
                <div class="row">
                    <div class="form-group">
                        <form id="_mibao_form_">
                            <div class="input-group" style="margin-bottom: 10px;width:100%">
                                <span class="input-group-addon">密保问题1</span>
                                <input type="text" class="form-control" name="qu1" id="qu1"   readonly="true" placeholder=""> 
                            </div>
                            <div class="input-group" style="margin-bottom: 10px;width:100%">
                                <span class="input-group-addon">密保答案1</span>
                                <input type="text" class="form-control" name="an1" id="an1"   placeholder=""> 
                            </div>
                            <div class="input-group" style="margin-bottom: 10px;width:100%">
                                <span class="input-group-addon">密保问题2</span>
                                <input type="text" class="form-control" name="qu2" id="qu2"  readonly="true"  placeholder=""> 
                            </div>
                            <div class="input-group" style="margin-bottom: 10px;width:100%">
                                <span class="input-group-addon">密保答案2</span>
                                <input type="text" class="form-control" name="an2" id="an2"   placeholder=""> 
                            </div>
                            <div class="input-group" style="margin-bottom: 10px;width:100%">
                                <span class="input-group-addon">密保问题3</span>
                                <input type="text" class="form-control" name="qu3" id="qu3"   readonly="true"  placeholder=""> 
                            </div>
                            <div class="input-group" style="margin-bottom: 10px;width:100%">
                                <span class="input-group-addon">密保答案3</span>
                                <input type="text" class="form-control" name="an3" id="an3"   placeholder=""> 
                            </div>      
                            <div class="row"> 
                                <div class="col-md-5"> 
                                    <label>新密码：</label>  
                                </div>
                                <div class="col-md-5"> 
                                    <input width="100%" class="form-control input-hint-text" id="newpwd1" type="password" name="newpwd1" placeholder="" /> 
                                </div>
                            </div>   
                            <div class="row"> 
                                <div class="col-md-5"> 
                                    <label>确认新密码：</label>  
                                </div> 
                                <div class="col-md-5"> 
                                    <input width="100%" class="form-control input-hint-text" id="newpwd2" type="password" name="newpwd2" placeholder="" /> 
                                </div>
                            </div>          
                            <button id="_mibaoyz_btn" style="width: 90%;" class="button button-primary glow">提交</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
