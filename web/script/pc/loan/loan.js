/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function() {
    $("#save_and_go_on").click(function(e) {
        if(checkFormValIsNull("#loan_form")) {
            var o = new AjaxOpts("#loan_form");
            o.put("service_code", "P40001");
            o.sus = function(data){
                window.location.href = BaseUrl + "pc/loan/index.do?step=2&loan_type=" + loanType;
            };
            $.ajax(o);
        }
    });
});
