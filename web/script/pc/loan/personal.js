/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {
    $("#personal_save_btn").click(function() {
        if (checkFormValIsNull("#personal_form")) {
            var hyzk = $("input[name='marital_status']:checked").val();
            if (hyzk) {
                var o = new AjaxOpts("#personal_form");
                o.put("marital_status", hyzk);
                o.put("service_code", "P40002");
                o.sus = function(data) {
                    window.location.href = BaseUrl + "pc/loan/index.do?step=3&loan_type=" + loanType;
                };
                $.ajax(o);
            } else {
                alert("婚姻状况不可为空");
            }
        }
    });
});