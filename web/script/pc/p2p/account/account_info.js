
$(function() {
          var o = new AjaxOpts("#_find_form_");
          o.put("service_code", "S30012");
          o.sus = function(data) {
            $("#available_assets").attr("value",data.available_assets);
              $("#invested_assets").attr("value",data.invested_assets);
                $("#credit_line").attr("value",data.credit_line);
                  $("#debt_assets").attr("value",data.debt_assets);
                    $("#frozen_assets").attr("value",data.frozen_assets);
                    $("#gold_coin").attr("value",data.gold_coin);
           
        
        };
         $.ajax(o);
});
