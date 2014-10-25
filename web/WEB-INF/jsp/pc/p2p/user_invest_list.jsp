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
             <form  id="statusTj" action="<c:url value="/pc/p2p/user_invest_list.do" />" method="post">
             <span>投资状态：
                 <input type ="text" style="display:none"  id="ivt_status"  name="ivt_status"  value="${out['params']['ivt_status']}">
                 <select class="selectpicker" onchange="$('#ivt_status').val($(this).val())" id="cxsel"  >
                                            <option value="0">申请中</option>
                                            <option value="2">持有中</option>
                                            <option value="3">已结束</option>
                 </select> 
             </span> 
                <!--  <span>投资项目标题：   <input type="text" name="load_title" id="load_title " value="${out['params']['load_title']}">  
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
                            <span class="float_r">   <!--<input type="button" value="查看" onclick="$('#hkmx').show()">--> </span></div>
                        <table cellspacing="0" cellpadding="0" width="100%">
                            <tr>
                                <td width="100">
                                    我的投资金额：
                                </td>
                                <td width="100">&#165;${res['stages_assests']} 
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
                                   借款总额：
                                </td>
                                <td>&#165;${res['sum']} 
                                </td>
                                <td>
                                    还款方式：
                                </td>
                                <td>&#165;等额本息 
                                </td>
                                <td>
                                <span>  </span>
                                <span> <select class="selectpicker"  disabled="true" value="${res['status']} ">
                                            <option value="0">冻结资金</option>
                                            <option value="1">投资失败</option>
                                            <option value="2">未还款</option>
                                            <option value="3">已还款</option>
                                   </select></span>
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

 