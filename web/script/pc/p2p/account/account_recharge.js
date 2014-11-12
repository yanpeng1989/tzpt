
$(function() {

    var o = new AjaxOpts("#_recharge_form_");
    o.put("service_code", "S30047");
    o.sus = function(data) {
        //alert(data.custflag);
        if (data.custflag == 0) {
            //alert(11);
            parent.location.href = "/tzpt/pc/register_hf.do";
        } else {

        }
    };
    $.ajax(o);




    $("#_recharge_form_").submit(function() {
        return  false;
    });
    $("#chongzhi_btn").click(function() {
        /*
         var o = new AjaxOpts("#_recharge_form_");
         o.put("service_code", "S30024");
         o.put("method","chongzhi");
         o.sus = function(data) {
         alert("充值成功！");
         };
         $.ajax(o);*/
        callNetSave("S30024", {"custid": $("#custid").val(), "method": "chongzhi", "chongzhi_je": $("#chongzhi_je").val()});
    });
    $("#tixian_btn").click(function() {
        var o = new AjaxOpts("#_recharge_form_");
        o.put("method", "quxian_yz");
        o.put("service_code", "S30024");
        o.sus = function(data) {
            if (data.yzresult === "true") {
                callCash("S30024", {"custid": $("#custid").val(), "method": "quxian", "quxian_je": $("#quxian_je").val()});
            } else {
                alert("余额不足！");
            }
        };
        $.ajax(o);


    });


});
