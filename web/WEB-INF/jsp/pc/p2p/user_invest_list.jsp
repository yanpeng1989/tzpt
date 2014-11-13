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

                    <div class="alert alert-info"  id="msg"  role="alert">
                      
                        <form  id="statusTj" action="<c:url value="/pc/p2p/user_invest_list.do" />" method="post">
                            <div class="input-group" style="width:90%;">
                        <div style="margin-left: 10px;margin-top: 0px; margin-bottom: 10px;">
                        <h4>投资账户</h4> 
                        </div>
                                
                           <div>
                                <div style="height: 10px;margin-left: 30px;float: left">状态:</div>
                                <div style="height: 10px;margin-left: 20px;float: left"><a onclick="$('#ivt_status').val(0);$('#statusTj').submit();" href="#this"><font color="#EB5D68"> 申请中</font></a></div>
                                <div style="height: 10px;margin-left: 20px;float: left"><a  onclick="$('#ivt_status').val(2);$('#statusTj').submit();"href="#this"><font color="#EB5D68"> 持有中</font></a></div>
                                <div style="height: 10px;margin-left: 20px;float: left"><a  onclick="$('#ivt_status').val(3);$('#statusTj').submit();" href="#this"><font color="#EB5D68"> 已结束</font></a></div>
                            </div>
                            <div style="display:none">
                                <span class="input-group-addon"style="width: 140px"><font style="color: #EB5D68">投资状态：</font></span>
                                <input type ="text" style="display:none"  id="ivt_status"  name="ivt_status"  value="${out['params']['ivt_status']}">
                              
                            <span><input type="submit" id="fy1" value="查询"class="button button-primary glow" /></span>
                            </div>
                            
                            
                            
                            </div>
                        </form>    
                    </div>
                    <table id="pro_list_table" style="border-color: #FFFFFF; line-height: 10px;">
                        <thead>
                            <tr>
                                <th style=" color: gray; width: 200px;">投资项目编号</th>
                                <th style="color: gray; width: 100px; text-align: center;">借款总额</th>
                                <th style="color: gray; width: 100px; text-align: center;">年利率</th>
                                <th style="color: gray; width: 150px; text-align: center;">还款方式</th>
                                <th style="color: gray; width: 180px; text-align: center;">期限</th>
                                <th style="color: gray; width: 150px; height: 30px; text-align: center;">操作</th>
                            
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${out['result']}" var="res">
                                <tr style=" vertical-align:  middle;">
                                    <td style=" color: #47a7e1;"> ${res['load_id']} </td>
                                    <td style="text-align: center; ">${res['sum']} </td>
                                    <td style="text-align: center; ">${res['rate']}% </td>
                                    <td style="text-align: center; "> 等额本息  </td>
                                    <td style="text-align: center; ">
                                     ${res['payment_times']} 
                                    </td>
                                     <td style="text-align: center; height:30px;">  
                                         <a href="#">  <div id="${res['invest_id']}_cz"  onclick="showxx(${res['invest_id']});" style="color:#EB5D69"> 查看</div></a>
                                     </td>
                                </tr>
                                <tr><td colspan="6">
                                <div class="tab-pane" id="${res['invest_id']}_cz_xx" style="display:none">
                                            <iframe  width="100%" height="200px;" frameborder=0 scrolling="yes" src="/tzpt/pc/p2p/user_every_invest.do?invest_id=${res['invest_id']}"></iframe>
                                
                                        </div>  
                                        
                                    </td></tr>
                            </c:forEach>
                        </tbody>
                    </table>             
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">     
                            <div class="next_tab_content" style="margin-top: 20px;">
                              
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

