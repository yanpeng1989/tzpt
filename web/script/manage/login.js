/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(function() {
    $(".alert").alert();
    $("#checknum_img").click(function() {
        $(this).attr("src", $(this).attr("src"));
    });
    $("form").validation();
    $("#sub").click(function() {
        if (!$("form").valid(this)) {
            return false;
        }
        var o = new AjaxOpts("form");
        o.put("service_code", "P11000");
        o.sus = function(data) {
            window.location = BaseUrl + "manage/welcome.do"
        };
        $.ajax(o);
    });
});

