/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {
    $("#job_save_btn").click(function() {
        var o = new AjaxOpts("#job_form");
        o.put("service_code", "P41003");
        o.sus = function(data) {
            alert("保存成功");
        };
        $.ajax(o)
    });
});