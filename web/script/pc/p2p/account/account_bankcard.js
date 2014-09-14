
$(function() {
       var o = new AjaxOpts("#_card_form_");
      o.put("service_code", "S30015");
       o.put("method", "cx");
      o.sus = function(data) {
           if(data.card_number!="")
           {
               
                $("#pcard").html("<h3>"+data.bank+"</h3><br>"+data.card_number);
           }
        };
        $.ajax(o);
      
     
    
      $("#tj").click(function(){
           
      var o = new AjaxOpts("#_card_form_");
      o.put("service_code", "S30015");
      o.put("method", "insert");
      o.sus = function(data) {
              location.reload();
        };
        $.ajax(o);
      })
      $("#addcard").click(function() {
        $("#_modal_card").modal("toggle");
      });
      
});
