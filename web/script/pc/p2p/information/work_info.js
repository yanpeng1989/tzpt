$(function() {
    $("#_person_form_").submit(function() {

        return false;
    })
 
    $("#_person_submit_btn").click(function() {
         
         var o = new AjaxOpts("#_person_form_");
                o.put("service_code", "S30008");
                o.sus = function(data) {
                    alert("提交成功！");

                };
                $.ajax(o);
    });
});