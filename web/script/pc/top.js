/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function(){
   $("#logo_img").click(function(){
       window.location = BaseUrl;
   }); 
   $("#logout_a").click(function(){
       var o = new AjaxOpts("form");
       o.put("service_code", "S30005");
        o.sus = function(data) {
          //  alert("用户已注销"); 
            window.location.href="/tzpt";
        };
        $.ajax(o);
      
   });
});