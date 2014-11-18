/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {
    $("div[class='col-sm-4']").attr("class", "col-sm-5");
    $("div[class='col-sm-3']").attr("class", "col-sm-4");
    $("div[class='col-sm-2']").attr("class", "col-sm-3");
    $(".detail-table, .red-title, #p_detail_save_btn, #c_details_save_btn").css({
        "margin-left": "40px"
    });
    $("button").html("保存");
});