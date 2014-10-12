<%-- 
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

    %>
    <body>
        <jsp:include page="../top.jsp"></jsp:include>

        <br><br><br>
        <div id="pro_list" class="container"  >
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h5>项目列表</h5>
                </div>
                <div><input type="hidden" id="regid" name="regid" value="<%=ses.get("id") == null ? "" : ses.get("id").toString()%>"></div>
                <div class="panel-body">
                    <c:forEach items="${out['result']}" var="res">
                        <div id="${res['load_id']}div"   class=" container"   >
                            <div class="row pro_item" tag="${res['load_id']}div">
                                <div class="col-sm-3">
                                    <div class="pro_name">
                                        投资项目名称: ${res['load_title']} 
                                    </div>
                                    <div class="pro_rates">当前利率：${res['rate']}%</div>
                                </div>
                                <div class="col-sm-2">
                                    投资金额： ${res['sum']} 元
                                </div>
                                <div class="col-sm-2">
                                    最少投资金额：${res['least_invest']} 元
                                </div>
                                <div class="col-sm-2">
                                    发布日期：${res['create_time']}
                                </div>
                                <div class="col-sm-3">
                                    <div class="pro_progress">
                                        <div class="progress">
                                            <div style="width:  ${res['int_tzjd']}%;" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100"> ${res['int_tzjd']}%</div>
                                        </div>
                                        <div class="pro_desc">
                                            ${res['int_tzrs']}人投标
                                        </div>
                                          <c:if test="${res['int_tzjd'] != 100}">
                                        <button class="button button-flat-primary pro_button glow" onclick="invest(${res['load_id']});">投资该项目</button>
                                          </c:if>
                                    </div>
                                </div> 
                            </div>
                            <div class="panel panel-primary" id="${res['load_id']}div_detail"  style="line-height: 15px; border: 1px solid #ccc; display:none">

                                <ul class="nav nav-pills" role="tablist">
                                    <li class="active"><a href="#home" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-tags"></span>&nbsp;贷款详情</a></li>
                                    <li><a href="#profile" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-pencil"></span>&nbsp;审核信息</a></li>
                                    <li><a href="#messages" role="tab" data-toggle="tab"><span class="glyphicon glyphicon glyphicon-list-alt"></span>&nbsp;还款计划</a></li>
                                    <li><a href="#settings" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-file"></span>&nbsp;投标记录</a></li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div class="tab-pane active" id="home">
                                        <ul class="list-group">
                                            <li class="list-group-item">
                                                贷款描述<hr>
                                                ${res['load_introduce']}
                                            </li>
                                            <li class="list-group-item">
                                                贷款信息<hr>
                                                贷款编号：${res['load_id']} 还款次数：${res['payment_times']} 贷款类型：${res['type']}  还款方式：${res['payment_method']} 募标起始日：${res['begin_time']} 
                                            </li>
                                            <li class="list-group-item">
                                                个人信息<hr>
                                                借款人 ${res['loaderbase_name']} 性别 ${res['loaderbase_sex']} 
                                                婚姻状况  <select class="selectpicker"  disabled="true" value="${res['loaderbase_marital_status']}">
                                                    <option value="1">已婚有子女</option>
                                                    <option value="2">已婚无子女</option>
                                                    <option value="3">未婚</option>
                                                    <option value="4">其他</option>
                                                </select>
                                                公司行业  <select class="selectpicker"  disabled="true" value="${res['loaderwork_company_industry']}">
                                                    <option value="1">公务员</option>
                                                    <option  value="2">科研教育医疗</option>
                                                    <option  value="3">金融电信电力</option>
                                                    <option  value="4">注册事务所</option>
                                                    <option  value="6">邮政交通公用</option>
                                                    <option  value="7">媒体文艺体育</option>
                                                    <option  value="8">工业商业贸易</option>
                                                    <option  value="9"> 其他</option>
                                                </select> 
                                                现单位工作时间   <select class="selectpicker" disabled="true"   value="${res['loaderwork_join_time']}">
                                                    <option value="1">5年以上</option>
                                                    <option  value="2">3～5年</option>
                                                    <option  value="3">1～3年</option>
                                                    <option  value="4">1年以内</option>
                                                </select>
                                                月收入${res['loaderwork_income']}
                                            </li></ul>
                                    </div>
                                    <div class="tab-pane" id="profile">
                                        <div style="margin-top: 20px;margin-left: 10px; padding-bottom: 30px;">
                                            <span class="glyphicon glyphicon-ok-circle" style="margin-right: 60px;">营业执照</span>
                                            <span class="glyphicon glyphicon-remove-circle" style="margin-right: 60px;">身份证认证</span>
                                            <span class="glyphicon glyphicon-ok-circle" style="margin-right: 60px;">银行账户证明文件</span>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="messages">
                                        <table class="table table-striped">
                                            <tr><td>还款期数</td><td>本期应还利息</td><td>本期应还本金</td><td>本期应还总额</td><td>剩余本金</td></tr>
                                            <tr><td>0</td><td> </td><td> </td><td> </td><td>390,000.00</td></tr>
                                            <tr><td>1</td><td>¥3,409.25</td><td>¥0.00</td><td>¥3,409.25</td><td>¥390,000.00</td></tr>
                                            <tr><td>2</td><td>¥3,409.25</td><td>¥0.00</td><td>¥3,409.25</td><td>¥390,000.00</td></tr>
                                            <tr><td>3</td><td>¥3,409.25</td><td>¥195,000.00</td><td>¥198,409.25</td><td>¥195,000.00</td></tr>
                                        </table>
                                    </div>
                                    <div class="tab-pane" id="settings">
                                        <div> &nbsp; &nbsp; &nbsp;投标总数：169笔， 投标总额：222,100元</div>
                                        <br/>
                                        <table class="table table-striped">

                                            <tr><td>投标人</td><td>投标金额</td><td>投标时间</td></tr>
                                            <tr><td>m***h</td><td>¥5,000.00</td><td>2014-09-03 23:11</td></tr>
                                            <tr><td>n***y</td><td>¥1,400.00</td><td>2014-09-03 23:11</td></tr>
                                            <tr><td>t***s</td><td>¥3,200.00</td><td>2014-09-03 23:11</td></tr>
                                            <tr><td>n***t</td><td>¥1,400.00</td><td>2014-09-03 23:11</td></tr>
                                        </table>

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
<script src="<c:url value='/script/pc/login.js' />"></script>
<script src="<c:url value='/script/pc/register.js' />"></script>
