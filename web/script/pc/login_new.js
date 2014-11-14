function _loginModal() {
    // $("#_modal_login").modal("toggle");
    window.location.href = "/tzpt/pc/login_new.do";
}

$(function () {
//    $("#_login_form_").validation();
    $("#_login_form_").submit(function () {
        return false;
    })
    $("#_login_frame_btn").click(function () {
//        if (!$("#_login_form_").valid(this)) {
//            return false;
//        }
        // alert($("#_login_phone_num").val());
        if ($("#_login_phone_num").val() == "") {
            alert("手机号不可为空")
            return;
        }
         if ($("#_login_pwd").val() == "") {
            alert("密码不可为空")
            return;
        }
         if ($("#yzm").val() == "") {
            alert("验证码不可为空")
            return;
        }
        var o = new AjaxOpts("#_login_form_");
//        o.put("tel", $("#_login_phone_num").val());
//        o.put("pwd", $("#_login_pwd").val());
//        o.put("yzm", $("#_login_yzm").val());
        o.put("service_code", "S30001");
        o.sus = function (data) {

            //    alert("登陆成功！");
            //  $("#_modal_login").modal("toggle");
            //history.go(-1); 
            // location.reload();
            if (data.result)
                location.href = "/tzpt"
        };
        $.ajax(o);
    });
});