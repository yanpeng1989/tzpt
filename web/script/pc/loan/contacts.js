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
                window.location.href = BaseUrl + "pc/loan/index.do?step=6&loan_type=" + loanType;
            };
            $.ajax(o);
        }
    });
});