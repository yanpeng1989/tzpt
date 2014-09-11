$(function() {
    $("#byz_btn").click(function(){$("#byz").click();});
     $("#xwz_btn").click(function(){$("#xwz").click();});
   $("#byz").change(function(){
        
        previewImage("#byz", "#byzyl", {
            width: 200
        });
        uploadImage("#byz", {
               "uploadpath": $("#regid").val()+"-byz",
                data:{
                    "imgid": "1"
                },
                "sus": function(data) {
                   // alert("上传成功")
                },
               "service_code": "S30007"
            });  
        
        
    });
    $("#xwz").change(function(){
        previewImage("#xwz", "#xwzyl", {
            width: 200
        });
         uploadImage("#xwz", {
               "uploadpath": $("#regid").val()+"-xwz",
                data:{
                    "imgid": "1"
                },
                "sus": function(data) {
                 //   alert("上传成功")
                },
               "service_code": "S30007"
            });  
    });
    $("#_person_submit_btn").click(function() {
      //  $("#_person_form_").submit();
        /*  var o = new AjaxOpts("#_educatoin_form_");
                o.put("service_code", "S20009");
                o.sus = function(data) {
                    alert("提交成功！");

                };
                $.ajax(o);
        */
    });
});