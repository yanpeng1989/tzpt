<%-- 
    Document   : page3
    Created on : 2014-10-28, 15:43:44
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../head.jsp" />
    <link href="<c:url value="/css/pc/test/page3.css" />" rel="stylesheet" />
    <body>
        <div align="center">
            <div id="po_asset">
                <div id="po_info">
                    <img src="<c:url value="/images/pc/head_icon.jpg" />" width="60" height="auto" />
                    <font class="po-label">用户名XXX</font>
                    <font class="po-label zhye">账户余额：</font>
                    <font color="#EB5D69">3000元</font>
                    <button id="in_cz" class="button button-flat-caution btn-sm">充值</button>
                    <button id="out_tx" class="button button-flat btn-sm">提现</button>
                    <div id="temp_line"></div>
                    <font class="po-label zhye">冻结金额：3000元</font>
                    <font class="po-label zhye">可以借款额度：3000元</font>
                </div>
            </div>
            <div id="po_detail" >
                <strong>资料完整度：</strong>
                <div id="outer_progress">
                    <div id="inner_progress"></div>
                </div>
                <font id="detail_progress" color="#4CCFBF">30%</font>
                <button id="fill_detail" class="button button-flat-primary btn-sm">完善资料</button>
            </div>
            <div id="po_project">
                <div id="pro_jzc" class="inline-div" align="center">
                    账户净资产：
                    <div>
                        0元
                    </div>
                </div>
                <div class="sign"><label>=</label></div>
                <div id="pro_ytzzc" class="inline-div" align="center">
                    已投资资产：
                    <div>
                        <font color="#EB5D69">3000元</font>
                    </div>
                </div>
                <div class="sign"><label>+</label></div>
                <div id="pro_yjezc" class="inline-div" align="center">
                    已借贷资产：
                    <div>
                        <font color="#EB5D69">-3000元</font>
                    </div>
                </div>
                <div class="sign"><label>+</label></div>
                <div id="pro_zhye" class="inline-div" align="center">
                    账户余额：
                    <div>
                        <font color="#EB5D69">0元</font>
                    </div>
                </div>
                <div class="temp_line"></div>
                <div class="pro-title">投资账户</div>
                <table class="table table-hover my-table">
                    <thead>
                        <tr>
                            <th>投资项目</th>
                            <th>借款总额</th>
                            <th>年利率</th>
                            <th>还款方式</th>
                            <th>期限</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>*****</td>
                            <td>3000元</td>
                            <td>5%</td>
                            <td>等额本息</td>
                            <td>3</td>
                            <td><a href="#this">查看</a></td>
                        </tr>
                    </tbody>
                </table>
                <div class="pro-title">融资账户</div>
                <table class="table table-hover my-table">
                    <thead>
                        <tr>
                            <th>借款项目</th>
                            <th>借款总额</th>
                            <th>年利率</th>
                            <th>还款方式</th>
                            <th>期限</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>*****</td>
                            <td>3000元</td>
                            <td>5%</td>
                            <td>等额本息</td>
                            <td>3</td>
                            <td><a href="#this">查看</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
<script type="text/javascript">
    $(function() {
        //资料完善百分比，只需要在#detail_progress填写百分比即可
        var percent = $("#detail_progress").html();
        try {
            percent = (Number)(percent.substr(0, percent.length - 1)) / 100;
            var ow = $("#outer_progress").width();
            var iw = Math.floor(ow * percent);
            $("#inner_progress").width(iw);
        } catch (e) {
            
        }

    });
</script>



