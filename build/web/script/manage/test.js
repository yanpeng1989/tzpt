/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {
    $("#search").click(function() {
        $("#replier_table").cytable({
            "service_code": "S24023",
            "_form": "#search_form"
        });
    });
    $("#search").click();
});