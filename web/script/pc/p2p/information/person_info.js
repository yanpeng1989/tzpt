$(function() {
    $('#birthday').datetimepicker({
        language: 'zh-CN',
        format: "yyyymmdd",
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $("#sfzzm_btn").click(function() {
        $("#sfzzm").click();
    });
    $("#sfzfm_btn").click(function() {
        $("#sfzfm").click();
    });
    $("#hkb_btn").click(function() {
        $("#hkb").click();
    });
    $("#_person_form_").submit(function() {
        return false;
    })
    $("#_person_form_").validation();
    var o = new AjaxOpts("#_person_form_");
    o.put("service_code", "S30006");
    o.sus = function(data) {
        /// alert("请先完善您的个人信息");
        //   alert("status:"+data.status);
        //   alert("rz_msg:"+data.rz_msg);
        if (data.status == 1) {
             window.location.href = "/tzpt/pc/p2p/information/tjsuccess.do";
        }
        if (data.status == 0) {
          //  window.location.href = "/tzpt/pc/p2p/information/tjwarning.do";
            $("#sfzmhm").attr("readonly","true");
            $("#truename").attr("readonly","true");
            $("#birthday").val(data.birthday.substring(0, 4) + "-" + data.birthday.substring(4, 6) + "-" + data.birthday.substring(6, 8));
            $("#truename").val(data.name);
            $("#sfzmhm").val(data.id_number);
            $("#birth_address").val(data.birth_address);
            $("#present_address").val(data.present_address);
            $("#education").val(data.education);
            $("#jztime").val(data.time);
            $("#marital_status").val(data.marital_status);
            $("input[name='sex'][value='" + data.sex + "']").attr("checked", true);
            $("#name_1").val(data.name_1);
            $("#name_2").val(data.name_2);
            $("#name_3").val(data.name_3);
            $("#name_2").val(data.name_2);
            $("#tel_1").val(data.tel_1);
            $("#tel_2").val(data.tel_2);
            $("#tel_3").val(data.tel_3);
        }
        if (data.status == 2) {
            $("#msg").html("您提交的信息没有通过审核，请根据以下提示信息进行修改后再次提交：<br>" + data.rz_msg);
            $("#msg").attr("class", "alert alert-danger");
            $("#sfzmhm").attr("readonly","true");
            $("#truename").attr("readonly","true");
            //$("#birthday").val(data.birthday.substring(0, 4) + "-" + data.birthday.substring(4, 6) + "-" + data.birthday.substring(6, 8));
            $("#truename").val(data.name);
            $("#sfzmhm").val(data.id_number);
            $("#birth_address").val(data.birth_address);
            $("#present_address").val(data.present_address);
            $("#education").val(data.education);
            $("#jztime").val(data.time);
            $("#marital_status").val(data.marital_status);
            $("input[name='sex'][value='" + data.sex + "']").attr("checked", true);
            $("#name_1").val(data.name_1);
            $("#name_2").val(data.name_2);
            $("#name_3").val(data.name_3);
            $("#name_2").val(data.name_2);
            $("#tel_1").val(data.tel_1);
            $("#tel_2").val(data.tel_2);
            $("#tel_3").val(data.tel_3);
        }
    };
    $.ajax(o);
    $("#sfzzm").change(function() {
        if ($("#sfzzm") == null)
            return;
        previewImage("#sfzzm", "#sfzzmyl", {
            width: 200
        });
        $("#sfzzm_btn").hide();
        uploadImage("#sfzzm", {
            "uploadpath": $("#regid").val() + "-sfzzm",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });


    });
    $("#sfzfm").change(function() {
        if ($("#sfzfm") == null)
            return;
        previewImage("#sfzfm", "#sfzfmyl", {
            width: 200
        });
        $("#sfzfm_btn").hide();
        uploadImage("#sfzfm", {
            "uploadpath": $("#regid").val() + "-sfzfm",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });


    });
    $("#hkb").change(function() {
        if ($("#hkb") == null)
            return;
        previewImage("#hkb", "#hkbyl", {
            width: 200
        });
        $("#hkb_btn").hide();
        uploadImage("#hkb", {
            "uploadpath": $("#regid").val() + "-hkb",
            data: {
                "imgid": "1"
            },
            "sus": function(data) {
                // alert("上传成功")
            },
            "service_code": "S30007"
        });


    });


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
    $("#_person_submit_btn").click(function() {
        if (!$("#_person_form_").valid(this)) {
            alert(123);
            return false;
        }
        
        else
        tj();
    });
});