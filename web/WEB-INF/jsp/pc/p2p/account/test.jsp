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
 <jsp:include page="../../head.jsp"></jsp:include>
    <body>
      <div class="account-summary content-wrapper ng-scope">
<section class="row simple-summary">
  <!-- Total Net Income -->
  <div class="col-xs-7 simple-summary-section total-net-income">
    <div id="column-chart" class="total-interest">
      <div class="text-center ng-hide" ng-show="!gotSummary">
        <h4 class="loading-animation summary-loading"><i class="spinner sl-icon-loading"></i></h4>
      </div>
      <div class="monthly-income" ng-show="gotSummary">

        <ul class="list-inline monthly-income-bars" ng-class="{invisible:loadingColumn}">
          <!-- ngRepeat: m in monthlyIncome --><li class="every-month ng-scope" ng-repeat="m in monthlyIncome" ng-class="{noMargin:$last}" ng-style="{left:m.left}" style="left: 0px;">
            <a href="" ng-style="{width:m.width,height:m.height}" style="width: 33.9166666666667px; height: 8px;">
              <div class="income-info">
                <span class="ng-binding">2013-10净收入</span><br>
                <span ng-bind="m.interest | slCurrency" class="ng-binding">0.00元</span>
              </div>
            </a>
          </li><!-- end ngRepeat: m in monthlyIncome --><li class="every-month ng-scope" ng-repeat="m in monthlyIncome" ng-class="{noMargin:$last}" ng-style="{left:m.left}" style="left: 38.9166666666667px;">
            <a href="" ng-style="{width:m.width,height:m.height}" style="width: 33.9166666666667px; height: 8px;">
              <div class="income-info">
                <span class="ng-binding">2013-11净收入</span><br>
                <span ng-bind="m.interest | slCurrency" class="ng-binding">0.00元</span>
              </div>
            </a>
          </li><!-- end ngRepeat: m in monthlyIncome --><li class="every-month ng-scope" ng-repeat="m in monthlyIncome" ng-class="{noMargin:$last}" ng-style="{left:m.left}" style="left: 77.8333333333333px;">
            <a href="" ng-style="{width:m.width,height:m.height}" style="width: 33.9166666666667px; height: 8px;">
              <div class="income-info">
                <span class="ng-binding">2013-12净收入</span><br>
                <span ng-bind="m.interest | slCurrency" class="ng-binding">0.00元</span>
              </div>
            </a>
          </li><!-- end ngRepeat: m in monthlyIncome --><li class="every-month ng-scope" ng-repeat="m in monthlyIncome" ng-class="{noMargin:$last}" ng-style="{left:m.left}" style="left: 116.75px;">
            <a href="" ng-style="{width:m.width,height:m.height}" style="width: 33.9166666666667px; height: 8px;">
              <div class="income-info">
                <span class="ng-binding">2014-01净收入</span><br>
                <span ng-bind="m.interest | slCurrency" class="ng-binding">0.00元</span>
              </div>
            </a>
          </li><!-- end ngRepeat: m in monthlyIncome --><li class="every-month ng-scope" ng-repeat="m in monthlyIncome" ng-class="{noMargin:$last}" ng-style="{left:m.left}" style="left: 155.666666666667px;">
            <a href="" ng-style="{width:m.width,height:m.height}" style="width: 33.9166666666667px; height: 8px;">
              <div class="income-info">
                <span class="ng-binding">2014-02净收入</span><br>
                <span ng-bind="m.interest | slCurrency" class="ng-binding">0.00元</span>
              </div>
            </a>
          </li><!-- end ngRepeat: m in monthlyIncome --><li class="every-month ng-scope" ng-repeat="m in monthlyIncome" ng-class="{noMargin:$last}" ng-style="{left:m.left}" style="left: 194.583333333333px;">
            <a href="" ng-style="{width:m.width,height:m.height}" style="width: 33.9166666666667px; height: 8px;">
              <div class="income-info">
                <span class="ng-binding">2014-03净收入</span><br>
                <span ng-bind="m.interest | slCurrency" class="ng-binding">0.00元</span>
              </div>
            </a>
          </li><!-- end ngRepeat: m in monthlyIncome --><li class="every-month ng-scope" ng-repeat="m in monthlyIncome" ng-class="{noMargin:$last}" ng-style="{left:m.left}" style="left: 233.5px;">
            <a href="" ng-style="{width:m.width,height:m.height}" style="width: 33.9166666666667px; height: 8px;">
              <div class="income-info">
                <span class="ng-binding">2014-04净收入</span><br>
                <span ng-bind="m.interest | slCurrency" class="ng-binding">0.00元</span>
              </div>
            </a>
          </li><!-- end ngRepeat: m in monthlyIncome --><li class="every-month ng-scope" ng-repeat="m in monthlyIncome" ng-class="{noMargin:$last}" ng-style="{left:m.left}" style="left: 272.416666666667px;">
            <a href="" ng-style="{width:m.width,height:m.height}" style="width: 33.9166666666667px; height: 8px;">
              <div class="income-info">
                <span class="ng-binding">2014-05净收入</span><br>
                <span ng-bind="m.interest | slCurrency" class="ng-binding">0.00元</span>
              </div>
            </a>
          </li><!-- end ngRepeat: m in monthlyIncome --><li class="every-month ng-scope" ng-repeat="m in monthlyIncome" ng-class="{noMargin:$last}" ng-style="{left:m.left}" style="left: 311.333333333333px;">
            <a href="" ng-style="{width:m.width,height:m.height}" style="width: 33.9166666666667px; height: 8px;">
              <div class="income-info">
                <span class="ng-binding">2014-06净收入</span><br>
                <span ng-bind="m.interest | slCurrency" class="ng-binding">0.00元</span>
              </div>
            </a>
          </li><!-- end ngRepeat: m in monthlyIncome --><li class="every-month ng-scope" ng-repeat="m in monthlyIncome" ng-class="{noMargin:$last}" ng-style="{left:m.left}" style="left: 350.25px;">
            <a href="" ng-style="{width:m.width,height:m.height}" style="width: 33.9166666666667px; height: 8px;">
              <div class="income-info">
                <span class="ng-binding">2014-07净收入</span><br>
                <span ng-bind="m.interest | slCurrency" class="ng-binding">0.00元</span>
              </div>
            </a>
          </li><!-- end ngRepeat: m in monthlyIncome --><li class="every-month ng-scope" ng-repeat="m in monthlyIncome" ng-class="{noMargin:$last}" ng-style="{left:m.left}" style="left: 389.166666666667px;">
            <a href="" ng-style="{width:m.width,height:m.height}" style="width: 33.9166666666667px; height: 8px;">
              <div class="income-info">
                <span class="ng-binding">2014-08净收入</span><br>
                <span ng-bind="m.interest | slCurrency" class="ng-binding">0.00元</span>
              </div>
            </a>
          </li><!-- end ngRepeat: m in monthlyIncome --><li class="every-month ng-scope noMargin" ng-repeat="m in monthlyIncome" ng-class="{noMargin:$last}" ng-style="{left:m.left}" style="left: 428.083333333333px;">
            <a href="" ng-style="{width:m.width,height:m.height}" style="width: 33.9166666666667px; height: 8px;">
              <div class="income-info">
                <span class="ng-binding">月净收入</span><br>
                <span ng-bind="m.interest | slCurrency" class="ng-binding">0.00元</span>
              </div>
            </a>
          </li><!-- end ngRepeat: m in monthlyIncome -->
          <!--fix tooltip and colmn and text index issue-->
          <div class="sum-number inside-column">
            <h3 class="highlighted-sum">
              <abbr title="" tooltip="=已收利息+已收罚息" tooltip-placement="right" ng-bind-html="summary.interestReceived|slMoney" class="ng-scope ng-binding">0<small>.00元</small></abbr>
            </h3>

            <p class="highlighted-sum-caption">累计净收益</p>
          </div>
        </ul>
      </div>
    </div>
  </div>
  <!-- Estimated Interest Rate -->
  <!--<div class="col-xs-3 simple-summary-section est-interest-rate">-->
  <!--<div class="text-center" ng-show="!gotSummary">-->
  <!--<h4 class="loading-animation summary-loading"><i class="spinner sl-icon-loading"></i> </h4>-->
  <!--</div>-->
  <!--<div class="sum-number" ng-show="gotSummary">-->
  <!--&lt;!&ndash;<h3 class="highlighted-sum">&ndash;&gt;-->
  <!--&lt;!&ndash;<abbr title="" tooltip="基于投资者每月的收益，假定一年都是这个收益水平，折算的年收益率。" tooltip-placement="right">{{summary.averageAnnualizedReturn | percentage:false:true }}<small>%</small></abbr>&ndash;&gt;
  -->
  <!--&lt;!&ndash;</h3>&ndash;&gt;-->
  <!--&lt;!&ndash;<p class="highlighted-sum-caption">平均年化收益率</p>&ndash;&gt;-->
  <!--</div>-->
  <!--</div>-->
  <!-- Balance Sheet -->
  <div class="col-xs-5 simple-summary-section balance-sheet">
    <div class="text-center ng-hide" ng-show="!gotSummary">
      <h4 class="loading-animation summary-loading"><i class="spinner sl-icon-loading"></i></h4>
    </div>
    <div class="sum-number" ng-show="gotSummary">
      <h3 class="highlighted-sum ng-binding" ng-bind-html="summary.availableCash|slMoney">0<small>.00元</small></h3>

      <p class="highlighted-sum-caption">可用余额</p>
      <a class="btn btn-secondary btn-embossed" href="#/transfer?recharge=true"><span class="sl-icon-piggy-bank"></span>充值</a>
    </div>
  </div>
</section>
<section class="summary-section my-asset">
  <!--<div class="pull-right">-->
  <!--你的资产排名-->
  <!--<a href="" class="invest-position">582名<span class="sl-icon-arrow-up"></span></a>-->
  <!--还没有进入排行榜，请再接再厉-->
  <!--<a href="" class="billboard"><span class="sl-icon-dashboard"></span>投资风云榜</a>-->
  <!--</div>-->
  <div class="asset-content">
    <!-- ngIf: gotSummary --><div ng-if="gotSummary" class="ng-scope">
      <div class="asset-chart">
        <div id="asset-chart" data-highcharts-chart="1"><div class="highcharts-container asset-chart-div" id="highcharts-2" style="position: relative; overflow: hidden; width: 300px; height: 300px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helvetica, sans-serif; font-size: 12px;"><svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="300" height="300"><desc>Created with Highcharts 3.0.9</desc><defs><clipPath id="highcharts-3"><rect fill="none" x="0" y="0" width="280" height="275"></rect></clipPath></defs><rect rx="5" ry="5" fill="#FFFFFF" x="0" y="0" width="300" height="300"></rect><g class="highcharts-series-group" zIndex="3"><g class="highcharts-series highcharts-tracker" visibility="visible" zIndex="0.1" transform="translate(10,10) scale(1 1)" style=""><path fill="#ff9311" d="M 139.97403166652887 10.000002644526958 A 127.5 127.5 0 0 1 267.49993625000525 137.37250002125003 L 252.79994360000467 137.38720001880003 A 112.8 112.8 0 0 0 139.9770256626232 24.70000233962857 Z" stroke="#FFFFFF" stroke-width="1" stroke-linejoin="round" transform="translate(0,0)" visibility="visible"></path><path fill="#141d26" d="M 267.5 137.5 A 127.5 127.5 0 0 1 29.645175264213606 201.35971075360314 L 42.368437410221915 193.99706174907007 A 112.8 112.8 0 0 0 252.8 137.5 Z" stroke="#FFFFFF" stroke-width="1" stroke-linejoin="round" transform="translate(0,0)" visibility="visible"></path><path fill="#0dba8f" d="M 29.58137074151101 201.24932401740713 A 127.5 127.5 0 0 1 139.82290505789587 10.000122990720357 L 139.84332306298552 24.700108810613784 A 112.8 112.8 0 0 0 42.31198917366622 193.89940195422372 Z" stroke="#FFFFFF" stroke-width="1" stroke-linejoin="round" transform="translate(0,0)" visibility="visible"></path></g><g class="highcharts-markers" visibility="visible" zIndex="0.1" transform="translate(10,10) scale(1 1)"></g></g><g class="highcharts-legend" zIndex="7"><rect rx="5" ry="5" fill="none" x="0.5" y="0.5" width="7" height="7" stroke="#909090" stroke-width="1" visibility="hidden"></rect><g zIndex="1"><g></g></g></g></svg></div></div>
        <div class="con-top con-top-a loaded" ng-class="{loaded:loaded}">
          <div class="top">
            <span class="text">可用余额</span>
            <span class="value ng-binding" title="0.00元" ng-bind-html="summary.availableCash | slMoney">0<small>.00元</small></span>
          </div>
          <div>
            <a href="/market" class="link">查看热投项目</a>
            <a href="#/auto-invest" class="link">设置自动投标</a>
          </div>
        </div>
        <div class="con-top con-top-b loaded" ng-class="{loaded:loaded}">
          <div class="top">
            <span class="text">冻结金额</span>
            <span class="value ng-binding" title="0.00元" ng-bind-html="summary.inFundingAmount | slMoney">0<small>.00元</small></span>
          </div>
          <div>
            <a href="#/invest-history?sub=bidding" class="link">查看正在投标项目</a>
          </div>
        </div>
        <div class="con-top con-top-c loaded" ng-class="{loaded:loaded}">
          <div class="top">
            <span class="text">待收本金</span>
            <span class="value ng-binding" title="0" ng-bind-html="chartSummary.OutstandingCash.value | slMoney">0<small>.00元</small></span>
          </div>
          <div>
            <a href="#/invest-history" class="link">查看还款列表</a>
          </div>
        </div>

      </div>

      <div id="total-asset" class="total-asset text-center loaded" ng-class="{loaded:loaded}">
        <h3 ng-bind-html="chartSummary.totalAssets|slMoney" class="ng-binding">0<small>.00元</small></h3>
        <h6 class="text">总资产
          <!--<span style="margin-left: 5px" id="total-asset-tip" class="sl-icon-question-dark" data-toggle="tooltip" title="不包括用户取现的冻结金额" data-placement="right"></span>-->
        </h6>
        <a class="btn btn-sm btn-outline-primary view-statistics" href="" data-toggle="modal" data-target="#statisticsModal">投资统计</a>
      </div>
      <div class="date-widget">
        <span class="plans">团团赚</span>

        <div>
          <span>持有</span>
          <span class="periodNumber"><a href="#/group-buyin" class="ng-binding">0期</a></span>
        </div>
       <!-- <div class="apart">
        <div class="plans ">散标投资</div>
        <div>
        <span> 正常 <a href="#/invest-history?notes=normal"><span class="gap current">{{notes.current_count}}</span></a></span>
        </div>
        <div>
        <span>逾期<a href="#/invest-history?notes=late"><span class="gap overdue">{{notes.overdue_count}}</span></a></span>
        </div>
        <div>
        <span>坏账<a href="#/invest-history?notes=bad"><span class="gap bad">{{notes.default_count}}</span></a></span>
        </div>
        </div>-->
      </div>
    </div><!-- end ngIf: gotSummary -->
    <!-- ngIf: !gotSummary -->
  </div>
</section>
<section class="summary-section asset-activity">
  <header class="section-border">
    <!-- Nav tabs -->
    <!--<ul class="nav nav-tabs">
        <li class="active"><a href="#asset-activity" data-toggle="tab">资产动态</a></li>
        <li><a href="#trade-history" data-toggle="tab">交易记录<span>(新回款2笔)</span></a></li>

    </ul>-->
    <!--<a sl-scroll-to href="#/invest-history" class="section-header-action">查看所有投标记录</a>-->
  </header>
  <div class="alert alert-warning text-center ng-binding ng-hide" ng-show="!calLoaded &amp;&amp; !calLoading"></div>
  <div class="text-center ng-hide hidden" ng-class="{hidden:firstLoaded}" ng-show="calLoading">
    <h4 class="loading-animation"><i class="spinner sl-icon-loading"></i></h4>
  </div>
  <!-- Tab panes -->
  <div class="tab-content" ng-class="{invisible:!firstLoaded}">
    <div class="tab-pane active tab-activity" id="asset-activity">
      <!--<div class="text-center" ng-show="!calLoaded">
          <h4 class="loading-animation"><i class="spinner sl-icon-loading"></i> </h4>
      </div>-->
      <div class="row">
        <div class="col-xs-5">
          <div class="row day-events">
            <div class="col-xs-6 no-events" ng-class="{'no-events':selectedDay.events.length == 0}">
              <div class="text-center pager-tool">
                <a class="glyphicon sl-icon-arrow-left left" ng-click="prevEvent()"></a>
                <a class="glyphicon sl-icon-arrow-right right" ng-click="nextEvent()"></a>
              </div>
              <div class="calendar-day-container flip-clock-wrapper pull-left alt" id="calendar-day"><h4>- 无资产活动! -</h4></div>
            </div>

          </div>
          <div id="full-calendar" class="full-calendar fc fc-ltr"><div class="fc-content" style="position: relative;"><div class="fc-view fc-view-month fc-grid" style="position:relative" unselectable="on"><div class="fc-event-container" style="position:absolute;z-index:8;top:0;left:0"></div><table class="fc-border-separate" style="width:100%" cellspacing="0"><thead><tr class="fc-first fc-last"><th class="fc-day-header fc-sun fc-widget-header fc-first" style="width: 43px;">日</th><th class="fc-day-header fc-mon fc-widget-header" style="width: 43px;">一</th><th class="fc-day-header fc-tue fc-widget-header" style="width: 43px;">二</th><th class="fc-day-header fc-wed fc-widget-header" style="width: 43px;">三</th><th class="fc-day-header fc-thu fc-widget-header" style="width: 43px;">四</th><th class="fc-day-header fc-fri fc-widget-header" style="width: 43px;">五</th><th class="fc-day-header fc-sat fc-widget-header fc-last">六</th></tr></thead><tbody><tr class="fc-week fc-first"><td class="fc-day fc-sun fc-widget-content fc-other-month fc-past fc-first" data-date="2014-08-31"><div style="min-height: 33px;"><div class="fc-day-number">31</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-mon fc-widget-content fc-past" data-date="2014-09-01"><div><div class="fc-day-number">1</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-tue fc-widget-content fc-past" data-date="2014-09-02"><div><div class="fc-day-number">2</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-wed fc-widget-content fc-past" data-date="2014-09-03"><div><div class="fc-day-number">3</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-thu fc-widget-content fc-past" data-date="2014-09-04"><div><div class="fc-day-number">4</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-fri fc-widget-content fc-past" data-date="2014-09-05"><div><div class="fc-day-number">5</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-sat fc-widget-content fc-past fc-last" data-date="2014-09-06"><div><div class="fc-day-number">6</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td></tr><tr class="fc-week"><td class="fc-day fc-sun fc-widget-content fc-past fc-first" data-date="2014-09-07"><div style="min-height: 32px;"><div class="fc-day-number">7</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-mon fc-widget-content fc-past" data-date="2014-09-08"><div><div class="fc-day-number">8</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-tue fc-widget-content fc-past" data-date="2014-09-09"><div><div class="fc-day-number">9</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-wed fc-widget-content fc-past" data-date="2014-09-10"><div><div class="fc-day-number">10</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-thu fc-widget-content fc-past" data-date="2014-09-11"><div><div class="fc-day-number">11</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-fri fc-widget-content fc-today fc-state-highlight" data-date="2014-09-12"><div><div class="fc-day-number">12</div><div class="fc-day-content"><div style="position: relative; height: 0px;"><span class="tday">今天</span></div></div></div></td><td class="fc-day fc-sat fc-widget-content fc-future fc-last" data-date="2014-09-13"><div><div class="fc-day-number">13</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td></tr><tr class="fc-week"><td class="fc-day fc-sun fc-widget-content fc-future fc-first" data-date="2014-09-14"><div style="min-height: 32px;"><div class="fc-day-number">14</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-mon fc-widget-content fc-future" data-date="2014-09-15"><div><div class="fc-day-number">15</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-tue fc-widget-content fc-future" data-date="2014-09-16"><div><div class="fc-day-number">16</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-wed fc-widget-content fc-future" data-date="2014-09-17"><div><div class="fc-day-number">17</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-thu fc-widget-content fc-future" data-date="2014-09-18"><div><div class="fc-day-number">18</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-fri fc-widget-content fc-future" data-date="2014-09-19"><div><div class="fc-day-number">19</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-sat fc-widget-content fc-future fc-last" data-date="2014-09-20"><div><div class="fc-day-number">20</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td></tr><tr class="fc-week"><td class="fc-day fc-sun fc-widget-content fc-future fc-first" data-date="2014-09-21"><div style="min-height: 32px;"><div class="fc-day-number">21</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-mon fc-widget-content fc-future" data-date="2014-09-22"><div><div class="fc-day-number">22</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-tue fc-widget-content fc-future" data-date="2014-09-23"><div><div class="fc-day-number">23</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-wed fc-widget-content fc-future" data-date="2014-09-24"><div><div class="fc-day-number">24</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-thu fc-widget-content fc-future" data-date="2014-09-25"><div><div class="fc-day-number">25</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-fri fc-widget-content fc-future" data-date="2014-09-26"><div><div class="fc-day-number">26</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-sat fc-widget-content fc-future fc-last" data-date="2014-09-27"><div><div class="fc-day-number">27</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td></tr><tr class="fc-week"><td class="fc-day fc-sun fc-widget-content fc-future fc-first" data-date="2014-09-28"><div style="min-height: 32px;"><div class="fc-day-number">28</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-mon fc-widget-content fc-future" data-date="2014-09-29"><div><div class="fc-day-number">29</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-tue fc-widget-content fc-future" data-date="2014-09-30"><div><div class="fc-day-number">30</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-wed fc-widget-content fc-other-month fc-future" data-date="2014-10-01"><div><div class="fc-day-number">1</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-thu fc-widget-content fc-other-month fc-future" data-date="2014-10-02"><div><div class="fc-day-number">2</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-fri fc-widget-content fc-other-month fc-future" data-date="2014-10-03"><div><div class="fc-day-number">3</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-sat fc-widget-content fc-other-month fc-future fc-last" data-date="2014-10-04"><div><div class="fc-day-number">4</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td></tr><tr class="fc-week fc-last"><td class="fc-day fc-sun fc-widget-content fc-other-month fc-future fc-first" data-date="2014-10-05"><div style="min-height: 35px;"><div class="fc-day-number">5</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-mon fc-widget-content fc-other-month fc-future" data-date="2014-10-06"><div><div class="fc-day-number">6</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-tue fc-widget-content fc-other-month fc-future" data-date="2014-10-07"><div><div class="fc-day-number">7</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-wed fc-widget-content fc-other-month fc-future" data-date="2014-10-08"><div><div class="fc-day-number">8</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-thu fc-widget-content fc-other-month fc-future" data-date="2014-10-09"><div><div class="fc-day-number">9</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-fri fc-widget-content fc-other-month fc-future" data-date="2014-10-10"><div><div class="fc-day-number">10</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td><td class="fc-day fc-sat fc-widget-content fc-other-month fc-future fc-last" data-date="2014-10-11"><div><div class="fc-day-number">11</div><div class="fc-day-content"><div style="position: relative; height: 0px;">&nbsp;</div></div></div></td></tr></tbody></table></div></div>
          </div>
          <div class="calendar-footer text-center pager-tool">
            <a class="glyphicon glyphicon-chevron-left" ng-click="prevMonth()"></a>
            <span ng-bind="currentDate.year" class="ng-binding">2014</span>
            <span>/</span>
            <span ng-bind="currentDate.month" class="ng-binding">9</span>

            <div class="input-group input-group-sm ng-isolate-scope" sl-popover="calendarPopoverMessage" data-original-title="" title="">
              <span class="input-icon sl-icon-search" ng-class="{focus:calFocus}"></span>
              <input type="text" class="input-sm form-control ng-pristine ng-valid" ng-model="gotoDate" sl-enter="gotoCalendar()" ng-focus="calFocus=true" ng-blur="calFocus=false">
            </div>
            <a class="glyphicon glyphicon-chevron-right" ng-click="nextMonth()"></a>
            <span class="loading-animation common-color ng-hide" ng-show="!calLoaded"><i class="spinner sl-icon-loading"></i> </span>
          </div>
        </div>

        <div class="col-xs-7 rightDetail">
          <div class="space"></div>
          <!--<div class="col-xs-6">-->
          <!--<div class="together"> 团团赚</div>-->
          <!--<div class="alignLeft">-->
          <!--<div class="col-xs-18">预计回款<span>{{totalRecords}}期</span> </div>-->
          <!--<div class="col-xs-18">待收本息-->
          <!--<span>345元</span></div>-->
          <!--&lt;!&ndash;<div class="col-xs-18 second">投资&ndash;&gt;-->
          <!--&lt;!&ndash;<span>2期</span></div>&ndash;&gt;-->
          <!--&lt;!&ndash;<div class="col-xs-18">投资总额<span>6789097589098元</span></div>&ndash;&gt;-->
          <!--</div>-->
          <!--<div>-->
          <!--<a class="view-event-details" href="">查看详情</a>-->
          <!--</div>-->
          <!--</div>-->

          <div class="col-xs-6 ng-hide" ng-hide="normalLoanlength == 0">
            <div class="part">散标投资</div>
            <div class="alignLeft">
              <!-- ngRepeat: category in normalLoanArray | limitTo:3 -->
            </div>
            <div>
              <a class="view-event-details" href="" ng-click="viewEventDay()">查看详情</a>
            </div>
          </div>

          <div class="col-xs-6 ng-hide" ng-hide="virtualLoanLength == 0">
            <div class="part">团团赚</div>
            <div class="alignLeft">
              <!-- ngRepeat: category in virtualLoanArray | limitTo:3 -->
            </div>
            <div>
              <a class="view-event-details" href="#/group-buyin">查看详情</a>
            </div>
          </div>

        </div>
      </div>

      <div class="tab-pane" id="trade-history"><!--work later.......--></div>
    </div>
  </div>
</section>

<div>
  <div class="modal fade" id="statisticsModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close sl-icon-cross" data-dismiss="modal" aria-hidden="true"></button>
          <h4 class="modal-title" id="myModalLabel">投资统计</h4>
        </div>
        <div class="modal-body">
          <div class="statistics-wrapper modal-wrapper">
            <div class="row summary-section section-block fields">
              <ul class="list-unstyled list-inline">
                <li class="statistics-fields">
                  <h4 ng-bind-html="summary.availableCash|slMoney" class="ng-binding">0<small>.00元</small></h4>
                  <h6>账户余额</h6>
                </li>
                <li class="statistics-fields">
                  <h4>
                    <abbr title="" tooltip="=待收本金+可用账户余额+投标中冻结金额" tooltip-placement="bottom" ng-bind-html="chartSummary.totalAssets|slMoney" class="ng-scope ng-binding">0<small>.00元</small></abbr>
                  </h4>
                  <h6>账户总资产</h6>
                </li>
                <li class="statistics-fields">
                  <h4>
                    <abbr title="" tooltip="=已收利息+已收罚金" tooltip-placement="bottom" ng-bind-html="summary.interestReceived|slMoney" class="ng-scope ng-binding">0<small>.00元</small></abbr>
                  </h4>
                  <h6>累计净收益</h6>
                </li>
                <!--<li class="statistics-fields">-->
                <!--<h4>{{summary.averageAnnualizedReturn | percentage:false:true}}<small>%</small></h4>-->
                <!--<h6>年化收益率</h6>-->
                <!--</li>-->
              </ul>
            </div>
            <div class="row summary-section">

              <header class="common-color clearfix">
                <span class="pull-left">账户统计</span>
                <!--<a class="pull-right">输出成Excel</a>-->
              </header>
              <section class="statistics-equation">
                <div class="row">

                </div>

                <table class="table table-hover statistics-table">
                  <thead>
                  <tr>
                    <th class="repayment-table-col-period text-right">名称</th>
                    <th class="repayment-table-col-interests">交易金额</th>
                  </tr>
                  </thead>
                  <tbody class="">
                  <tr>
                    <td class="text-right">待收本金</td>
                    <td ng-bind="summary.outstandingPrincipal | slCurrency" class="ng-binding">0.00元</td>
                  </tr>
                  <tr>
                    <td class="text-right">可用账户余额</td>
                    <td ng-bind="summary.availableCash | slCurrency" class="ng-binding">0.00元</td>
                  </tr>
                  <tr>
                    <td class="text-right">投标中冻结金额</td>
                    <td ng-bind="summary.inFundingAmount | slCurrency" class="ng-binding">0.00元</td>
                  </tr>
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="text-right">净充值本金</td>
                    <td>
                      <abbr title="" tooltip="累计充值-累计取现" tooltip-placement="bottom" ng-bind="summary.retainedPrincipal | slCurrency" class="ng-scope ng-binding">0.00元</abbr>
                    </td>
                  </tr>
                  <tr>
                    <td class="text-right">已收利息</td>
                    <td ng-bind="summary.interestEarned | slCurrency" class="ng-binding">0.00元</td>
                  </tr>
                  <tr>
                    <td class="text-right">已收罚息</td>
                    <td ng-bind="summary.lateFeePending | slCurrency" class="ng-binding">0.00元</td>
                  </tr>
                  <tr>
                    <td class="text-right">累计礼金</td>
                    <td>-</td>
                  </tr>
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="text-right">已收本金</td>
                    <td ng-bind="summary.principalReceived | slCurrency" class="ng-binding">0.00元</td>
                  </tr>
                  <tr>
                    <td class="text-right">累计已投资金额</td>
                    <td ng-bind="summary.principal | slCurrency" class="ng-binding">0.00元</td>
                  </tr>
                  <tr>
                    <td class="text-right">累计充值</td>
                    <td ng-bind="summary.addedFunds | slCurrency" class="ng-binding">0.00元</td>
                  </tr>
                  <tr>
                    <td class="text-right">累计取现</td>
                    <td ng-bind="summary.withdrawFunds | slCurrency" class="ng-binding">0.00元</td>
                  </tr>

                  </tbody>
                </table>
              </section>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="eventDetailsModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close sl-icon-cross" data-dismiss="modal" aria-hidden="true"></button>
          <h5>当日资产动态详情</h5>
        </div>
        <div class="modal-body">
          <div class="row summary-section section-block fields">
            <div class="data-table-wrapper ng-isolate-scope" columns="eventDayColumns" data="eventDayData">
    <table class="table data-table table-hover table-striped ">
        <thead>
            <tr>
                <!-- ngRepeat: a in columns --><th ng-class="a.headerCssClass" ng-repeat="a in columns" class="ng-scope">
                    <span ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}" ng-click="sort(a.sortBy ? a.sortBy : a.field)">
                        <span ng-bind-html="escapeHtml(a.name)" class="ng-binding">日期</span>
                        <span ng-class="{'sl-icon-pointer-down-dark':(a.sortable &amp;&amp; ((params.sortBy!=a.sortBy &amp;&amp; defaultDesc==true)||(params.sortBy==a.sortBy&amp;&amp;params.sortDir=='desc'))),
                                        'sl-icon-pointer-up-dark':a.sortable &amp;&amp;((params.sortBy!=a.sortBy &amp;&amp; defaultDesc==false)|| (params.sortBy==a.sortBy&amp;&amp;params.sortDir == 'asc'))}"></span>
                    </span>
                </th><!-- end ngRepeat: a in columns --><th ng-class="a.headerCssClass" ng-repeat="a in columns" class="ng-scope">
                    <span ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}" ng-click="sort(a.sortBy ? a.sortBy : a.field)">
                        <span ng-bind-html="escapeHtml(a.name)" class="ng-binding">活动名称</span>
                        <span ng-class="{'sl-icon-pointer-down-dark':(a.sortable &amp;&amp; ((params.sortBy!=a.sortBy &amp;&amp; defaultDesc==true)||(params.sortBy==a.sortBy&amp;&amp;params.sortDir=='desc'))),
                                        'sl-icon-pointer-up-dark':a.sortable &amp;&amp;((params.sortBy!=a.sortBy &amp;&amp; defaultDesc==false)|| (params.sortBy==a.sortBy&amp;&amp;params.sortDir == 'asc'))}"></span>
                    </span>
                </th><!-- end ngRepeat: a in columns --><th ng-class="a.headerCssClass" ng-repeat="a in columns" class="ng-scope">
                    <span ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}" ng-click="sort(a.sortBy ? a.sortBy : a.field)">
                        <span ng-bind-html="escapeHtml(a.name)" class="ng-binding">活动描述</span>
                        <span ng-class="{'sl-icon-pointer-down-dark':(a.sortable &amp;&amp; ((params.sortBy!=a.sortBy &amp;&amp; defaultDesc==true)||(params.sortBy==a.sortBy&amp;&amp;params.sortDir=='desc'))),
                                        'sl-icon-pointer-up-dark':a.sortable &amp;&amp;((params.sortBy!=a.sortBy &amp;&amp; defaultDesc==false)|| (params.sortBy==a.sortBy&amp;&amp;params.sortDir == 'asc'))}"></span>
                    </span>
                </th><!-- end ngRepeat: a in columns --><th ng-class="a.headerCssClass" ng-repeat="a in columns" class="ng-scope">
                    <span ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}" ng-click="sort(a.sortBy ? a.sortBy : a.field)">
                        <span ng-bind-html="escapeHtml(a.name)" class="ng-binding">金额</span>
                        <span ng-class="{'sl-icon-pointer-down-dark':(a.sortable &amp;&amp; ((params.sortBy!=a.sortBy &amp;&amp; defaultDesc==true)||(params.sortBy==a.sortBy&amp;&amp;params.sortDir=='desc'))),
                                        'sl-icon-pointer-up-dark':a.sortable &amp;&amp;((params.sortBy!=a.sortBy &amp;&amp; defaultDesc==false)|| (params.sortBy==a.sortBy&amp;&amp;params.sortDir == 'asc'))}"></span>
                    </span>
                </th><!-- end ngRepeat: a in columns --><th ng-class="a.headerCssClass" ng-repeat="a in columns" class="ng-scope">
                    <span ng-class="{'active':params.sortBy==a.sortBy,'sortable':a.sortable}" ng-click="sort(a.sortBy ? a.sortBy : a.field)">
                        <span ng-bind-html="escapeHtml(a.name)" class="ng-binding">贷款详情</span>
                        <span ng-class="{'sl-icon-pointer-down-dark':(a.sortable &amp;&amp; ((params.sortBy!=a.sortBy &amp;&amp; defaultDesc==true)||(params.sortBy==a.sortBy&amp;&amp;params.sortDir=='desc'))),
                                        'sl-icon-pointer-up-dark':a.sortable &amp;&amp;((params.sortBy!=a.sortBy &amp;&amp; defaultDesc==false)|| (params.sortBy==a.sortBy&amp;&amp;params.sortDir == 'asc'))}"></span>
                    </span>
                </th><!-- end ngRepeat: a in columns -->
            </tr>
        </thead>
        <tbody>
            <!-- ngRepeat: b in data track by $index -->
        </tbody>
    </table>
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
