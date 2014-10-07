
$(function() {
       $("#_recharge_form_").submit(function(){
          return  false;
       });
       $("#chongzhi_btn").click(function(){
           /*
          var o = new AjaxOpts("#_recharge_form_");
          o.put("service_code", "S30024");
          o.put("method","chongzhi");
          o.sus = function(data) {
              alert("充值成功！");
         };
         $.ajax(o);*/
        callNetSave("S30024", {"custid":$("#custid").val(),"method":"chongzhi","chongzhi_je":$("#chongzhi_je").val()});
       });
       $("#tixian_btn").click(function(){
          var o = new AjaxOpts("#_recharge_form_");
          o.put("service_code", "S30024");
          o.sus = function(data) {
              alert("提现成功！");
         };
         $.ajax(o);
       });
       
         
});
