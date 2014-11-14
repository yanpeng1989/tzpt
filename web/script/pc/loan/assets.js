/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function(){
    $("#assets_save_btn").click(function(){
        if(checkFormValIsNull("#assets_form")) {
            var o = new AjaxOpts("#assets_form");
            o.put("service_code", "P40003");
            o.sus = function(data){
                window.location.href = BaseUrl + "pc/loan/index.do?step=4&loan_type=" + loanType;
            };
            $.ajax(o);
        }
    });
});