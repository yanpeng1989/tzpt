$(function(){
    var o = new AjaxOpts("#_mibao_form_");
        o.put("service_code", "S30016");
        o.sus = function(data) {
           
            if(data.qu1!=null){
              $("#qu1").val(data.qu1+"");      $("#qu1").attr("readonly","readonly");
              $("#qu2").val(data.qu2+"");    $("#qu2").attr("readonly","readonly");
              $("#qu3").val(data.qu3+"");    $("#qu3").attr("readonly","readonly");
               $("#an1").val("******");      $("#an1").attr("readonly","readonly");
              $("#an2").val("******");      $("#an2").attr("readonly","readonly");
              $("#an3").val("******");      $("#an3").attr("readonly","readonly");
                $("#_mibao_btn").hide();
            }
        };
        $.ajax(o);
        
        $("#_mibao_form_").submit(function(){
            return false;
            
        });
   $("#_mibao_form_").validation(); 
    $("#_mibao_btn").click(function() {
        if (!$("#_mibao_form_").valid(this)) {
            return false;
        }
        var o = new AjaxOpts("#_mibao_form_");
        o.put("service_code", "S30016");
        o.sus = function(data) {
           
            alert("密保设置成功！");
            window.location.reload();
          //  clearForm("#add_form");
        };
        $.ajax(o);
    });
});