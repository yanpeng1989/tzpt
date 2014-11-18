/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function(){
   $("#company_save_btn").click(function() {
        if (checkFormValIsNull("#company_form")) {
            var o = new AjaxOpts("#company_form");
            o.put("service_code", "P40006");
            o.sus = function(data) {
                window.location.href = BaseUrl + "pc/loan/index.do?step=5&loan_type=" + loanType;
            };
            $.ajax(o);
        }
    }); 
});