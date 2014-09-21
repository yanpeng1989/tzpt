$(function() {
     $("#_person_form_").validation(); 
       var o = new AjaxOpts("#_person_form_");
      o.put("service_code", "S30008");
      o.sus = function(data) {
        /// alert("请先完善您的个人信息");
          //alert("status:"+data.status);
        //  alert("rz_msg:"+data.rz_msg);
           if(data.status==1){
               window.location.href="/tzpt/pc/p2p/information/tjsuccess.do";
           }
          if(data.status==0){
                 window.location.href="/tzpt/pc/p2p/information/tjwarning.do";
           }
          if(data.status==2){
              $("#msg").html("您提交的信息没有通过审核，请根据以下提示信息进行修改后再次提交：<br>"+data.rz_msg);
                $("#msg").attr("class","alert alert-danger");
                $("#company").val(data.company);
                $("#address").val(data.company_address);
                // alert(data.marital_Status);
               $("#department").val(data.department);
                $("#jobtel").val(data.job_tel);
                 $("#jobname").val(data.job_name);
                $("#jobtime").val(data.join_time);
                  $("#property").val(data.company_property);
                $("#industry").val(data.company_industry);
                  $("#scale").val(data.company_scale);
                $("#income").val(data.income);
                 $("#post").val(data.post);
           }
        };
        $.ajax(o);
        
        
    $("#_person_form_").submit(function() {

        return false;
    })
 
    $("#_work_submit_btn").click(function() {
         
         var o = new AjaxOpts("#_person_form_");
                o.put("service_code", "S30008");
               
                o.sus = function(data) {
                  alert("提交成功！");
                   //$(".function-child-list li").eq(3).click();
                    $('.function-child-list li', parent.document).eq(2).click();
                };
                $.ajax(o);
    });
});