/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function formatMenuData(menus, pid) {
    var childMenus = [];
    for(var i in menus) {
        var item = menus[i];
        item["M_SUPER"] = item["M_SUPER"] || "";
        if (pid === item["M_SUPER"]) {
            item["text"] = item["M_NAME"];
            var tempMenus = formatMenuData(menus, item["M_ID"]);
            if(tempMenus.length > 0)
                item["nodes"] = tempMenus;
            item["tags"] = [item["M_URL"]];
            if(pid === "") {
                item["icon"] = "glyphicon glyphicon-book";
            } else {
                item["icon"] = "glyphicon glyphicon-file";
            }
            childMenus.push(item);
        }
    }
    return childMenus;
};

function initMenu() {
    var o = AjaxOpts("S24004");
    o.sus = function(data) {
        var menus = data.menus;
        $("#left-menu").treeview({data : formatMenuData(menus, "")});
        $("#left-menu").on("nodeSelected", function(event, node){
            var url = node["M_URL"];
            $("#content-frame").attr("src", BaseUrl + "manage/test.do");
        });
    };
    $.ajax(o);
}

function initUI() {
    $("#left-menu").height($(window).height() - 100); 
    $("#content-frame, #right-content").height($("#left-menu").height());
}

$(function() {
    //alert($(window).height() - 50);
    //$("#left-menu, #right-content").height($(window).height() - 100);
    initUI();
    initMenu();
});