$(function(){          
   
  
});

function invest_give(invest_id){
   var o = new AjaxOpts("#_person_form_");
               o.put("service_code", "S30043");
               o.put("status","4");
               o.put("invest_id",invest_id);
                o.sus = function(data) {
                    alert("提交成功！");
                    location.reload();
                };
                $.ajax(o);
 }
