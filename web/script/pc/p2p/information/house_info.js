$(function() {
   $("#fcz_btn").click(function(){$("#fcz").click();});
     $("#fcdk_btn").click(function(){$("#fcdk").click();});
     $("#redio1").click(function(){
        
        $("#dk_xx").slideUp(); 
         
     });
     $("#redio2").click(function(){
        $("#dk_xx").slideDown(); 
         
     });
     
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
      var o = new AjaxOpts("#_person_form_");
      o.put("service_code", "S30010");
      o.sus = function(data) {
         
         
          if(data.status == 0||data.status == 1){
              // window.location.href="/tzpt/pc/p2p/information/tjwarning.do";
              $("#bh").val(data.house_number);
              $("input[name='dkbz'][value='" + data.house_loan + "']").attr("checked", true);
              if(data.house_card_copy!="")
              $("#fczyl").html("<img src='"+data.house_card_copy+"' width='200px'  height='150px'></img>");
              if(data.loan_detail_copy!="")
              $("#fcdkyl").html("<img src='"+data.loan_detail_copy+"' width='200px'  height='150px'></img>");
           }
          if(data.status==2){
              $("#msg").html("您提交的信息没有通过审核，请根据以下提示信息进行修改后再次提交：<br>"+data.rz_msg);
              $("#msg").attr("class","alert alert-danger");
              $("#bh").val(data.house_number);
              $("input[name='dkbz'][value='" + data.house_loan + "']").attr("checked", true);
               if(data.house_card_copy!="")
              $("#fczyl").html("<img src='"+data.house_card_copy+"' width='200px'  height='150px'></img>");
              if(data.loan_detail_copy!="")
              $("#fcdkyl").html("<img src='"+data.loan_detail_copy+"' width='200px'  height='150px'></img>");
           }
        };
        $.ajax(o);
        
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