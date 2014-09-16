<%-- 
    Document   : login
    Created on : 2014-8-17, 17:03:57
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div id="_modal_card" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div style="text-align: center; width: 100%;" class="container">
                <div class="row">
                    <h4>绑定银行卡</h4>
                </div>
                <div class="row">
                    <div class="form-group" class="form-horizontal">
                        <form id="_card_form_">
                            
                            <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                                <input class="form-control input-hint-text" id="kh" minlength="10" check-type="required"  type="text" name="kh" placeholder="银行卡号" />
                            </div>
                             <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                                <input class="form-control input-hint-text" id="hz" minlength="2" check-type="required"  type="text" name="hz" placeholder="账户姓名" />
                            </div> 
                        <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                               开户行名称  <select name="khhmc" id="khhmc" class="form-control"  check-type="required"   id="Province" >  <option value="">请选择</option>
                        <option value="中国银行">中国银行</option>
                        <option value="中国工商银行">中国工商银行</option>
                        <option value="中国农业银行">中国农业银行</option>
                        <option value="中国民生银行">中国民生银行</option>
                        <option value="中国建设银行">中国建设银行</option>
                        <option value="中国光大银行">中国光大银行</option>
                        <option value="中信银行">中信银行</option>
                        <option value="中国邮政储蓄银行">中国邮政储蓄银行</option>
                        <option value="招商银行">招商银行</option>
                        <option value="兴业银行">兴业银行</option>
                        <option value="上海浦东发展银行">上海浦东发展银行</option>
                        <option value="交通银行">交通银行</option>
                        <option value="广东发展银行">广东发展银行</option>
                        <!--
                         <option value="2">中国银行</option>
                        <option value="3">中国工商银行</option>
                        <option value="5">中国农业银行</option>
                        <option value="8">中国民生银行</option>
                        <option value="4">中国建设银行</option>
                        <option value="21">中国光大银行</option>
                        <option value="11">中信银行</option>
                        <option value="13">中国邮政储蓄银行</option>
                        <option value="1">招商银行</option>
                        <option value="9">兴业银行</option>
                        <option value="7">上海浦东发展银行</option>
                        <option value="6">交通银行</option>
                        <option value="31">广东发展银行</option>
                        -->
                </select>
                           </div>
                          <!--       <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                             开户行城市    <select name="city" id="Province" >
                    <option value="">请选择</option>
                        <option value="1">北京</option>
                        <option value="2">上海</option>
                        <option value="3">天津</option>
                        <option value="4">重庆</option>
                        <option value="5">河北</option>
                        <option value="6">山西</option>
                        <option value="7">内蒙古自治区</option>
                        <option value="8">辽宁</option>
                        <option value="9">吉林</option>
                        <option value="10">黑龙江</option>
                        <option value="11">江苏</option>
                        <option value="12">浙江</option>
                        <option value="13">安徽</option>
                        <option value="14">福建</option>
                        <option value="15">江西</option>
                        <option value="16">山东</option>
                        <option value="17">河南</option>
                        <option value="18">湖北</option>
                        <option value="19">湖南</option>
                        <option value="20">广东</option>
                        <option value="21">广西壮族自治区</option>
                        <option value="22">海南</option>
                        <option value="23">四川</option>
                        <option value="24">贵州</option>
                        <option value="25">云南</option>
                        <option value="26">西藏自治区</option>
                        <option value="27">陕西</option>
                        <option value="28">甘肃</option>
                        <option value="29">青海</option>
                        <option value="30">宁夏回族自治区</option>
                        <option value="31">新疆维吾尔自治区</option>
                        <option value="35">其他</option>
                </select>
                            </div>-->
                        <div style="width: 90%;margin-left: 5%;margin-top: 3px;" class="input-group">
                                <input class="form-control input-hint-text" minlength="6" check-type="required"  id="khzhmc" type="text" name="khzhmc" placeholder="开户支行名称" />
                        </div>
                            
                            
                            <button id="tj" style="width: 90%;" class="button button-primary glow">提交</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
