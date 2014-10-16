<%-- 
    Document   : index
    Created on : 2014-7-31, 11:38:53
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <jsp:include page="../head.jsp"></jsp:include>
    <body>

        <div class="row" style="margin-left: 20px;">
            <div class="span8">
                <div class="panel panel-primary" id="ldetail" style="line-height: 15px; border: 1px solid #ccc; ">

                    <div class="alert alert-info"  id="msg"  role="alert"> 
                        <form  id="statusTj" action="<c:url value="/pc/p2p/user_loan_list.do" />" method="post">
                            <span>投资状态：
                                <input type ="text" style="display:none"  id="ivt_status"  name="ivt_status"  value="${res['status']} ">
                                <select class="selectpicker" onchange="$('#ivt_status').val($(this).val())" id="cxsel"  >
                                    <option value="0">审核中</option>
                                    <option value="5">还款中</option>
                                    <option value="6">已结束</option>
                                </select> 
                            </span> 
                               <!--  <span>投资项目标题：   <input type="text" name="load_title" id="load_title " value="${res['load_title']}">  
                                </span> -->
                            <span>  <input type="submit" id="fy1" value="查询" /></span>
                        </form>    
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">     
                            <div class="next_tab_content" style="margin-top: 20px;">
                                <c:forEach items="${out['result']}" var="res">
                                    <div class="panel">
                                        <div class="info_tit">
                                            <span class="float_l"><a href="#">${res['load_title']} </a> <i>  </i></span>
                                            <span class="float_r">   <c:if test="${res['status']=='5'}"> <input type="button" value="还款" onclick="hk('${res['load_id']}')"></c:if> </span></div>
                                            <table cellspacing="0" cellpadding="0" width="100%">
                                                <tr>
                                                    <td width="100">
                                                        我的借款金额：
                                                    </td>
                                                    <td width="100">&#165;${res['sum']} 
                                                </td>
                                                <td width="100">
                                                    年利率：
                                                </td>
                                                <td width="100">${res['rate']} 
                                                </td>
                                                <td width="100">
                                                    期限：
                                                </td>
                                                <td>${res['payment_times']} 
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    还款方式：
                                                </td>
                                                <td>&#165;等额本息 
                                                </td>
                                                <td>
                                                    <span>  </span>
                                                    <span> <select class="selectpicker"  disabled="true" value="${res['status']} ">
                                                            <option value="0">已提交未审核</option>
                                                            <option value="1">银行审核通过</option>
                                                            <option value="2">平台已审核</option>
                                                            <option value="3">线下已签约</option>
                                                            <option value="4">借款发出未满标</option>
                                                            <option value="5">借款已满标</option>
                                                        </select></span>
                                                </td>

                                            </tr>
                                        </table>
                                        <div class="tab-pane" id="hkmx" style="display:none">
                                            <table class="table table-striped">
                                                <tr><td>还款期数</td><td>本期应还利息</td><td>本期应还本金</td><td>本期应还总额</td><td>剩余本金</td></tr>
                                                <tr><td>0</td><td> </td><td> </td><td> </td><td>390,000.00</td></tr>
                                                <tr><td>1</td><td>¥3,409.25</td><td>¥0.00</td><td>¥3,409.25</td><td>¥390,000.00</td></tr>
                                                <tr><td>2</td><td>¥3,409.25</td><td>¥0.00</td><td>¥3,409.25</td><td>¥390,000.00</td></tr>
                                                <tr><td>3</td><td>¥3,409.25</td><td>¥195,000.00</td><td>¥198,409.25</td><td>¥195,000.00</td></tr>
                                            </table>
                                        </div>
                                    </div></c:forEach>
                                    <div id="pro_page" class="container">
                                        <div class="row">
                                            <div align="center" class="col-sm-12">
                                            <c:set var="page" scope="page" value="${out['_page_para']}" />
                                            <form action="<c:url value="/pc/p2p/user_loan_list.do" />">
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
                                                <input type="hidden" name="ivt_status" value="${out['params']['ivt_status']}" />
                                                <input type="hidden" name="load_title" value="${out['params']['load_title']}" />
                                            </form> 
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function hk(loadid){
                location.href="user_every_loan.do?load_id="+loadid
                //  alert(loadid);
      
            }  
    
        </script>
    </body>
</html>

