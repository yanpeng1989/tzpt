$(function(){
   
    
});
 
  function  hk(everyid,loadid,num){
     //  alert(213123);
       //callRepayment("S30032", {"load_every_id": everyid, "load_id":loadid, "TransAmt": "123.00","num":num});
       var o = new AjaxOpts("#_loan_form");
       o.put("load_every_id", everyid);
       o.put("load_id", loadid);
     // o.put("TransAmt", 123.00);
       o.put("num", num);
       o.put("service_code", "S30032");
       o.sus = function(data) {
          // alert(data.status);
           alert("还款成功!"); 
        };
        $.ajax(o); 
       
  }