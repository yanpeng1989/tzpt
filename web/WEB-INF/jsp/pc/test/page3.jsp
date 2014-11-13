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
    
      var o = new AjaxOpts("#_find_form_");
          o.put("service_code", "S30012");
          o.sus = function(data) {
              
                 $("#available_assets").html(data.available_assets);
                      $("#available_assets2").html(data.available_assets);
                 $("#invested_assets").html(data.invested_assets);
                    $("#invested_assets2").html(data.invested_assets);
                  $("#credit_line").html(data.credit_line);
                  $("#debt_assets2").html(data.debt_assets);
                  $("#frozen_assets").html(data.frozen_assets);
                  $("#gold_coin").html(data.gold_coin);
                  $("#sum_assets").html(data.available_assets) ;    
        
        };
         $.ajax(o);
    
    
</script>

        <div align="center">
            <div id="po_asset">
                <div id="po_info">
                    <img src="<c:url value="/images/pc/head_icon.jpg" />" width="60" height="auto" />
                    <font class="po-label">用户 </font>
                    <font class="po-label zhye">账户余额：</font>
                    <font color="#EB5D69"><lable id="available_assets">元</lable></font>
                    <button id="in_cz" onclick="location.href='/tzpt/pc/p2p/account/account_recharge.do'" class="button button-flat-caution btn-sm">充值</button>
                    <button id="out_tx"  onclick="location.href='/tzpt/pc/p2p/account/account_recharge.do'" class="button button-flat btn-sm">提现</button>
                    <div id="temp_line"></div>
                    <font class="po-label zhye">冻结金额：<lable id="frozen_assets"></lable>元</font>
                    <font class="po-label zhye">可以借款额度：<lable id="credit_line"></lable>元</font>
                </div>
            </div>
            <div id="po_detail" >
                <strong>资料完整度：</strong>
                <div id="outer_progress">
                    <div id="inner_progress"></div>
                </div>
            <font id="detail_progress" color="#4CCFBF">30%</font>
            <button id="fill_detail" class="button button-flat-primary " onclick="location.href='/tzpt/pc/p2p/information/person_info.do'">完善资料</button> 
            </div>
            <div id="po_project">
                <div id="pro_jzc" class="inline-div" align="center">
                    账户净资产：
                    <div>
                       <lable id="sum_assets"></lable>元
                    </div>
                </div>
                <div class="sign"><label>=</label></div>
                <div id="pro_ytzzc" class="inline-div" align="center">
                    已投资资产：
                    <div>
                        <font color="#EB5D69"><lable id="invested_assets2"></lable>元</font>
                    </div>
                </div>
                <div class="sign"><label>+</label></div>
                <div id="pro_yjezc" class="inline-div" align="center">
                    已借贷资产：
                    <div>
                        <font color="#EB5D69"><lable id="debt_assets2"></lable>元</font>
                    </div>
                </div>
                <div class="sign"><label>+</label></div>
                <div id="pro_zhye" class="inline-div" align="center">
                    账户余额：
                    <div>
                        <font color="#EB5D69"><lable id="available_assets2"></lable>元</font>
                    </div>
                </div>
                <div class="temp_line"></div><br>
                 <div>
                  <iframe style="width: 100%; height:160px;"  scrolling="no" src="/tzpt/pc/p2p/user_invest_list.do"></iframe>
                  <iframe style="width: 100%; height:160px;" scrolling="no" src="/tzpt/pc/p2p/user_loan_list.do"></iframe>
                </div>
            
          </div> 
        </div>
    </body>
</html>



