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
        <div  id="ldetail" style="line-height: 15px;   ">
            <div   id="msg"  role="alert"> 
                <form  id="statusTj" action="<c:url value="/pc/p2p/user_loan_list_frame.do" />" method="post">
                    <div class="input-group" style="width:100%">
                       <div style="margin-left: 10px;margin-top: 0px; margin-bottom: 10px;">
                               <font color="#EB5D68">    <h4>借贷账户</h4> </font>
                        </div>
                  
                    
                       <input type ="text" style="display:none"  id="ivt_status"  name="ivt_status"  value="${out['params']['ivt_status']}">   
                       
                           <!--  <span>投资项目标题：   <input type="text" name="load_title" id="load_title " value="${res['load_title']}">  
                            </span> -->
                        
                    </div>
                </form>    
            </div>
             <table id="pro_list_table" style=" border: 0px; line-height: 10px;">
              <thead>
                            <tr style=" background-color: gainsboro">
                                <th style=" color: gray; width: 160px;">借贷项目编号</th>
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
                                         <a href="#">  <div id="${res['load_id']}_cz"  onclick="showxx(${res['load_id']});" style="color:#EB5D69"> 查看</div></a>
                                     </td>
                                </tr>
                                <tr><td colspan="6">
                                <div class="tab-pane" id="${res['load_id']}_cz_xx" style="display:none">
                                            <iframe  width="100%" height="200px;" frameborder=0 scrolling="yes" src="/tzpt/pc/p2p/user_every_loan.do?load_id=${res['load_id']}"></iframe>
                                
                                        </div>  
                                        
                                    </td></tr>
                            </c:forEach>
                        </tbody>
                    </table>                    
                          
           
      
        </div>
<script>
    function showxx(id){
  //alert($("#"+id+"_cz_xx").css("display"));
  if($("#"+id+"_cz_xx").css("display")=="none"){
       $("#"+id+"_cz_xx").slideDown();
       $("#"+id+"_cz").html("收起");
  }
   else {
       $("#"+id+"_cz_xx").slideUp();
      $("#"+id+"_cz").html("查看");
  }
  
}
</script>
    </body>
</html>

