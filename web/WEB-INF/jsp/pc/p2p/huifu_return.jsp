<%-- 
    Document   : index
    Created on : 2014-7-31, 11:38:53
    Author     : cyss210
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.cysoa.frame.util.GlobalUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <jsp:include page="../head.jsp"></jsp:include>
    <body>
      <div>
         <input type="text" id="returnCode" value="<%=request.getParameter("returnCode")==null?"":(String)request.getParameter("returnCode")%>"/></div>
         <input type="text" id="cmd" value="<%=request.getParameter("cmd")==null?"":(String)request.getParameter("cmd")%>"/></div>
         
    </div>
     <script>
         
          $(function(){
              var returnCode=$("#returnCode").val();
              var cmd=$("#cmd").val();
              
              if(cmd=="NetSave"||cmd=="Cash"){
                  if(cmd=="410"){
                   alert("请先绑定银行卡");  
                   window.location.href="/tzpt/pc/p2p/account/account_bankcard.do";    
                  }else{
                   window.location.href="/tzpt/pc/p2p/account/account_info.do";   
                  }
                 
              }
              
          });
     </script>
    </body>
</html>
