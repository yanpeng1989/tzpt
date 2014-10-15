$(function() {
 
    $("#xcz_btn").click(function(){$("#xcz").click();});
    $("#dk_btn").click(function(){$("#cardk").click();});
    
       $("#redio1").click(function(){
        
        $("#dk_xx").slideUp(); 
         
     });
     $("#redio2").click(function(){
        $("#dk_xx").slideDown(); 
         
     });
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
      $("#cardk").change(function(){
         
        previewImage("#cardk", "#dkyl", {
            width: 200
        });
         $("#dk_btn").hide();
        uploadImage("#cardk", {
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
    
      var o = new AjaxOpts("#_person_form_");
      o.put("service_code", "S30011");
      o.sus = function(data) {
         
       
          if(data.status == 0||data.status == 1){
              // window.location.href="/tzpt/pc/p2p/information/tjwarning.do";
            
              $("#xczbh").val(data.car_number);
              $("#name").val(data.name);
              $("#dkbz").val(data.car_loan);
             $("input[name='dkbz'][value='" + data.car_loan + "']").attr("checked", true);
              if(data.car_card_copy!="")
              $("#xczyl").html("<img src='"+data.car_card_copy+"' width='200px'  height='150px'></img>");
              if(data.loan_detail_copy!="")
              $("#dkyl").html("<img src='"+data.loan_detail_copy+"' width='200px'  height='150px'></img>");
             
           }
          if(data.status==2){
              $("#msg").html("您提交的信息没有通过审核，请根据以下提示信息进行修改后再次提交：<br>"+data.rz_msg);
              $("#msg").attr("class","alert alert-danger");
               $("#xczbh").val(data.car_number);
               $("#name").val(data.name);
               $("input[name='dkbz'][value='" + data.car_loan + "']").attr("checked", true);
               if(data.car_card_copy!="")
               $("#xczyl").html("<img src='"+data.car_card_copy+"' width='200px'  height='150px'></img>");
               if(data.loan_detail_copy!="")
               $("#dkyl").html("<img src='"+data.loan_detail_copy+"' width='200px'  height='150px'></img>");
           }
        };
        $.ajax(o);
        
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