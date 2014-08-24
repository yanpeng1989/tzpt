function _loginModal() {
    $("#_modal_login").modal("toggle");
}

$(function() {
    $("#_login_frame_btn").click(function() {
        var o = new AjaxOpts("#_login_form_");
//        o.put("tel", $("#_login_phone_num").val());
//        o.put("pwd", $("#_login_pwd").val());
//        o.put("yzm", $("#_login_yzm").val());
        o.put("service_code", "S20001");
        o.sus = function(data) {
            alert("成功");
        };
        $.ajax(o);
    });
});