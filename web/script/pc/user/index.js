/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function(){
    $(".funciton-type-item").click(function(){
        var id = $(this).attr("ref");
        $(".funciton-type-item-active").removeClass("funciton-type-item-active");
        $(".function-list-item").hide();
        $(id).show();
        $(this).addClass("funciton-type-item-active");
        $(id + " .function-child-list li").eq(0).click();
    });
    
    $(".function-child-list li").click(function(){
        $(".function-child-item-active").removeClass("function-child-item-active");
        $(this).addClass("function-child-item-active");
        var href = $(this).attr("href");
        if(href) {
            $("#_personal_iframe").attr("src", href);
        }
    });
   
    $(".funciton-type-item").eq(0).click();
     var ywflag=$("#ywflag").val();
     if(ywflag!=0){
          $(".funciton-type-item").eq(0).click();
          $(".function-child-list li").eq(ywflag-1).click();
        
    }
   if( $("#tomenu").val()!==""){
       if($("#tomenu").val()=="accountinfo"){
            //  alert(123);
             
             $(".funciton-type-item").eq(1).click();
             $(".function-child-list li").eq(1).click();
             $("#li_accoutinfo").click();
           
       }else if($("#tomenu").val()=="projectjk"){
             $(".funciton-type-item").eq(2).click();
             $(".function-child-list li").eq(1).click();
             $("#projectjk").click();
           //  $("#li_accoutinfo").click();
       }else if($("#tomenu").val()=="bindcard"){
             $(".funciton-type-item").eq(0).click();
             $(".function-child-list li").eq(2).click();
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
