<%-- 
    Document   : login
    Created on : 2014-8-17, 17:03:57
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>  
    <div id="_modal_sms" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
      <div style="text-align: center; width: 80%;" class="container">
         <div class="row"  >
          <div style="text-align: center; "  >
                     <h2> 短信找回密码</h2>
               </div>
           
     
             <form name="sms_form_" id="sms_form_">
             <div class="input-group"  style="margin-left:2px;" >
  <span class="input-group-addon">短信验证码</span>
  <input type="text" class="form-control" name="smsyzm" id="smsyzm"     placeholder=""> 
  </div>
               
                   <div class="input-group" style="margin-left:2px;"   >
  <span class="input-group-addon">新密码</span>
  <input type="password" class="form-control" name="newpwd3" id="newpwd3"    placeholder=""> 
  </div>
               
           <div class="input-group"  style="margin-left:2px;" >
  <span class="input-group-addon">确认新密码</span>
  <input type="password" class="form-control" name="newpwd4" id="newpwd4"      placeholder=""> 
  </div>
            <div>
              <button id="sms_btn" style="width: 100%;" class="button button-primary glow">确认</button>
            </div>
              </form>
       
         </div>
        </div>
        </div>
         </div>
         </div>
         
        