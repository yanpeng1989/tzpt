$(function() {
    
     $("#sfzzm_btn").click(function(){$("#sfzzm").click();});
     $("#sfzfm_btn").click(function(){$("#sfzfm").click();});
          $("#hkb_btn").click(function(){$("#hkb").click();});
    $("#_person_form_").submit(function() {

        return false;
    })
      $("#_person_form_").validation(); 
       var o = new AjaxOpts("#_find_form_");
      o.put("service_code", "S30013");
      o.sus = function(data) {
         //  alert("请先完善您的个人信息");
           
           if(data.ywflag>1){
               window.location.href="/tzpt/pc/p2p/information/tjsuccess.do";
           }
            if(data.ywflag==1&&data.tjflag==1){
               window.location.href="/tzpt/pc/p2p/information/tjwarning.do";
           }
        };
        $.ajax(o);
  $("#sfzzm").change(function(){
        
        previewImage("#sfzzm", "#sfzzmyl", {
            width: 200
        });  $("#sfzzm_btn").hide();
        uploadImage("#sfzzm", {
               "uploadpath": $("#regid").val()+"-sfzzm",
                data:{
                    "imgid": "1"
                },
                "sus": function(data) {
                   // alert("上传成功")
                },
               "service_code": "S30007"
            });  
        
        
    });  
      $("#sfzfm").change(function(){
        
        previewImage("#sfzfm", "#sfzfmyl", {
            width: 200
        }); $("#sfzfm_btn").hide();
        uploadImage("#sfzfm", {
               "uploadpath": $("#regid").val()+"-sfzfm",
                data:{
                    "imgid": "1"
                },
                "sus": function(data) {
                   // alert("上传成功")
                },
               "service_code": "S30007"
            });  
        
        
    }); 
          $("#hkb").change(function(){
        
        previewImage("#hkb", "#hkbyl", {
            width: 200
        }); $("#hkb_btn").hide();
        uploadImage("#hkb", {
               "uploadpath": $("#regid").val()+"-hkb",
                data:{
                    "imgid": "1"
                },
                "sus": function(data) {
                   // alert("上传成功")
                },
               "service_code": "S30007"
            });  
        
        
    }); 
        
 
     $("#_person_form_").submit(function(){
         
         return false;
     });
     
function tj(){
     // alert("成功");
                var o = new AjaxOpts("#_person_form_");
                o.put("service_code", "S30006");
                o.sus = function(data) {
                    alert("提交成功！");
                 $('.function-child-list li', parent.document).eq(1).click();
                };
                $.ajax(o);
    
}    
    $("#_person_submit_btn").click(function() {
          if (!$("#_person_form_").valid(this)) {
            return false;
        }
        tj();
    });
});