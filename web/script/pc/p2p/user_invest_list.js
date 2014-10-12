$(function(){          
  $("#list0").click(function(){
       $("#ivt_status").val("2");
       $("#statusTj").submit();
       
  });
  $("#list1").click(function(){
       $("#ivt_status").val(null);
       $("#statusTj").submit();
  });
  $("#cxsel").val($('#ivt_status').val());
  
});