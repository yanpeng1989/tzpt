/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {
    $("#company_save_btn").click(function() {
        var o = new AjaxOpts("#company_form");
        o.put("service_code", "P41004");
        o.sus = function(data) {
            alert("保存成功");
        };
        $.ajax(o)
    });
});