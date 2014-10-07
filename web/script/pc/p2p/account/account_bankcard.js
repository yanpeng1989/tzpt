
$(function() {
    
     
       var o = new AjaxOpts("#_card_form_");
       o.put("service_code", "S30015");
       o.put("method", "cx");
      o.sus = function(data) {
           $("#custId").val(data.custId+"");
           if(data.card_number!="")
           {
                $("#pcard").html("<h3>"+data.bank+"</h3><br>"+data.card_number+"&nbsp;&nbsp;&nbsp; ");
                $("#qxbd").show();
           }
        };
        $.ajax(o);
      
      $("#_card_form_").validation(); 
      
    
    $("#qxbd").click(function(){
     var o = new AjaxOpts("#_card_form_");
      o.put("service_code", "S30015");
      o.put("method", "delete");
      o.sus = function(data) {
              location.reload();
        };
        $.ajax(o);
        
        
    });
    $("#_card_form_").submit(function(){
         return false;
    })
     $("#tj").click(function(){
    if (!$("#_card_form_").valid(this)) {
            return false;
        } 
        if($("#khhmc").val()==""){
            alert("请选择开户行");
            return ;false;
        }
      var o = new AjaxOpts("#_card_form_");
      o.put("service_code", "S30015");
      o.put("method", "insert");
      o.sus = function(data) {
              location.reload();
        };
        $.ajax(o);
      })
      $("#addcard").click(function() {
         //  $("#_modal_card").modal("toggle");
         callBindCard("S30022", {"custId":$("#custId").val() });
      });
      
});
