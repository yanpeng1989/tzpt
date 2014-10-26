if<%-- 
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
        //   String toLoadid=request.getParameter("toload_id")==null?"":(String)request.getParameter("toload_id");
%>
    <body>
        <jsp:include page="../top.jsp"></jsp:include>
            <hr>
            <div align="center">

                <form action="<c:url value="/pc/p2p/invest_tj.do" />" method="post">
                <!--   <br>利率范围：
                  <input name="load_id" value="${out['params']['load_id']}" />-<input name="load_id" value="${out['params']['load_id']}" />
                  <input type="submit" id="fy1" value="查询" />-->
            </form>
            <div>
                <input type="hidden" id="regid" name="regid" value="<%=ses.get("id") == null ? "" : ses.get("id").toString()%>"></div>
            <div class="panel-body">
                <c:forEach items="${out['result']}" var="res">
                    <div id="${res['load_id']}div"   class=" container"   >
                        <div class="panel pro-loan">
                            <div class="panel-heading pro-heading">
                                <i class="panel-title pro-title">投资项目</i>
                                <label class="panel-pro-id">项目编号：${res['load_id']}</label>
                            </div>
                            <div class="panel-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="pull-right">
                                                <label class="pro-name">投资项目名称 ${res['load_title']} </label>
                                                <p class="pro-text1">
                                                    预计年化收益率：<label class="pro-rate">${res['rate']}%</label>
                                                </p>
                                                <p class="pro-text1">
                                                    分期：${res['payment_times']} 个月
                                                </p>
                                                <p class="pro-text1">
                                                    还款方式：等额本金
                                                </p>
                                                <p class="pro-text1">
                                                    最低投资金额：${res['least_invest']} 元
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-lg-2"></div>
                                        <div class="col-lg-3">
                                            <div class="">
                                                <br />
                                                <label>请输入投资金额</label>
                                                <input type="text" id="${res['load_id']}tzje" class="form-control danger"  />
                                                <br />
                                                <label>募标起始日：${res['create_time']}</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <br />
                                            <br />
                                            <input id="${res['load_id']}int_ktje" type="hidden" value="${res['int_ktje']}"/> 
                                            <c:if test="${res['int_tzjd']<100}">
                                                <button id="invest_now"  onclick="invest(${res['load_id']},${res['loaderbase_id']},${res['int_ktje']});"class="button button-flat-caution glow">立即投资</button>
                                            </c:if>
                                            <c:if test="${res['int_tzjd']>=100}">
                                                <button class="button button-danger pro_button glow"  >已满标</button>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pro-loan">
                            <ul id="invest_tab" class="nav pro-nav" role="tablist">
                                <li class="active"><a href="#${res['load_id']}home" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-tags"></span>&nbsp;贷款详情</a></li>
                                <li><a href="#${res['load_id']}messages" role="tab" data-toggle="tab"><span class="glyphicon glyphicon glyphicon-list-alt"></span>&nbsp;还款计划</a></li>
                                <li><a href="#${res['load_id']}settings" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-file"></span>&nbsp;投标记录</a></li>

                            </ul> 
                            <div class="tab-content panel">
                                <div class="tab-pane fade in active panel-body" id="${res['load_id']}home">
                                    <ul class="list-group">
                                        <li class="list-group-item">
                                            <font color="blue"> 贷款描述</font><hr>
                                            ${res['load_introduce']}
                                        </li>
                                        <li class="list-group-item">
                                            <font color="blue"> 贷款信息</font>  <hr>
                                            <b>贷款编号:</b>${res['load_id']}&nbsp; 
                                            <b>还款次数:</b>${res['payment_times']}&nbsp;
                                            <b>贷款类型:</b>
                                            <select class="selectpicker"  disabled="true" value="${res['loaderbase_marital_status']}">
                                                <option value="1">个人</option>
                                                <option value="2">企业</option>
                                            </select> 
                                            <b>还款方式:</b>${res['payment_method']}&nbsp; 
                                            <b>募标起始日:</b>${res['begin_time']} 
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade panel-body" id="${res['load_id']}messages">
                                    <iframe  width="100%" height="200px" frameborder=0 scrolling="yes" src="/tzpt/pc/p2p/loan_plan_list.do?load_id=${res['load_id']}"></iframe>
                                </div>
                                <div class="tab-pane fade panel-body" id="${res['load_id']}settings">
                                    <div> &nbsp; &nbsp; &nbsp;投标总数：${res['int_tzrs']}笔， 投标总额： ${res['int_ytje']}元</div>
                                    <br/>
                                    <iframe  width="100%" height="200px" frameborder=0 scrolling="yes" src="/tzpt/pc/p2p/invest_history_list.do?load_id=${res['load_id']}"></iframe>
                                </div>
                            </div>    
                        </div>
                    </div>
                </c:forEach>
                <div id="pro_page" class="container">
                    <div class="row">
                        <div align="center" class="col-sm-12">
                            <c:set var="page" scope="page" value="${out['_page_para']}" />
                            <form action="<c:url value="/pc/p2p/invest_tj.do" />">
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
                                <input type="hidden" name="load_id" value="${out['params']['load_id']}" />
                            </form> 
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
