/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {
    $("#contacts_save_btn").click(function() {
        if (checkFormValIsNull("#contacts_form")) {
            var o = new AjaxOpts("#contacts_form");
            o.put("service_code", "P40005");
            o.sus = function(data) {
                var step = "6";
                if ("company" === loanType) {
                    step = "5";
                }
                window.location.href = BaseUrl + "pc/loan/index.do?step=" + step + "&loan_type=" + loanType;
            };
            $.ajax(o);
        }
    });
});