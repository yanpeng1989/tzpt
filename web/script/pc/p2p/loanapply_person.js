$(function(){
      var o = new AjaxOpts("#_find_form_");
      o.put("service_code", "S30013");
      o.sus = function(data) {
           alert("请先完善您的个人信息");
           if(data.ywflag!=5){
                //alert(data.tjflag);
                window.location.href="/tzpt/pc/user/index.do";
               //    window.location.href="/tzpt/pc/user/index.do?ywflag="+ywflag;
           }
        };
        $.ajax(o);
   
     
});