if<%-- 
    Document   : pro_list
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
    <link href="<c:url value='/css/pc/p2p/pro_list.css' />" rel="stylesheet" />
    <%
        Map<String, Object> ses = (HashMap<String, Object>) session.getAttribute(GlobalUtil.session_tag);
        //   String toLoadid=request.getParameter("toload_id")==null?"":(String)request.getParameter("toload_id");
%>
    <body>
        <jsp:include page="../top.jsp"></jsp:include>
        <hr>
        <div id="pro_list" class="container"  >
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h5>项目列表</h5>
                </div>
                <form action="<c:url value="/pc/p2p/pro_list.do" />" id="sxtj" method="post">
                    <div class="panel">
                        <div style="margin-left: 60px;margin-top: 20px">
                        <h4>筛选投资项目</h4> 
                        </div>
                        <div class="input-group" style="margin-bottom: 5px;width:100%;margin-top: 20px">
                            <div>
                                <div style="height: 10px;margin-left: 60px;float: left">投资期限:</div>
                                <div style="height: 10px;margin-left: 20px;float: left"><a onclick="sxqx(1)" href="#this"><font color="#EB5D68"> 1至12个月</font></a></div>
                                <div style="height: 10px;margin-left: 20px;float: left"><a  onclick="sxqx(2)"href="#this"><font color="#EB5D68"> 12至24个月</font></a></div>
                                <div style="height: 10px;margin-left: 20px;float: left"><a  onclick="sxqx(3)" href="#this"><font color="#EB5D68"> 24至36个月</font></a></div>
                            </div>
                            <br/>
                            <div style="margin-top: 10px">
                                <div style="height: 10px;margin-left: 60px;float: left">投资金额:</div>
                                <div style="height: 10px;margin-left: 20px;float: left"><a  onclick="orderje(1)" href="#this"><font color="#EB5D68"> 由小到大</font></a></div>
                                <div style="height: 10px;margin-left: 20px;float: left"><a  onclick="orderje(2)" href="#this"><font color="#EB5D68"> 由大到小</font></a></div>
                            </div>
                            <input type="hidden" name="sxtzqx" id="sxtzqx" value="">
                            <input type="hidden" name="orderje" id="orderje" value="">
                            
                            <!--                                <select class="form-control" id="sxtzqx" name="sxtzqx" style="border: 1px solid #EB5D68;width: 180px" >
                                                                <option value="">请选择</option> 
                                                                <option value="1">1-12个月</option>
                                                                <option  value="2">12-24个月</option>
                                                                <option  value="3">24-36个月</option>
                                                            </select>-->
<!--                            <span class="input-group-addon"  >投资金额范围</span>
                            <input type="text" class="form-control" minlength="8"   check-type="required"   id="sxje1" value="${out['params']['sxje1']}"    name="sxje1"  placeholder="金额大于"style="border: 1px solid #EB5D68;width: 100px"> 
                            <input type="text" class="form-control" minlength="8" check-type="required"  id="sxje2"   value="${out['params']['sxje2']}"  name="sxje2"  placeholder="金额小于"style="border: 1px solid #EB5D68;width: 100px"> -->
                        </div>  
                        <!-- <input type="submit" id="fy1" value="确定筛选" />-->  
                    </div>
                </form>
                <div>
                    <input type="hidden" id="regid" name="regid" value="<%=ses.get("id") == null ? "" : ses.get("id").toString()%>"></div>
                <div class="panel-body">
                    <c:forEach items="${out['result']}" var="res">
                        <div id="${res['load_id']}div"   class=" container"   >
                            <div class="row pro_item"   tag="${res['load_id']}div">
                                <div class="col-sm-3">
                                    <div class="pro_name" tag="${res['load_id']}div">
                                        投资项目名称: ${res['load_title']} 
                                    </div>
                                <div class="pro_rates"> <b>当前利率：</b>${res['rate']}%</div>
                                </div>
                                <div class="col-sm-2 pro_others">
                                    <b>投资金额：</b> ${res['sum']} 元

                                </div>
                                <div class="col-sm-2 pro_others">
                                    <b>剩余可投资金额：</b> ${res['int_ktje']} 元
                                </div>
                                    
                                <div class="col-sm-2 pro_others ">
                                    <b> 最少投资金额：</b> 100 元
                                    <!--least_invest-->
                                </div>
                                <div class="col-sm-2 pro_others">
                                    <b>发布日期：</b>${res['create_time']}
                                </div>
                                <div class="col-sm-3">
                                    <div class="pro_progress">
                                        <div class="progress">
                                            <div style="width:  ${res['int_tzjd']}%;" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100"> ${res['int_tzjd']}%</div>
                                        </div>
                                        <div class="pro_desc">
                                            ${res['int_tzrs']}人投标<input id="${res['load_id']}int_ktje" type="hidden" value="${res['int_ktje']}"/> 
                                        </div> 
                                        <c:if test="${res['int_tzjd']<100}">
                                            <button class="button button-flat-primary pro_button glow" onclick="location.href='/tzpt/pc/p2p/invest_tj.do?load_id=${res['load_id']}';"><h5>投资该项目</h5></button>               

                                        </c:if>
                                        <c:if test="${res['int_tzjd']>=100}">
                                            <button class="button button-danger pro_button glow"  >已满标</button>
                                        </c:if>
                                    </div>
                                </div> 
                            </div>
                            <div class="panel panel-primary" id="${res['load_id']}div_detail"  style="line-height: 15px; border: 1px solid #ccc; display:none">
                                <ul class="nav nav-pills" role="tablist">
                                    <li class="active"><a href="#${res['load_id']}home" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-tags"></span>&nbsp;贷款详情</a></li>
                                    <li><a href="#${res['load_id']}messages" role="tab" data-toggle="tab"><span class="glyphicon glyphicon glyphicon-list-alt"></span>&nbsp;还款计划</a></li>
                                    <li><a href="#${res['load_id']}settings" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-file"></span>&nbsp;投标记录</a></li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div class="tab-pane active" id="${res['load_id']}home">
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
                                    <div class="tab-pane" id="${res['load_id']}profile">
                                        <div style="margin-top: 20px;margin-left: 10px; padding-bottom: 30px;">
                                            <span class="glyphicon glyphicon-ok-circle" style="margin-right: 60px;">个人基本信息</span>
                                            <span class="glyphicon glyphicon-ok-circle" style="margin-right: 60px;">个人工作信息</span>
                                            <span class="glyphicon glyphicon-ok-circle" style="margin-right: 60px;">银行卡绑定</span>
                                            <span class="glyphicon glyphicon-remove-circle" style="margin-right: 60px;">房产认证</span>
                                            <span class="glyphicon glyphicon-remove-circle" style="margin-right: 60px;">车辆认证</span>
                                            <span class="glyphicon glyphicon-remove-circle" style="margin-right: 60px;">银行账户证明文件</span>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="${res['load_id']}messages">
                                        <iframe  width="100%" height="200px" frameborder=0 scrolling="yes" src="/tzpt/pc/p2p/loan_plan_list.do?load_id=${res['load_id']}"></iframe>
                                        <!--
                                       <table class="table table-striped">
                                           <tr><td>还款期数</td><td>本期应还利息</td><td>本期应还本金</td><td>本期应还总额</td><td>剩余本金</td></tr>
                                           <tr><td>0</td><td> </td><td> </td><td> </td><td>390,000.00</td></tr>
                                           <tr><td>1</td><td>¥3,409.25</td><td>¥0.00</td><td>¥3,409.25</td><td>¥390,000.00</td></tr>
                                           <tr><td>2</td><td>¥3,409.25</td><td>¥0.00</td><td>¥3,409.25</td><td>¥390,000.00</td></tr>
                                           <tr><td>3</td><td>¥3,409.25</td><td>¥195,000.00</td><td>¥198,409.25</td><td>¥195,000.00</td></tr>
                                       </table>-->
                                    </div>
                                    <div class="tab-pane" id="${res['load_id']}settings">
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
                                <form action="<c:url value="/pc/p2p/pro_list.do" />">
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
            </div>
        </div>
        <jsp:include page="../foot.jsp" ></jsp:include>
        <jsp:include page="../login.jsp" ></jsp:include>
        <jsp:include page="../register.jsp" ></jsp:include>
    </body>
</html>
<script src="<c:url value='/script/pc/login_new.js' />"></script>
<script src="<c:url value='/script/pc/register_new.js' />"></script>
