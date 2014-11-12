$(function() {
      $("#_person_form_").submit(function() {
         return false;
    });
   function tj() {
        // alert("成功");
        var o = new AjaxOpts("#_person_form_");
        o.put("service_code", "S30038");
        o.put("method","tj");
        o.put("ywlx","person");
        o.sus = function(data) {
            alert("提交成功！");
            $('.function-child-list li', parent.document).eq(1).click();
        };
        $.ajax(o);

    }
    function cx(){
         var o = new AjaxOpts("#_person_form_");
        o.put("service_code", "S30038");
        o.put("method","cx");
        o.put("ywlx","person");
        o.sus = function(data) {
          //   alert(data.result);
            if(data.result==1){
               
                for(var i=1;i<=14;i++){
//                    $("#stat"+i+"_btn").val("修改文件");
                    
                    //  $("#stat"+i+"status").html("已上传");
                    $("#stat"+i+"status").html("已上传");
                }
            }
        };
        $.ajax(o);
         
    }
    cx();
     
    
    $("#stat1_btn").click(function() {
        $("#stat1").click();
    });
    $("#stat2_btn").click(function() {
        $("#stat2").click();
    });
      $("#stat3_btn").click(function() {
        $("#stat3").click();
    });
       $("#stat4_btn").click(function() {
        $("#stat4").click();
    });
       $("#stat5_btn").click(function() {
        $("#stat5").click();
    });
       $("#stat6_btn").click(function() {
        $("#stat6").click();
    });
       $("#stat7_btn").click(function() {
        $("#stat7").click();
    });
       $("#stat8_btn").click(function() {
        $("#stat8").click();
    });
       $("#stat9_btn").click(function() {
        $("#stat9").click();
    });
       $("#stat10_btn").click(function() {
        $("#stat10").click();
    });
       $("#stat11_btn").click(function() {
        $("#stat11").click();
    });
    $("#stat12_btn").click(function() {
        $("#stat12").click();
    });
    $("#stat13_btn").click(function() {
        $("#stat13").click();
    });
    
      $("#_person_submit_btn").click(function(){
          tj(); 
      });
     $("#stat1").change(function() {
        if ($("#stat1") == null)
            return;
        $("#stat1status").html("已上传");
        $("#stat1_btn").hide();
        uploadImage("#stat1", {
            "uploadpath": $("#regid").val() + "-stat1",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });
  });
    $("#stat2").change(function() {
        if ($("#stat2") == null)
            return;
        $("#stat2status").html("已上传");
        $("#stat2_btn").hide();
        uploadImage("#stat2", {
            "uploadpath": $("#regid").val() + "-stat2",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });
  });  
        $("#stat3").change(function() {
        if ($("#stat3") == null)
            return;
       $("#stat3status").html("已上传");
        $("#stat3_btn").hide();
        uploadImage("#stat3", {
            "uploadpath": $("#regid").val() + "-stat3",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });
        });  
          $("#stat4").change(function() {
        if ($("#stat4") == null)
            return;
        $("#stat4status").html("已上传");
        $("#stat4_btn").hide();
        uploadImage("#stat4", {
            "uploadpath": $("#regid").val() + "-stat4",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });
        });  
             $("#stat5").change(function() {
        if ($("#stat5") == null)
            return;
       $("#stat5status").html("已上传");
        $("#stat5_btn").hide();
        uploadImage("#stat5", {
            "uploadpath": $("#regid").val() + "-stat5",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });
        });  
             $("#stat6").change(function() {
        if ($("#stat6") == null)
            return;
        $("#stat6status").html("已上传");
        $("#stat6_btn").hide();
        uploadImage("#stat6", {
            "uploadpath": $("#regid").val() + "-stat6",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });
        });  
         $("#stat7").change(function() {
        if ($("#stat7") == null)
            return;
        $("#stat7status").html("已上传");
        $("#stat7_btn").hide();
        uploadImage("#stat7", {
            "uploadpath": $("#regid").val() + "-stat7",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });
        });  
         $("#stat8").change(function() {
        if ($("#stat8") == null)
            return;
        $("#stat8status").html("已上传");
        $("#stat8_btn").hide();
        uploadImage("#stat8", {
            "uploadpath": $("#regid").val() + "-stat8",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });
        });  
         $("#stat9").change(function() {
        if ($("#stat9") == null)
            return;
        $("#stat9status").html("已上传");
        $("#stat9_btn").hide();
        uploadImage("#stat9", {
            "uploadpath": $("#regid").val() + "-stat9",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });
        });  
         $("#stat10").change(function() {
        if ($("#stat10") == null)
            return;
        $("#stat10status").html("已上传");
        $("#stat10_btn").hide();
        uploadImage("#stat10", {
            "uploadpath": $("#regid").val() + "-stat10",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });
        });  
         $("#stat11").change(function() {
        if ($("#stat11") == null)
            return;
        $("#stat11status").html("已上传");
        $("#stat11_btn").hide();
        uploadImage("#stat11", {
            "uploadpath": $("#regid").val() + "-stat11",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });
        });  
         $("#stat12").change(function() {
        if ($("#stat12") == null)
            return;
        $("#stat12status").html("已上传");
        $("#stat12_btn").hide();
        uploadImage("#stat12", {
            "uploadpath": $("#regid").val() + "-stat12",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });
        });  
         $("#stat13").change(function() {
        if ($("#stat13") == null)
            return;
        $("#stat13status").html("已上传");
        $("#stat13_btn").hide();
        uploadImage("#stat13", {
            "uploadpath": $("#regid").val() + "-stat13",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });
        });  
});