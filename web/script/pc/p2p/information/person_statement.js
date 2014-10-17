$(function() {
      $("#_person_form_").submit(function() {
         return false;
    });
   function tj() {
        // alert("成功");
        var o = new AjaxOpts("#_person_form_");
        o.put("service_code", "S30006");
        o.sus = function(data) {
            alert("提交成功！");
            $('.function-child-list li', parent.document).eq(1).click();
        };
        $.ajax(o);

    }
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
    
     $("#stat1").change(function() {
        if ($("#stat1") == null)
            return;
        previewImage("#stat1", "#stat1yl", {
            width: 200
        });
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
        previewImage("#stat2", "#stat2yl", {
            width: 200
        });
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
        previewImage("#stat3", "#stat3yl", {
            width: 200
        });
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
        previewImage("#stat4", "#stat4yl", {
            width: 200
        });
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
        previewImage("#stat5", "#stat5yl", {
            width: 200
        });
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
        previewImage("#stat6", "#stat6yl", {
            width: 200
        });
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
});