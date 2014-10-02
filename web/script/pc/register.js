function _registerModal() {
    $("#_modal_register").modal("toggle");
}

$(function() {
    $("#_register_form_").submit(function(){
         return false;
    });
    $("#_register_frame_btn").click(function() {
          if  ($("#_register_pwd").val()!=$("#_register_pwd_again").val()){
             alert("两次输入的密码不一致！请重新输入");
             return;
         }
         var reg_tel=/^1\d{10}$/;
         if(!reg_tel.test($("#_register_phone_num").val())){
             alert("手机号码输入格式有误！");
             return;
         }
         if($("#_register_yzm").val()==""){
             alert("请输入短信验证码！");
              return;
         }
         var reg_email= /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
         if(!reg_email.test($("#_register_email").val())){
             alert("邮箱输入格式有误！");
             return;
         }
         
       //callUserRegister("S30002", {"id" : $("#user_id").val()});
        var o = new AjaxOpts("#_register_form_");
         o.put("service_code", "S30002");
         o.sus = function(data) {
           callUserRegister("S30020", {"id":data.regid ,"email":data.email, "tel":data.tel});
           //  alert("注册成功"); 
           //  location.reload();
        };
        $.ajax(o); 
    });
});