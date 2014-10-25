<%-- 
    Document   : page1
    Created on : 2014-10-24, 14:47:12
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../head.jsp" />
    <link href="<c:url value="/css/pc/test/page1.css" />" rel="stylesheet" />
    <body>
        <jsp:include page="../top.jsp"></jsp:include>
            <div align="center">
                <div class="panel pro-loan">
                    <div class="panel-heading pro-heading">
                        <i class="panel-title pro-title">投资项目</i>
                        <label class="panel-pro-id">项目编号：9849723873877</label>
                    </div>
                    <div class="panel-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="pull-right">
                                        <label class="pro-name">投资项目名称xxxx</label>
                                        <p class="pro-text1">
                                            预计年化收益率：<label class="pro-rate">6.2%</label>
                                        </p>
                                        <p class="pro-text1">
                                            期限：3年
                                        </p>
                                        <p class="pro-text1">
                                            还款方式：等额本金
                                        </p>
                                        <p class="pro-text1">
                                            最低投资金额：100元
                                        </p>
                                    </div>
                                </div>
                                <div class="col-lg-2"></div>
                                <div class="col-lg-3">
                                    <div class="">
                                        <br />
                                        <label>请输入投资金额</label>
                                        <input type="text" id="tzje" class="form-control danger"  />
                                        <br />
                                        <label>募标起始日：2014-10-22</label>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <br />
                                    <br />
                                    <button id="invest_now" class="button button-flat-caution glow">立即投资</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pro-loan">
                    <ul id="invest_tab" class="nav pro-nav" role="tablist">
                        <li class="active">
                            <a href="#jdxq" role="tab" data-toggle="tab">借贷详情</a>
                        </li>
                        <li>
                            <a href="#hkjl" role="tab" >还款计划</a>
                        </li>
                        <li>
                            <a href="#tzjl" role="tab" >投资记录</a>
                        </li>
                    </ul>
                    <div class="tab-content panel">
                        <div class="tab-pane fade in active panel-body" id="jdxq">
                            123
                        </div>
                        <div class="tab-pane fade panel-body" id="hkjl">
                            345
                        </div>
                        <div class="tab-pane fade panel-body" id="tzjl">
                            456
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="../foot.jsp" ></jsp:include>
    </body>
</html>
<script type="text/javascript">
    $(function(){
        $("#invest_tab a").click(function(e){
            e.preventDefault();
            $(this).tab("show");
        });
    });
</script>
