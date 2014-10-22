$(function(){
   
    
});
 
  function  hk(everyid,loadid,num){
      //alert(everyid);
      //alert(loadid);
      callRepayment("S30032", {"load_every_id": everyid, "load_id":loadid, "TransAmt": "123.00","num":num});
   //  callTransfert("S30040", {"load_every_id": everyid, "load_id":loadid, "TransAmt": "123.00"});     
  }