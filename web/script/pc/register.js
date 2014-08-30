function _registerModal() {
    $("#_modal_register").modal("toggle");
}


$(function() {
    $("#_register_frame_btn").click(function() {
         var o = new AjaxOpts("#_register_form_");
         if  ($("#_register_pwd").val()!=$("#_register_pwd_again").val()){
             alert("两次输入的密码不一致！请重新输入");
             return;
         }
//        o.put("tel", $("#_login_phone_num").val());
//        o.put("pwd", $("#_login_pwd").val());
//        o.put("yzm", $("#_login_yzm").val());
        o.put("service_code", "S20002");
        o.sus = function(data) {
            alert("注册成功"); 
            $("#_modal_register").modal("toggle");
        };
        $.ajax(o);
    });
});