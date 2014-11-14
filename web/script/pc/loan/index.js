/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//不支持input[type='radio']
function checkFormValIsNull(id) {
    var flag = true;
    $(id).find("input[type='text'],textarea,select").each(function() {
        var val = $(this).val();
        if (!val) {
            var id = $(this).attr("id");
            alert($("div[for='" + id + "']").html() + "不可为空");
            flag = false;
            return flag;
        }
    });
    return flag;
}