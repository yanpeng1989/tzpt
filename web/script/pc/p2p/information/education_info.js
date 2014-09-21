$(function() {
    $("#byz_btn").click(function(){$("#byz").click();});
     $("#xwz_btn").click(function(){$("#xwz").click();});
     $("#byz").change(function(){
        
        previewImage("#byz", "#byzyl", {
            width: 200
        });
       $("#byz_btn").hide();
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
        $("#xwz_btn").hide();
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
    
    
      $("#_education_form_").submit(function() {
         return false;
     })
      $("#_education_form_").validation(); 
       var o = new AjaxOpts("#_education_form_");
      o.put("service_code", "S30009");
      o.sus = function(data) {
        /// alert("请先完善您的个人信息");
        //   alert("status:"+data.status);
        //   alert("rz_msg:"+data.rz_msg);
           if(data.status==1){
               window.location.href="/tzpt/pc/p2p/information/tjsuccess.do";
           }
          if(data.status==0){
                 window.location.href="/tzpt/pc/p2p/information/tjwarning.do";
           }
          if(data.status==2){
              $("#msg").html("您提交的信息没有通过审核，请根据以下提示信息进行修改后再次提交：<br>"+data.rz_msg);
              $("#msg").attr("class","alert alert-danger");
              $("#byzbh").val(data.graduation_id);
              $("#xwzbh").val(data.education_id);
        
           }
        };
        $.ajax(o);
    $("#_person_submit_btn").click(function() {
      var o = new AjaxOpts("#_education_form_");
                o.put("service_code", "S30009");
                o.sus = function(data) {
                    alert("提交成功！");
                 $('.function-child-list li', parent.document).eq(4).click();
                };
                $.ajax(o);
    });
});