<%-- 
    Document   : invest_tj
    Created on : 2014-8-17, 17:47:42
    Author     : cyss210
--%>
<%@page import="java.util.HashMap"%>
<%@page import="com.cysoa.frame.util.GlobalUtil"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../head.jsp"></jsp:include>
    <link href="<c:url value='/css/pc/p2p/invest_tj.css' />" rel="stylesheet" />
    <%
        Map<String, Object> ses = (HashMap<String, Object>) session.getAttribute(GlobalUtil.session_tag);
    %>
    <body>
        <jsp:include page="../top.jsp"></jsp:include>
            <hr>
            <div align="center">
                <div class="panel-body">
                    <div id="${out['load_id']}div"   class=" container"   >
                        <div class="panel pro-loan">
                            <div class="panel-heading pro-heading">
                                <i class="panel-title pro-title">投资项目</i>
                                <label class="panel-pro-id">项目编号：${out['load_id']}</label>
                            </div>
                            <div class="panel-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="pull-right">
                                                <label class="pro-name">投资项目名称 ${out['load_title']} </label>
                                                <p class="pro-text1">
                                                    预计年化收益率：<label class="pro-rate">${out['rate']}%</label>
                                                </p>
                                                <p class="pro-text1">
                                                    分期：${out['payment_times']} 个月
                                                </p>
                                                <p class="pro-text1">
                                                    还款方式：等额本金
                                                </p>
                                                <p class="pro-text1">
                                                    最低投资金额：100 元
                                                </p>
                                                <p class="pro-text1">
                                                    剩余可投金额：${out['int_ktje']} 元
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-lg-2"></div>
                                        <div class="col-lg-3">
                                            <div class="">
                                                <br />
                                                <label>请输入投资金额</label>
                                                <input type="text" id="${out['load_id']}tzje" class="form-control danger"  />
                                                <br />
                                                <label>募标起始日：${out['create_time']}</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <br />
                                            <br />
                                            <input id="${out['load_id']}int_ktje" type="hidden" value="${out['int_ktje']}"/> 
                                            <c:if test="${out['int_tzjd']<100}">
                                                <button id="invest_now"  onclick="invest(${out['load_id']},${out['id']},${out['int_ktje']});"class="button button-flat-caution glow">立即投资</button>
                                            </c:if>
                                            <c:if test="${out['int_tzjd']>=100}">
                                                <button class="button button-danger pro_button glow"  >已满标</button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pro-loan">
                            <ul id="invest_tab" class="nav pro-nav" role="tablist">
                                <li class="active"><a href="#${out['load_id']}home" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-tags"></span>&nbsp;贷款详情</a></li>
                                <li><a href="#${out['load_id']}messages" role="tab" data-toggle="tab"><span class="glyphicon glyphicon glyphicon-list-alt"></span>&nbsp;还款计划</a></li>
                                <li><a href="#${out['load_id']}settings" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-file"></span>&nbsp;投标记录</a></li>

                            </ul> 
                            <div class="tab-content panel">
                                <div class="tab-pane fade in active panel-body" id="${out['load_id']}home">
                                    <ul class="list-group">
                                        <li class="list-group-item">
                                            <font color="blue"> 贷款描述</font><hr>
                                            ${out['load_introduce']}
                                        </li>
                                        <li class="list-group-item">
                                            <font color="blue"> 贷款信息</font>  <hr>
                                            <b>贷款编号:</b>${out['load_id']}&nbsp; 
                                            <b>还款次数:</b>${out['payment_times']}&nbsp;
                                            <b>贷款类型:</b>
                                            <select class="selectpicker"  disabled="true" value="${out['loaderbase_marital_status']}">
                                                <option value="1">个人</option>
                                                <option value="2">企业</option>
                                            </select> 
                                            <b>还款方式:</b>${out['payment_method']}&nbsp; 
                                            <b>募标起始日:</b>${out['begin_time']} 
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade panel-body" id="${out['load_id']}messages">
                                    <iframe  width="100%" height="200px" frameborder=0 scrolling="yes" src="/tzpt/pc/p2p/loan_plan_list.do?load_id=${out['load_id']}"></iframe>
                                </div>
                                <div class="tab-pane fade panel-body" id="${out['load_id']}settings">
                                    <div> &nbsp; &nbsp; &nbsp;投标总数：${out['int_tzrs']}笔， 投标总额： ${out['int_ytje']}元</div>
                                    <br/>
                                    <iframe  width="100%" height="200px" frameborder=0 scrolling="yes" src="/tzpt/pc/p2p/invest_history_list.do?load_id=${out['load_id']}"></iframe>
                                </div>
                            </div>    
                        </div>
                    </div>
            </div>
            <jsp:include page="../foot.jsp" ></jsp:include>
            <jsp:include page="../login.jsp" ></jsp:include>
            <jsp:include page="../register.jsp" ></jsp:include>
        </body>
    </html>
    <script src="<c:url value='/script/pc/login_new.js' />"></script>
<script src="<c:url value='/script/pc/register_new.js' />"></script>
<script src="<c:url value='/script/pc/p2p/invest_tj.js' />"></script>
