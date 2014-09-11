$(function() {
 
  
    $("#_person_submit_btn").click(function() {
      //  $("#_person_form_").submit();
          var o = new AjaxOpts("#_person_form_");
                o.put("service_code", "S30011");
                o.sus = function(data) {
                    alert("提交成功！");

                };
                $.ajax(o);
      
      
      
    });
});