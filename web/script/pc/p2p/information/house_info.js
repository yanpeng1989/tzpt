$(function() {
   $("#fcz_btn").click(function(){$("#fcz").click();});
     $("#fcdk_btn").click(function(){$("#fcdk").click();});
   $("#fcz").change(function(){
        
        previewImage("#fcz", "#fczyl", {
            width: 200
        });
       $("#fcz_btn").hide();
        uploadImage("#fcz", {
               "uploadpath": $("#regid").val()+"-fcz",
                data:{
                    "imgid": "1"
                },
                "sus": function(data) {
                   // alert("上传成功")
                },
               "service_code": "S30007"
            });  
        
        
    });
    $("#fcdk").change(function(){
        previewImage("#fcdk", "#fcdkyl", {
            width: 200
        });
        $("#fcdk_btn").hide();
         uploadImage("#fcdk", {
               "uploadpath": $("#regid").val()+"-fcdk",
                data:{
                    "imgid": "1"
                },
                "sus": function(data) {
                 //   alert("上传成功")
                },
               "service_code": "S30007"
            });  
    });
  
    $("#_person_form_").submit(function(){
        return false;
        
    });  
    
    $("#_person_submit_btn").click(function() {
      //  $("#_person_form_").submit();
          var o = new AjaxOpts("#_person_form_");
                o.put("service_code", "S30010");
                o.sus = function(data) {
                    alert("提交成功！");

                };
                $.ajax(o);
      
      
      
    });
});