$(function() {
 
    $("#xcz_btn").click(function(){$("#xcz").click();});
    $("#dk_btn").click(function(){$("#dk").click();});
    $("#xcz").change(function(){
        
        previewImage("#xcz", "#xczyl", {
            width: 200
        });
        $("#xcz_btn").hide();
        uploadImage("#xcz", {
               "uploadpath": $("#regid").val()+"-xcz",
                data:{
                    "imgid": "1"
                },
                "sus": function(data) {
                   // alert("上传成功")
                },
               "service_code": "S30007"
            });  
        
        
    });
      $("#dk").change(function(){
        
        previewImage("#dk", "#dkyl", {
            width: 200
        });
          $("#dk_btn").hide();
        uploadImage("#dk", {
               "uploadpath": $("#regid").val()+"-cardk",
                data:{
                    "imgid": "1"
                },
                "sus": function(data) {
                   // alert("上传成功")
                },
               "service_code": "S30007"
            });  
        
        
    });
    $("#_person_submit_btn").click(function() {
      //  $("#_person_form_").submit();
          var o = new AjaxOpts("#_person_form_");
                o.put("service_code", "S30011");
                o.sus = function(data) {
                    alert("提交成功！");

                };
                $.ajax(o);
      
      
      
    });
});