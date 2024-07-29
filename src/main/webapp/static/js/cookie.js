/**
 * Created with IntelliJ IDEA.
 * user: administrator
 * Date: 14-8-7
 * Time: 上午9:48
 * To change this template use File | Settings | File Templates.
 */
//新建cookie。
//hours为空字符串时,cookie的生存期至浏览器会话结束。hours为数字0时,建立的是一个失效的cookie,这个cookie会覆盖已经建立过的同名、同path的cookie（如果这个cookie存在）。
function setCookie(name, value, hours, path) {
    var name = escape(name);
    var value = escape(value);
    var expires = new Date();
    expires.setTime(expires.getTime() + hours * 3600000);
    path = path == "" ? "" : ";path=" + path;
    _expires = (typeof hours) == "string" ? "" : ";expires=" + expires.toUTCString();
    document.cookie = name + "=" + value + _expires + path;
}
//获取cookie值
function getCookieValue(name) {
    var name = escape(name);
    //读cookie属性，这将返回文档的所有cookie
    var allcookies = document.cookie;
    //查找名为name的cookie的开始位置
    name += "=";
    var pos = allcookies.indexOf(name);
    //如果找到了具有该名字的cookie，那么提取并使用它的值
    if (pos != -1) {                                             //如果pos值为-1则说明搜索"version="失败
        var start = pos + name.length;                  //cookie值开始的位置
        var end = allcookies.indexOf(";", start);        //从cookie值开始的位置起搜索第一个";"的位置,即cookie值结尾的位置
        if (end == -1) end = allcookies.length;        //如果end值为-1说明cookie列表里只有一个cookie
        var value = allcookies.substring(start, end);  //提取cookie的值
        return unescape(value);                           //对它解码
    }
    else return "";                                             //搜索失败，返回空字符串
}
//删除cookie
function deleteCookie(name, path) {
    var name = escape(name);
    var expires = new Date(0);
    path = path == "" ? "" : ";path=" + path;
    document.cookie = name + "=" + ";expires=" + expires.toUTCString() + path;
}

apiKey = getCookieValue("JWPT_APIKey");
uid = getCookieValue("uid");

function createAuthParam(b) {
    var d = new Date(); //创建一个Date对象
    var localTime = d.getTime();
    var localOffset = 0;//d.getTimezoneOffset()*60000; //获得当地时间偏移的毫秒数
    var utc = localTime + localOffset; //utc即GMT时间
    var timestamp = utc;
    var key = hex_md5(apiKey + timestamp).toLowerCase();
    if (b) {
        return "?uid=" + uid + "&ts=" + timestamp + "&key=" + key+"&JWPT_APIKey="+apiKey;
    } else {
        return "&uid=" + uid + "&ts=" + timestamp + "&key=" + key+"&JWPT_APIKey="+apiKey;
    }
}

$.ajaxSetup({
    beforeSend: function (request, a) {
        var d = new Date(); //创建一个Date对象
        var localTime = d.getTime();
        var localOffset = 0;//d.getTimezoneOffset()*60000; //获得当地时间偏移的毫秒数
        var utc = localTime + localOffset; //utc即GMT时间
        var timestamp = utc;
        var params = "";
        if (a.type != "GET") {
            if (a.data) {
                params = a.data;
            }
        }
        var key = hex_md5(apiKey + timestamp + params).toLowerCase();
        request.setRequestHeader("uid", uid);
        request.setRequestHeader("ts", timestamp);
        request.setRequestHeader("key", key);
        request.setRequestHeader("JWPT_APIKey", apiKey);
        console.log(apiKey);
    },
    cache: false, //关闭AJAX缓存,
    error: function (e) {
        var res = e.responseText;
        if (res.indexOf("code") > -1) {
            var errorCode = e.responseText.match(/\"code\":\d+/ig)[0].split(':')[1];
            if (errorCode == "10430") {
                msg = "该账户在其他地方登陆!";
            } else if (errorCode == "10412") {
                msg = "非法的ts参数!";
            } else {
                msg = "登陆超时!";
            }
            /*top.alert(msg, {
                tit: "提示",
                btnOk: "确定",
                sucFunc: function () {
                    top.location.href = "/";
                }
            })*/
        } else {
            console.log(res);
        }
    }
});
