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
        <div class="row" style="margin-left:  0px;">
            <div class="span8">
                <div class="panel panel-primary" id="ldetail" style="line-height: 15px; border: 1px solid #ccc; ">

                    <div class="alert alert-info" style="display: none" id="msg"  role="alert"> 
                        <form  id="statusTj" action="<c:url value="/pc/p2p/user_invest_give.do" />" method="post">
                            <div class="input-group" style="margin-bottom: 10px;width:100%">
                                <span class="input-group-addon"style="width: 140px"><font style="color: #EB5D68">投资状态：</font></span>
                                <input type ="text" style="display:none"  id="ivt_status"  name="ivt_status"  value="${out['params']['ivt_status']}">
                                <select class="form-control" onchange="$('#ivt_status').val($(this).val())" id="cxsel" style="width: 120px;border: 1px solid #EB5D68;" >
                                    <option value="0">申请中</option>
                                    <option value="2">持有中</option>
                                    <option value="3">已结束</option>
                                </select> 
                            <span><input type="submit" id="fy1" value="查询"class="button button-primary glow" /></span>
                            </div>
                        </form>    
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">     
                            <div class="next_tab_content" style="margin-top: 20px;">
                                <c:forEach items="${out['result']}" var="res">
                                    <div class="panel">
                                        <div class="info_tit">
                                            <span class="float_l"><font style="color: #EB5D68">项目名称：</font><a href="#">${res['load_title']} </a> <i>  </i></span>
                                            <span class="float_r">   <!--<input type="button" value="查看" onclick="$('#hkmx').show()">--> </span></div>
                                        <table cellspacing="0" cellpadding="0" width="100%">
                                            <tr>
                                                <td width="100">
                                                    <font style="color: #EB5D68">投资金额：</font>
                                                </td>
                                                <td width="100">&#165;${res['stages_assests']} 
                                                </td>
                                                <td width="100">
                                                    <font style="color: #EB5D68">年利率：</font>
                                                </td>
                                                <td width="100">${res['rate']} 
                                                </td>
                                                <td width="100">
                                                    <font style="color: #EB5D68">分期：</font>
                                                </td>
                                                <td>${res['payment_times']} 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <font style="color: #EB5D68">借款总额：</font>
                                                </td>
                                                <td>&#165;${res['sum']} 
                                                </td>
                                                <td>
                                                    <font style="color: #EB5D68">还款方式：</font>
                                                </td>
                                                <td>&#165;等额本息 
                                                </td>
                                                <td>
                                                    <div>
                                                    <span> <input  id="zrje" type="text"  name="zrje" placeholder="请输入转让金额" />  </span>
                                                    <span> 
                                                     <input type="button" id="fy1" value="转让" onclick="invest_give(${res['invest_id']},$('#zrje').val() );" class="button button-primary glow" />
                                                   </span>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="tab-pane" id="hkmx" style=" ">
                                            <iframe  width="100%" height="200px" frameborder=0 scrolling="yes" src="/tzpt/pc/p2p/user_every_invest.do?invest_id=${res['invest_id']}"></iframe>

                                        </div>
                                    </div></c:forEach>
                                    <div id="pro_page" class="container">
                                        <div class="row">
                                            <div align="center" class="col-sm-12">
                                            <c:set var="page" scope="page" value="${out['_page_para']}" />
                                            <form action="<c:url value="/pc/p2p/user_invest_list.do" />">
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


    </body>
</html>

