/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function _initSelectCaseItem(key, value) {
    var div = $("<div/>").addClass("form-group");
    var attrOps = {
        "id": key,
        "name": key,
        "type": "text"
    };
    if (key.substr(0, 1) === "@") {
        attrOps["data-role"] = "date";
    }
    $("<label/>").attr("for", key).appendTo(div).html(value + "：");
    $("<input/>").attr(attrOps).addClass("form-control").appendTo(div);
    return div;
}


$(function() {
    var outObj = eval("(" + outJson + ")");
    if (!outObj) {
        alert("outJson is undefined");
        return;
    }
    var selectCase = outObj["select_case"];
    for (var key in selectCase) {
        var div = _initSelectCaseItem(key, selectCase[key]);
        div.insertBefore("#search");
    }
    var selectShow = outObj["select_show"];
    var selectKey = outObj["select_key"];
    var tr = $("<tr/>").attr("row-key", selectKey).appendTo("#auto_table thead");
    for (var key in selectShow) {
        $("<th/>").appendTo(tr).attr("rel-key", key).html(selectShow[key]);
    }
    
    $("#search").click(function() {
        $("#auto_table").cytable({
            "service_code": "S10002",
            "_form": "#search_form"
        });
    });
    $("#search").click();
});

