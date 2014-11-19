/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {
    $("#contacts_save_btn").click(function() {
        var o = new AjaxOpts("#contacts_form");
        o.put("service_code", "P41007");
        o.sus = function(data) {
            alert("保存成功");
        };
        $.ajax(o)
    });
});