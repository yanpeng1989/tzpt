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

        <div id="pro_list" class="container"  >
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h5>项目列表</h5>
                    </div>
                    
                    <div class="panel-body">
                        <div class="pro_item container"   >
                            <div class="row">
                            <div class="col-sm-3">
                                <div class="pro_name">
                                 投资项目名称xxxxx
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
                            </div> </div>
                            <div class="panel panel-primary" id="ldetail" style="line-height: 15px; border: 1px solid #ccc; display:none">
                      
                                <ul class="nav nav-pills" role="tablist">
  <li class="active"><a href="#home" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-tags"></span>&nbsp;贷款详情</a></li>
  <li><a href="#profile" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-pencil"></span>&nbsp;审核信息</a></li>
  <li><a href="#messages" role="tab" data-toggle="tab"><span class="glyphicon glyphicon glyphicon-list-alt"></span>&nbsp;还款计划</a></li>
  <li><a href="#settings" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-file"></span>&nbsp;投标记录</a></li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
  <div class="tab-pane active" id="home">
      <ul class="list-group">
  <li class="list-group-item">
      贷款描述<hr>
国内知名资产管理公司优质债权转让，上海TOP3小贷公司100%回购

国内知名资产管理公司对其拥有优质债权打包转让，上海排名前3小额贷款公司对此债权转让100%承诺回购，即如果该债权发生逾期，该小贷公司承诺支付当期所有本金和利息。该打包债权主要包含7个借款：第一位借款人为某影视公司策划总监，借款20万，借款用途为装修；第二位某部队通讯工程师，借款6万，借款用途为装修；第三位上海某知名出租车公司司机，借款5万，借款用途为装修，第四位某国有银行员工，借款5万，借款用途为装修；第五位某传媒集团财务主管，借款15万，借款用途为装修；第六位某国有建材公司职员，借款12万，借款用途为装修；第七位某科技公司法人，借款30万，借款用途扩大经营。
      </li>
     <li class="list-group-item">
         贷款信息<hr>
贷款编号 152457 贷款期限 6个月 贷款类型 商业贷款 还款方式 每月还息,按半... 募标起始日 2014-09-02
</li>
 <li class="list-group-item">
        个人信息<hr>
借款人 ZGZC-TY 性别 女 年龄 39岁 婚姻状况 其他 工作城市 上海 公司行业 金融业 公司规模 1000 人及以上... 公司月营业额 ¥2,000,000.00 现单位工作时间 10年
 </li></ul>
  </div>
  <div class="tab-pane" id="profile">
      <div style="margin-top: 20px;margin-left: 10px; padding-bottom: 30px;">
      <span class="glyphicon glyphicon-ok-circle" style="margin-right: 60px;">营业执照</span>
      <span class="glyphicon glyphicon-remove-circle" style="margin-right: 60px;">身份证认证</span>
      <span class="glyphicon glyphicon-ok-circle" style="margin-right: 60px;">银行账户证明文件</span>
     </div>
  </div>
  <div class="tab-pane" id="messages">
  <table class="table table-striped">
     <tr><td>还款期数</td><td>本期应还利息</td><td>本期应还本金</td><td>本期应还总额</td><td>剩余本金</td></tr>
      <tr><td>0</td><td> </td><td> </td><td> </td><td>390,000.00</td></tr>
       <tr><td>1</td><td>¥3,409.25</td><td>¥0.00</td><td>¥3,409.25</td><td>¥390,000.00</td></tr>
        <tr><td>2</td><td>¥3,409.25</td><td>¥0.00</td><td>¥3,409.25</td><td>¥390,000.00</td></tr>
         <tr><td>3</td><td>¥3,409.25</td><td>¥195,000.00</td><td>¥198,409.25</td><td>¥195,000.00</td></tr>
</table>
  </div>
  <div class="tab-pane" id="settings">
     <div> &nbsp; &nbsp; &nbsp;投标总数：169笔， 投标总额：222,100元</div>
     <br/>
      <table class="table table-striped">
          
      <tr><td>投标人</td><td>投标金额</td><td>投标时间</td></tr>
     <tr><td>m***h</td><td>¥5,000.00</td><td>2014-09-03 23:11</td></tr>
      <tr><td>n***y</td><td>¥1,400.00</td><td>2014-09-03 23:11</td></tr>
      <tr><td>t***s</td><td>¥3,200.00</td><td>2014-09-03 23:11</td></tr>
        <tr><td>n***t</td><td>¥1,400.00</td><td>2014-09-03 23:11</td></tr>
</table>
      
  </div>
</div>
                       </div>
                        </div>
                        <div class="pro_item container" id="pro2"  >
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
                        <div class="pro_item container"  >
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