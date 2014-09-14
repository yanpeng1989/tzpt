$(function(){
      var o = new AjaxOpts("#_find_form_");
      o.put("service_code", "S30013");
      o.sus = function(data) {
          
           if(data.ywflag<4){
              alert("请先完善您的个人信息");
                window.location.href="/tzpt/pc/user/index.do";
               //    window.location.href="/tzpt/pc/user/index.do?ywflag="+ywflag;
           }
        };
        $.ajax(o);
          $("#_person_form_").submit(function(){
              return false;
          });
  $("#_person_submit_btn").click(function (){
     
      if( isNaN($("#sum").val())){
           alert("借款金额输入不正确");
           return;
      }
      var o = new AjaxOpts("#_person_form_");
      o.put("service_code", "S30013");
      o.sus = function(data) {
           alert("借款信息已提交！我们会在3个工作日内完成信息的审核！");
        };
        $.ajax(o);
      
  })
     
});