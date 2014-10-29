/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function(){
   
   
   
     var ywflag=$("#ywflag").val();
     if(ywflag!=0){
          $(".funciton-type-item").eq(0).click();
          $(".sub-menu-item li").eq(ywflag-1).click();
        
    }
   if( $("#tomenu").val()!==""){
       if($("#tomenu").val()=="accountinfo"){
           
             $("#li_accoutinfo").click();
           
       }else if($("#tomenu").val()=="projectjk"){
          
             $("#projectjk").click();
           //  $("#li_accoutinfo").click();
       }else if($("#tomenu").val()=="bindcard"){
          
             $("#li_accoutinfo").click();
       }
    }
    if($("#errMsg").val()!=""){
        if($("#errMsg").val()=="huifuerror"){
            alert("汇付系统交易失败！");
        }else{
        alert($("#errMsg").val());
        }
    }
    
    
 

   
    
});
