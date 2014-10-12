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

        <div class="row" style="margin-left: 20px;">
        <div class="span8">
     <div class="panel panel-primary" id="ldetail" style="line-height: 15px; border: 1px solid #ccc; ">
    <div class="tab-pane" id="messages">
                                        <table class="table table-striped">
                                            <tr><td>还款期数</td><td>本期应还利息</td><td>本期应还本金</td><td>本期应还总额</td><td>剩余本金</td><td> </td></tr>
                                            <tr><td>0</td><td> </td><td> </td><td> </td><td>390,000.00</td><td> </td></tr>
                                            <tr><td>1</td><td>¥3,409.25</td><td>¥0.00</td><td>¥3,409.25</td><td>¥390,000.00</td><td><input type="button" value="还款"></td></tr>
                                            <tr><td>2</td><td>¥3,409.25</td><td>¥0.00</td><td>¥3,409.25</td><td>¥390,000.00</td><td><input type="button" value="还款"></td></tr>
                                            <tr><td>3</td><td>¥3,409.25</td><td>¥195,000.00</td><td>¥198,409.25</td><td>¥195,000.00</td><td><input type="button" value="还款"></td></tr>
                                        </table>
                                    </div>
    </div>
   </div>
        </div>


    </body>
</html>

 