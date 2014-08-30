<%-- 
    Document   : pro_list
    Created on : 2014-8-17, 17:47:42
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../head.jsp"></jsp:include>
    <link href="<c:url value='/css/pc/p2p/pro_list.css' />" rel="stylesheet" />

    <body>
        <jsp:include page="../top.jsp"></jsp:include>

            <div id="pro_list" class="container">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h5>项目列表2</h5>
                    </div>
                    
                    <div class="panel-body">
                        <div class="container pro_item ">
                            <div class="col-sm-3">
                                <div class="pro_name">
                                       <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">投资项目名称xxxxx <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li class="nav-header">Nav header</li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">One more separated link</a></li>
                  </ul>
                </li>
                                 </div>
                                <div class="pro_rates">当前利率：11%</div>
                            </div>
                            <div class="col-sm-2">
                                投资金额：244,000元
                            </div>
                            <div class="col-sm-2">
                                投资期限:13个月 
                            </div>
                            <div class="col-sm-2">
                                发布日期：2014-08-22
                            </div>
                            <div class="col-sm-3">
                                <div class="pro_progress">
                                    <div class="progress">
                                        <div style="width: 60%;" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">60%</div>
                                    </div>
                                    <div class="pro_desc">
                                        123人投标
                                    </div>
                                    <button class="button button-flat-primary pro_button glow">投资该项目</button>
                                </div>
                            </div>
                        </div>
                        <div class="pro_item container">
                            <div class="col-sm-3">
                                <div class="pro_name">投资项目名称xxxxx</div>
                                <div class="pro_rates">当前利率：11%</div>
                            </div>
                            <div class="col-sm-2">
                                投资金额：244,000元
                            </div>
                            <div class="col-sm-2">
                                投资期限:13个月 
                            </div>
                            <div class="col-sm-2">
                                发布日期：2014-08-22
                            </div>
                            <div class="col-sm-3">
                                <div class="pro_progress">
                                    <div class="progress">
                                        <div style="width: 60%;" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">60%</div>
                                    </div>
                                    <div class="pro_desc">
                                        123人投标
                                    </div>
                                    <button class="button button-flat-primary pro_button">投资该项目</button>
                                </div>
                            </div>
                        </div>
                        <div class="pro_item container">
                            <div class="col-sm-3">
                                <div class="pro_name">投资项目名称xxxxx</div>
                                <div class="pro_rates">当前利率：11%</div>
                            </div>
                            <div class="col-sm-2">
                                投资金额：244,000元
                            </div>
                            <div class="col-sm-2">
                                投资期限:13个月 
                            </div>
                            <div class="col-sm-2">
                                发布日期：2014-08-22
                            </div>
                            <div class="col-sm-3">
                                <div class="pro_progress">
                                    <div class="progress">
                                        <div style="width: 60%;" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">60%</div>
                                    </div>
                                    <div class="pro_desc">
                                        123人投标
                                    </div>
                                    <button class="button button-flat-primary pro_button">投资该项目</button>
                                </div>
                            </div>
                        </div>
                        <div class="pro_item container">
                            <div class="col-sm-3">
                                <div class="pro_name">投资项目名称xxxxx</div>
                                <div class="pro_rates">当前利率：11%</div>
                            </div>
                            <div class="col-sm-2">
                                投资金额：244,000元
                            </div>
                            <div class="col-sm-2">
                                投资期限:13个月 
                            </div>
                            <div class="col-sm-2">
                                发布日期：2014-08-22
                            </div>
                            <div class="col-sm-3">
                                <div class="pro_progress">
                                    <div class="progress">
                                        <div style="width: 60%;" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">60%</div>
                                    </div>
                                    <div class="pro_desc">
                                        123人投标
                                    </div>
                                    <button class="button button-flat-primary pro_button glow">投资该项目</button>
                                </div>
                            </div>
                        </div>
                        <div id="pro_page" class="container">
                            <div class="row">
                                <div align="center" class="col-sm-12">
                                    <ul class="pager">
                                        <li><a href="#">上一页</a></li>
                                        <li><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#">6</a></li>
                                        <li><a href="#">下一页</a></li>
                                    </ul>
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