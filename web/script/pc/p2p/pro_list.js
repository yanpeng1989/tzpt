$(function() {
    $("#top_login_btn").click(function() {
        _loginModal();
    });

    $("#top_register_btn, #foot_register_btn").click(function() {
        _registerModal();
    });
    /* $(".pro_item").mouseover(function(){
     $(this).removeClass('pro_item').addClass('pro_item2');
     $("#ldetail").show();
     });
     $(".pro_item").mouseleave(function(){
     $(this).removeClass('pro_item2').addClass('pro_item');
     $("#ldetail").hide();
     
     });*/
    $(".pro_item").click(function() {
        //  alert($(this).attr('id')+"_detail");
        $("#" + $(this).attr('tag') + "_detail").slideToggle();

    });
    $(".pro_name").click(function() {

    });

    $("#ajax_btn").click(function() {
        $("#ajax_table").cytable({
            "service_code": "S70008",
            "_form": "#ajax_form"
        }).on("rowSelected", function(e, data) {
            alert(JSON.stringify(data));
        });
    });
    $("#ajax_btn").click();
    var nowPage = 1;


});
function invest(id, usrid,ktje) {
    if ($("#regid").val() == "") {
        alert("用户请先登录！");
        return;
    }
    if ($("#regid").val() == usrid) {
        alert("投资人为本人，请选择其他项目！");
        return;
    }

    //var je = prompt("请输入投资金额", "");
     var je=$("#"+id+"tzje").val();
     if(je==""){
         alert("请输入投资金额");return; 
     }
    if (je != null && je != "") {
        
        if(ktje<parseFloat(je)){
            alert("输入金额超过最大可投金额，请重新输入");
        return;
        }
        
        var o = new AjaxOpts("#_person_form_");
        o.put("service_code", "S30035");
        o.put("je",je);
        o.sus = function(data) {
            callInitiativeTender("S30025", {"investid": id, "tzje": je});
        };
        $.ajax(o);

    }

}


