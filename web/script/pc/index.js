/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var adList = [
"/tzpt/images/pc/banner1.jpg",
"/tzpt/images/pc/banner2.jpg",
"/tzpt/images/pc/banner1.jpg"
];
var adIndex = 0;
var adInterval;

function setNowAdImg(index) {
    $(".ad-img").eq(adIndex).fadeOut(800);
    adIndex = index;
    $(".ad-img").eq(adIndex).fadeIn(1200, function() {
        $("#page_ul li").removeClass("page-item-active");
        $("#page_ul li").eq(adIndex).addClass("page-item-active");
    });
}

function startSwitchAdImg() {
    adInterval = setInterval(function() {
        $(".ad-img").eq(adIndex).fadeOut(800);
        adIndex++;
        if (adIndex >= adList.length) {
            adIndex = 0;
        }
        $(".ad-img").eq(adIndex).fadeIn(1200, function() {
            $("#page_ul li").removeClass("page-item-active");
            $("#page_ul li").eq(adIndex).addClass("page-item-active");
        });
    }, 5000);
}

$(function() {
    $("#top_login_btn").click(function(){
        _loginModal();
    });
    
    $("#top_register_btn, #foot_register_btn").click(function(){
        _registerModal();
    });
    
    var adUl = $("<ul/>").attr({
        id: "page_ul"
    }).css({
        "z-index": 999
    }).appendTo("#ad_list");
    for (var i in adList) {
        var src = adList[i];
        $("<img />").attr({
            "src": src,
            "width": "100%",
            "height": "100%",
            "tag": i
        }).css({
            "z-index": adList.length - i,
            "display": "block"
            }).addClass("ad-img").appendTo("#ad_list");
        var li = $("<li />").attr("tag", i).appendTo(adUl).addClass("page-item");
        if (i == adIndex) {
            li.addClass("page-item-active");
        }
        li.click(function() {
            var tag = $(this).attr("tag");
            if(tag == adIndex) {
                return;
            }
            setNowAdImg(tag);
            clearInterval(adInterval);
            startSwitchAdImg();
        });
    }
    startSwitchAdImg();
    

});


