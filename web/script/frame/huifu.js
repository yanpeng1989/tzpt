/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var HFURL = BaseUrl + "hftx/exec/"

var HFINTER_URL = "http://mertest.chinapnr.com/muser/publicRequests"

var HFFORM_TAG = "__hf_Form";

function createForm(obj) {
    var form = $("<form/>").attr({
        "id": HFFORM_TAG,
        "method": "post",
        "action": HFINTER_URL
    }).appendTo("body");
    for (var key in obj) {
        $("<input/>").attr({
            "name": key,
            "type": "hidden",
            "value": obj[key]
        }).appendTo(form);
    }
    return form;
}

function createUrl(url, data) {
    if (!data) {
        return url;
    }
    var str = "";
    for (var key in data) {
        str += key + "=" + data[key] + "&";
    }
    url += "&" + str;
    return url;
}

function callUserRegister(serviceCode, data) {
    //window.open(HFURL + "UserRegister.do?service_code=" + serviceCode + "&resid=" + getUniqueCode());
    var url = HFURL + "UserRegister.do?service_code=" + serviceCode + "&resid=" + getUniqueCode();
    url = createUrl(url, data);
    $.get(
            url,
            function(data) {
                var obj = eval("(" + data + ")");
                var form = createForm(obj);
                form.submit();
            }
    );
}

function callBindCard(serviceCode, data) {
    var url = HFURL + "UserBindCard.do?service_code=" + serviceCode + "&resid=" + getUniqueCode();
    url = createUrl(url, data);
    $.get(
            url,
            function(data) {
                var obj = eval("(" + data + ")");
                var form = createForm(obj);
                form.submit();
            }
    );
}

function callUserLogin(serviceCode, data) {
    var url = HFURL + "UserLogin.do?service_code=" + serviceCode + "&resid=" + getUniqueCode();
    url = createUrl(url, data);
    $.get(
            url,
            function(data) {
                var obj = eval("(" + data + ")");
                var form = createForm(obj);
                form.submit();
            }
    );
}

function callNetSave(serviceCode, data) {
    var url = HFURL + "NetSave.do?service_code=" + serviceCode + "&resid=" + getUniqueCode();
    url = createUrl(url, data);
    $.get(
            url,
            function(data) {
                var obj = eval("(" + data + ")");
                var form = createForm(obj);
                form.submit();
            }
    );
}

function callInitiativeTender(serviceCode, data) {
    var url = HFURL + "InitiativeTender.do?service_code=" + serviceCode + "&resid=" + getUniqueCode();
    url = createUrl(url, data);
    $.get(
            url,
            function(data) {
                var obj = eval("(" + data + ")");
                var form = createForm(obj);
                form.submit();
            }
    );
}

function callLoans(serviceCode, data) {
    var url = HFURL + "Loans.do?service_code=" + serviceCode + "&resid=" + getUniqueCode();
    url = createUrl(url, data);
    $.get(
            url,
            function(data) {
                var obj = eval("(" + data + ")");
                var form = createForm(obj);
                form.submit();
            }
    );
}

function callRepayment(serviceCode, data) {
    var url = HFURL + "Repayment.do?service_code=" + serviceCode + "&resid=" + getUniqueCode();
    url = createUrl(url, data);
    $.get(
            url,
            function(data) {
                var obj = eval("(" + data + ")");
                var form = createForm(obj);
                form.submit();
            }
    );
}

function callTransfer(serviceCode, data) {
    var url = HFURL + "Transfer.do?service_code=" + serviceCode + "&resid=" + getUniqueCode();
    url = createUrl(url, data);
    $.get(
            url,
            function(data) {
                var obj = eval("(" + data + ")");
                var form = createForm(obj);
                form.submit();
            }
    );
}

function callCash(serviceCode, data) {
    var url = HFURL + "Cash.do?service_code=" + serviceCode + "&resid=" + getUniqueCode();
    url = createUrl(url, data);
    $.get(
            url,
            function(data) {
                var obj = eval("(" + data + ")");
                var form = createForm(obj);
                form.submit();
            }
    );
}

function callCreditAssign(serviceCode, data) {
    var url = HFURL + "CreditAssign.do?service_code=" + serviceCode + "&resid=" + getUniqueCode();
    url = createUrl(url, data);
    $.get(
            url,
            function(data) {
                var obj = eval("(" + data + ")");
                var form = createForm(obj);
                form.submit();
            }
    );
}