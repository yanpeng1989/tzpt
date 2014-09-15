 $(function() {
     $("#_find_form_").submit(function(){
         return false;
         
     });
        $("#_mibao_form_").submit(function(){
         return false;
         
     });
       $("#sms_form_").submit(function(){
         return false;
         
     });
     
      
      $("#_zh_btn1").click(function() {
        var o = new AjaxOpts("#_find_form_");
       o.put("tel", $("#_login_phone_num").val());
       o.put("service_code", "S30004");
       o.put("yzfs", "mibao");
       o.sus = function(data) {
              $("#_modal_mibao").modal("toggle");
              
              $("#qu1").val(data.qu1+"");
              $("#qu2").val(data.qu2+"");
              $("#qu3").val(data.qu3+"");
              
            //window.location.href="/tzpt/pc/forget_pwd_reset_mibao.do";
        };
        $.ajax(o);
    });
    $("#_mibaoyz_btn").click(function(){
        
        if($("#newpwd1").val()==""||$("#newpwd2").val()==""){
            alert("请输入新密码");return false;
            
        }
     if($("#newpwd1").val()!=  $("#newpwd2").val()){
           alert("两次输入的密码不一致");return false;
     }
        var o = new AjaxOpts("#_mibao_form_");
       o.put("tel", $("#_login_phone_num").val());
       o.put("service_code", "S30004");
       o.put("resetfs", "mibao");
       o.sus = function(data) {
             alert("密码重置成功 ！");
              $("#_modal_mibao").modal("toggle");
        };
        $.ajax(o);
        
    }); 
     $("#sms_btn").click(function(){
        if($("#smsyzm").val()==""){
              alert("请输入短信验证码");return false;
        }
        if($("#newpwd3").val()==""||$("#newpwd4").val()==""){
            alert("请输入新密码");return false;
            
        }
     if($("#newpwd3").val()!=  $("#newpwd4").val()){
           alert("两次输入的密码不一致");return false;
     }
        var o = new AjaxOpts("#sms_form_");
       o.put("tel", $("#_login_phone_num").val());
       o.put("service_code", "S30004");
       o.put("resetfs", "sms");
       o.sus = function(data) {
             alert("密码重置成功 ！");
              $("#_modal_sms").modal("toggle");
        };
        $.ajax(o);
        
    }); 
    
    
    $("#_zh_btn2").click(function() {
        var o = new AjaxOpts("#_find_form_");
          o.put("tel", $("#_login_phone_num").val());
//        o.put("tel", $("#_login_phone_num").val());
//        o.put("pwd", $("#_login_pwd").val());
//        o.put("yzm", $("#_login_yzm").val());
        o.put("service_code", "S30004");
        o.put("yzfs","sms");
        o.sus = function(data) {
            alert("短信验证码已发送！");
           $("#_modal_sms").modal("toggle");
          // window.location.href="/tzpt/pc/forget_pwd_reset.do";
           
          
        };
        $.ajax(o);
    });
});