$(function(){          
   
  
});

function invest_give(invest_id,zrje){
   
    callTransfer("S30043", {"status":5 ,"zrje":zrje, "invest_id":invest_id});
 
    /*
    
   var o = new AjaxOpts("#_person_form_");
               o.put("service_code", "S30043");
               o.put("status","5");
               o.put("zrje",zrje);
               o.put("invest_id",invest_id);
                o.sus = function(data) {
                    alert("投资成功！");
                    location.reload();
                };
                $.ajax(o);
                
      */          
                
 }
