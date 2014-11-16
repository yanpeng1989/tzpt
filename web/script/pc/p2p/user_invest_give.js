$(function(){          
   
  
});

function invest_give(invest_id,zrje){
    /*if(zrje==""){
        alert("请输入转让金额！");
        return;
    }*/
   var o = new AjaxOpts("#_person_form_");
               o.put("service_code", "S30043");
               o.put("status","4");
               o.put("invest_id",invest_id);
               o.put("zrje",zrje);
                o.sus = function(data) {
                    alert("提交成功！");
                    location.reload();
                };
                $.ajax(o);
 }
