$(function(){
      var o = new AjaxOpts("#_find_form_");
      o.put("service_code", "S30013");
      o.sus = function(data) {
          
           if(data.ywflag<4){
                alert("请先完善您的个人信息");
                window.location.href="/tzpt/pc/user/index.do";
             
           }
           if(data.baseinfo_status==1){
             
               $("#basestate").attr("class","glyphicon glyphicon-ok-circle");
           }
           if(data.workinfo_status==1){
               
           }
           if(data.cardinfo_status==1){
               
           }
        };
        $.ajax(o);
          $("#_person_form_").submit(function(){
              return false;
          });
  $("#_person_submit_btn").click(function (){
     if($("#sum").val()==""){
         alert("请输入借款金额!");return;
     }
      if($("#paytime").val()==0){
         alert("请选择还款次数!");return;
     }
     if($("input[name='jktype']").val()==""){
         alert("请选择借款类型!");return;
     }
    // alert($("input[name='jktype']").val());
         if($("#title").val()==""){
         alert("请输入借款标题!");return;
     }
      if($("#detail").val()==""){
         alert("请输入借款详情!");return;
     }
      if( isNaN($("#sum").val())){
           alert("借款金额输入不正确"); 
           return;
      }
      var o = new AjaxOpts("#_person_form_");
      o.put("service_code", "S30013");
      o.sus = function(data) {
           alert("借款信息已提交！我们会在3个工作日内完成信息的审核！");
           window.location.href="/tzpt/pc/user/index.do?tomenu=projectjk";
          /* 
          if($("input[name='jktype']").val()==""){
               window.location.href="/tzpt/pc/user/index.do?tomenu=personstat";
           }else if($("input[name='jktype']").val()==""){
               window.location.href="/tzpt/pc/user/index.do?tomenu=companystat";
           }*/
        };
        $.ajax(o);
      
  })
     
});