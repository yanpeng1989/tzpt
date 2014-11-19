/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {
    function fileOnChange() {
        var name = $(this).attr("name");
        var id = $(this).attr("id");
        $(this).parent().prev().prev().html("<img src='" + BaseUrl + "images/sm-loading.gif' />")
        uploadImage("#" + id, {
            data: {
                "img_tag": name
            },
            "sus": function(data) {
                var url = data["req_url"];
                $("#" + id).attr("req_url", url);
                var par = $("#" + id).parent();
                par.prev().html('<label class="loan-check-img" req_url="' + url + '">查看</label>');
                par.prev().find(".loan-check-img").click(function() {
                    var url = $(this).attr("req_url");
                    if (url) {
//                        $("#loan_img_pre").attr("src", url);
//                        $("#loan_img_modal").modal("show");
                        window.open(url, "_blank");
                    } else {
                    }
                });
                par.prev().prev().html("<font color='green'>上传完成</font>");
                par.empty();
                //$("#" + id).replaceWith('<input id="' + id + '" name="' + name + '" type="file" accept=".jpg,.jpeg,.png" req_url="' + url + '" />');
                $('<input id="' + id + '" name="' + name + '" type="file" accept=".jpg,.jpeg,.png" req_url="' + url + '" />').change(fileOnChange).appendTo(par);
            },
            "service_code": "S41001"
        });
    }
    $(".loan-check-img").click(function() {
        var url = $(this).attr("req_url");
        if (url) {
//            $("#loan_img_pre").attr("src", url);
//            $("#loan_img_modal").modal("show");
            window.open(url, "_blank");
        } else {
        }
    });
    $("input[type='file']").change(fileOnChange);
    $("#c_details_save_btn").click(function() {
        var alertFlag = false;
        $("#id_copy_front,#id_copy_back,#credit_statement,#bank_statement,#job_statement").each(function() {
            var reqUrl = $(this).attr("req_url");
            if (!reqUrl || reqUrl === "") {
                alertFlag = true;
                return;
            }
        });
        if (alertFlag) {
            alert("必填项不可为空");
            return;
        }
        var o = new AjaxOpts("P41005");
        $("input[type='file']").each(function() {
            var reqUrl = $(this).attr("req_url");
            if (reqUrl && $.trim(reqUrl) !== "") {
                o.put($(this).attr("name"), reqUrl);
            }
        });
        o.sus = function(data) {
            alert("保存成功");
        };
        $.ajax(o);
    });
});