 $(function() {
  
    $("#_zh_btn").click(function() {
        var o = new AjaxOpts("#_find_form_");
          o.put("tel", $("#_login_phone_num").val());
//        o.put("tel", $("#_login_phone_num").val());
//        o.put("pwd", $("#_login_pwd").val());
//        o.put("yzm", $("#_login_yzm").val());
        o.put("service_code", "S30004");
        o.sus = function(data) {
            alert("短信验证码已发送！");
            window.location.href="/tzpt/pc/forget_pwd_reset.do";
        };
        $.ajax(o);
    });
});