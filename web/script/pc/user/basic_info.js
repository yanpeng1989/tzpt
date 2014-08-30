/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function(){
    $("#sfz1_btn").click(function(){$("#sfz_1").click();});
    $("#sfz2_btn").click(function(){$("#sfz_2").click();});
    $("#sfz_1").change(function(){
        previewImage("#sfz_1", "#sfz1_img", {
            width: 200
        });
    });
    $("#sfz_2").change(function(){
        previewImage("#sfz_2", "#sfz2_img", {
            width: 200
        });
    });
});