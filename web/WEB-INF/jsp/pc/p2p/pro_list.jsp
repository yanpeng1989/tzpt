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
        <style>
            #pro_list_table thead tr{
                height: 60px;
            }
            #pro_list_table thead tr th{
                cursor: pointer;
            }

            #pro_list_table tbody tr td {
                padding-left: 10px;
                padding-right: 10px;
            }
            #pro_list_table tbody tr:nth-child(even){
                background-color: #f1f1f1;
            }
        </style>
        <link href="<c:url value='/css/pc/p2p/pro_list.css' />" rel="stylesheet" />
    <%
        Map<String, Object> ses = (HashMap<String, Object>) session.getAttribute(GlobalUtil.session_tag);
        //   String toLoadid=request.getParameter("toload_id")==null?"":(String)request.getParameter("toload_id");
%>
    <body>
        <jsp:include page="../top.jsp"></jsp:include>
            <div id="pro_list" class="container" style="width: 1075px;margin-top: 30px;"  >
                <div class="panel " style="border: 1px #ddd solid;">

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
                              <br/>
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
                <div class="panel-body" style=" width: 950px; margin-left: 37px;">

                    <table id="pro_list_table" style="border-color: #FFFFFF; line-height: 10px;">
                        <thead>
                            <tr>
                                <th style=" color: gray; width: 200px;">项目编号</th>
                                <th style="color: gray; width: 100px; text-align: center;">年化利率</th>
                                <th style="color: gray; width: 100px; text-align: center;">期限</th>
                                <th style="color: gray; width: 150px; text-align: center;">项目金额</th>
                                <th style="color: gray; width: 180px; text-align: center;">项目进度</th>
                                <th style="color: gray; width: 150px; text-align: center;">剩余可投金额</th>
                                <th style="color: gray; width: 150px; text-align: center;">状态</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${out['result']}" var="res">
                                <tr style=" vertical-align:  middle;">
                                    <td style=" color: #47a7e1;"> ${res['load_id']} </td>
                                    <td style="text-align: center; "> ${res['rate']}% </td>
                                    <td style="text-align: center; "> ${res['payment_times']} 月</td>
                                    <td style="text-align: center; "> ${res['sum']} 元 </td>
                                    <td style="text-align: center; ">
                                        <div class="progress" style=" margin-top: 20px; width: 90px;float: left">
                                            <div style="width:  ${res['int_tzjd']}%;"  class="progress-bar  active" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100"> </div>
                                        </div>
                                        <p style="float: right;padding-top: 24px;">${res['int_tzjd']}%</p>
                                    </td>
                                    <td style="text-align: center; ">  ${res['int_ktje']} 元 </td>

                                    <td style="text-align: center; "> <c:if test="${res['int_tzjd']<100}">
                                            <button class="button button-flat-primary pro_button " style=" font-size: 15px; " onclick="location.href = '/tzpt/pc/p2p/invest_tj.do?load_id=${res['load_id']}';">立即投资</button>   
                                        </c:if>
                                        <c:if test="${res['int_tzjd']>=100}">
                                            <button class="button button-danger pro_button" style=" font-size: 15px; ">已满标</button>
                                        </c:if>
                                    </td>
                                </tr>

                            </c:forEach>
                        </tbody>
                    </table>
                    <div id="pro_page" class="container" style="margin: 0px;width: 975px;">
                        <div class="row">
                            <div  class="col-sm-12">
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
