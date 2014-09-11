$(function() {
    $("#_person_form_").submit(function() {

        return false;
    })
    
function tj(){
     // alert("成功");
                var o = new AjaxOpts("#_person_form_");
                o.put("service_code", "S30006");
                o.sus = function(data) {
                    alert("提交成功！");

                };
                $.ajax(o);
    
}    
    $("#_person_submit_btn").click(function() {
        uploadImage("#sfzzm", {
            //"uploadpath": "rii/gfd/sdf",
            data: {
                "ss": "1"
            },
            "sus": function(data) {
                
            },
            "service_code": "S20007"
        });
      uploadImage("#sfzfm", {
            //"uploadpath": "rii/gfd/sdf",
            data: {
                "ss": "2"
            },
            "sus": function(data) {
                
            },
            "service_code": "S20007"
        });
        uploadImage("#hkb", {
            //"uploadpath": "rii/gfd/sdf",
            data: {
                "ss": "3"
            },
            "sus": function(data) {
                
            },
            "service_code": "S20007"
        });
        tj();
    });
});