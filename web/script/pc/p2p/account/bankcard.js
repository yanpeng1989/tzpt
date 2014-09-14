
$(function(){
    alert(1);
$("#tj").click(function(){
          
      alert(123);
      var o = new AjaxOpts("#_card_form_");
      o.put("service_code", "S30015");
      o.sus = function(data) {
           alert("提交成功");
         
        };
        $.ajax(o);
      })
        
});