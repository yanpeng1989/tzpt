$(function() {
     var o = new AjaxOpts("#_find_form_");
      o.put("service_code", "S30013");
      o.sus = function(data) {
         //  alert("请先完善您的个人信息");
           
           if(data.ywflag>2){
               window.location.href="/tzpt/pc/p2p/information/tjsuccess.do";
           }
            if(data.ywflag==2&&data.tjflag==1){
               window.location.href="/tzpt/pc/p2p/information/tjwarning.do";
           }
        };
        $.ajax(o);
        
        
    $("#_person_form_").submit(function() {

        return false;
    })
 
    $("#_person_submit_btn").click(function() {
         
         var o = new AjaxOpts("#_person_form_");
                o.put("service_code", "S30008");
                o.sus = function(data) {
                  alert("提交成功！");
                   //$(".function-child-list li").eq(3).click();
                    $('.function-child-list li', parent.document).eq(2).click();
                };
                $.ajax(o);
    });
});