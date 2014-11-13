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
 
 function showxx(id){
  alert($("#"+id+"_cz_xx").css("display"));
  if($("#"+id+"_cz_xx").css("display")=="none"){
       $("#"+id+"_cz_xx").slideDown();
       $("#"+id+"_cz").html("收起");
  }
   else {
       $("#"+id+"_cz_xx").slideUp();
      $("#"+id+"_cz").html("查看");
  }
  
}
  
  
  
});