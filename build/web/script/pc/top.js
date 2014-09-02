/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function(){
   $("#logo").click(function(){
       window.location = BaseUrl;
   }); 
   $("#logout_a").click(function(){
       var o = new AjaxOpts("form");
       o.put("service_code", "S20005");
        o.sus = function(data) {
            alert("用户已注销"); 
            location.reload();
        };
        $.ajax(o);
      
   });
});