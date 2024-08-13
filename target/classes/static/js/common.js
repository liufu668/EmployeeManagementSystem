var button_view = {label: '查看详情', id: 'button_view'};
var separtor = {separtor: true};
var COMMON_SUCCESS_CODE = 0;
var COMMON_FAIL_CODE = 1;
function callAjax(url, method, params, headers, callback) {
    var json = {};
    var dt = {};
    dt['params'] = params;
    json['data'] = dt;
    json['url'] = url;
    json['headers'] = headers;
    json['method'] = method;
    var reqContext = JSON.stringify(json);
    $.ajax({
        url:  ctx+"/callAjax",
        type: "post",
        data: "reqContext=" + reqContext,
        dataType: "json",
        success: function (data) {
            callback(data);
        }
    });
}
function form2Json($form) {
    var formObj = $form;
    var JsonObj = "'{";
    var a = formObj.serializeArray();
    var index = 0;
    $.each(a, function () {
        index++;
        JsonObj += "\"" + this.name + "\":\"" + this.value + "\"";
        if (a.length != 1 && a.length != index) {
            JsonObj += ",";
        }
    });
    /*if (document.getElementById("saveCookie").checked) {
     JsonObj += ",\"autologon\":\"" + 1 + "\"";
     } else {
     JsonObj += ",\"autologon\":\"" + 0 + "\"";
     }*/

    JsonObj += "}'";
    return eval(JsonObj);
}

function getCompanyId(colValue, rowData, rowIndex) {
    return '<span title="' + rowData.company_id + '">' + rowData.company_name + '</span>';
}
function getProductId(colValue, rowData, rowIndex) {
    return '<span title="' + rowData.product_id + '">' + rowData.product_name + '</span>';
}
function getModelId(colValue, rowData, rowIndex) {
    return '<span title="' + rowData.model + '">' + rowData.model_name + '</span>';
}
function validate(params, callback) {
    var params = JSON.stringify(params);
    $.ajax({
        url: ctx + "/loginValidate",
        method: "post",
        data: "params=" + params,
        dataType: "json",
        success: function (data) {
            callback(data);
        }
    });
}

function DateToStr2(date) {
    if (!date || date == '') {
        return '';
    }
    var str = "" + date.getFullYear() + "-" + padZero(date.getMonth() + 1) + "-" + padZero(date.getDate()) + "T" + padZero(date.getHours()) + ":" + padZero(date.getMinutes()) + ":" + padZero(date.getSeconds());
    return str;
}

function DateToStr(date) {
    var str = "" + date.getFullYear() + "-" + padZero(date.getMonth() + 1) + "-" + padZero(date.getDate()) + " " + padZero(date.getHours()) + ":" + padZero(date.getMinutes()) + ":" + padZero(date.getSeconds());
    return str;
}

function padZero(num) {
    if (num < 10) {
        return "0" + num;
    } else {
        return num;
    }
}

function checkFax(fax) {
    if (fax == "") {
        return true;
    }
    var reg = new RegExp("0\\d{2,3}-\\d{7,8}");
    return reg.test(fax);
}

function checkTel(tel) {
    if (tel.length == 11 || tel.length == 12) {
        if (tel.charAt(0) == '0' || tel.charAt(0) == '1') {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}

function isEmail(temp) {
    var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if (!myreg.test(temp)) {
        return false;
    } else {
        return true;
    }
}
function isTelephone(temp) {
    var isTel = /^[1][3-8]\d{9}$/;
    if (isTel.test(temp)) return true;
    return false;
}
function isPwd(temp) {
    var Regx = /(?=.*[a-zA-Z])(?=.*[\d])[\w\W]{6,16}|(?=.*[a-zA-Z])(?=.*[-`=\[\];',.\/~!@#$%^&*()_+|\{\}:<>?\\"])[\w\W]{6,16}|(?=.*[\d])(?=.*[-`=\[\];',.\/~!@#$%^&*()_+|\{\}:<>?\\"])[\w\W]{6,16}/;
    if (Regx.test(temp)) return true;
    return false;
}

function isZipName(temp) {
    var Regx = /^[a-zA-Z]{1}[a-zA-Z0-9_\-\.]{1,}$/
    if (Regx.test(temp)) return true;
    return false;
}

function isModel(temp) {
    var Regx = /^[a-zA-Z0-9\-\_\.]{1,}$/
    if (Regx.test(temp)) return true;
    return false;
}
function isCompany(temp) {
    var Regx = /^[A-Za-z0-9]+$/
    if (Regx.test(temp)) return true;
    return false;
}

function isModelName(temp) {
    var Regx = /^[a-zA-Z0-9\u4e00-\u9fa5\(\)/\-\+\.]+$/
    if (Regx.test(temp)) return true;
    return false;
}

function isThirdNameStyle(temp) {
    var Regx = /^[a-zA-Z0-9_\u4e00-\u9fa5\(\)/\-\+\.]+$/
    if (Regx.test(temp)) return true;
    return false;
}

function isThirdStyle(temp) {
    var Regx = /^[a-zA-Z0-9_\(\)/\-\+\.]+$/
    if (Regx.test(temp)) return true;
    return false;
}

function validateUrl(temp) {
    var Regx = /^(https|http|ftp|rtsp|mms):\/\/[a-zA-Z0-9.:\/]+$/;
    if (Regx.test(temp)) return true;
    return false;
}
function isGid(temp) {
    var Regx = /^[A-Za-z0-9]+$/
    if (Regx.test(temp)) return true;
    return false;
}
function isPyKeyWords(temp) {
    var Regx = /^[a-zA-Z0-9\s]{1,}$/
    if (Regx.test(temp)) return true;
    return false;
}

function isProductNum(temp) {
    var Regx = /^(?!0{3})\d{3}$/
    if (Regx.test(temp)) return true;
    return false;
}
function isAppId(temp) {
    var Regx = /^[0-9]*$/
    if (Regx.test(temp)) return true;
    return false;
}
function isPositive(temp) { // 正整数
    var Regx = /^[1-9]\d*$/
    if (Regx.test(temp)) return true;
    return false;
}
function isEnglish(temp) { // 正整数
    var Regx = /^[a-zA-Z]*$/
    if (Regx.test(temp)) return true;
    return false;
}

function isId(temp) {
    var Regx = /^\d{11}$/
    if (Regx.test(temp)) return true;
    return false;
}

function isTempName(temp) {
    var Regx = /^[a-zA-Z]{1}[a-zA-Z0-9_\-\.]{1,}$/
    if (Regx.test(temp)) return true;
    return false;
}

function isIconName(temp) {
    var Regx = /^[a-zA-Z]{1}[a-zA-Z0-9_\-\.]{1,}$/
    if (Regx.test(temp)) return true;
    return false;
}

function isVersion(temp) {
    var Regx = /^[0-9]\.[0-9]\.[0-9]$/
    if (Regx.test(temp)) return true;
    return false;
}

function isROMVersion(temp) {
    var Regx = /^[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}$/
    if (Regx.test(temp)) return true;
    return false;
}

function isImage(temp) {
    var Regx = /\.jpg$|\.jpeg$|\.gif$|\.png$|\.bmp$/i
    if (Regx.test(temp)) return true;
    return false;
}

function isZip(temp) {
    var Regx = /\.zip$/i
    if (Regx.test(temp)) return true;
    return false;
}

function isXML(temp) {
    var Regx = /\.xml$/i
    if (Regx.test(temp)) return true;
    return false;
}

function isProperties(temp) {
    var Regx = /\.properties$/i
    if (Regx.test(temp)) return true;
    return false;
}
function isCSS(temp) {
    var Regx = /\.css$/i
    if (Regx.test(temp)) return true;
    return false;
}

function checkInteger(str) {
    if (str.match(/^[+]?\d*$/) == null) {
        return false;
    } else {
        return true;
    }
}

function check0or1(str) {
    if (str == 0 || str == 1) return true;
    return false;
}

function trim(str) {
    return str.replace(/(^\s*)|(\s*$)/g, "");
}

function isEmpty(str) {
    if (str == undefined || str == "") {
        return true;
    } else {
        return false;
    }
}
function isUsername(username) {
    if (str.match(/^[a-zA-Z0-9\u4e00-\u9fa5]+$/) == null) {
        return false;
    } else {
        return true;
    }
}
function getCompanyAppTitle(colValue, rowData, rowIndex) {
    return '<span title="' + rowData.bussinessCompanyVO.companyId + '">' + (rowData.bussinessCompanyVO.companyName == undefined ? '' : rowData.bussinessCompanyVO.companyName) + '</span>';
}
function getComopanyTitle(colValue, rowData, rowIndex) {
    return '<span title="' + rowData.companyId + '">' + (rowData.companyName == undefined ? '' : rowData.companyName) + '</span>';
}
function getProductTitle(colValue, rowData, rowIndex) {
    return '<span title="' + rowData.productId + '">' + (rowData.productName == undefined ? '' : rowData.productName) + '</span>';
}
function getProductTitleNew(colValue, rowData, rowIndex) {
    return '<span title="' + rowData.bussinessProductVO.productId + '">' + (rowData.bussinessProductVO.productName == undefined ? '' : rowData.bussinessProductVO.productName) + '</span>';
}
function getModelTitle(colValue, rowData, rowIndex) {
    return '<span title="' + rowData.modelId + '">' + (rowData.modelName == undefined ? '' : rowData.modelName) + '</span>';
}
function getAPPTitle(colValue, rowData, rowIndex) {
    var appflag = "APP标识:" + rowData.appId;
    return '<span title="' + appflag + '">' + (rowData.appDesc == undefined ? '' : rowData.appDesc) + '</span>';
}
function getDeviceType(colValue, rowData, rowIndex) {
    var type = rowData.type;
    if (type == '1' || type == '0') {
        return "设备";
    } else if (type == '2' || type == '3') {
        return '网关';
    } else {
        return '';
    }
}
// 获取型号的状态
function getModelStatus(colValue, rowData, rowIndex) {
    var status = rowData.status;
    if (status == 0) {
        return "开发中";
    } else if (status == 1) {
        return '开发完成，待审核';
    } else if (status == 2) {
        return '审核通过';
    } else {
        return '';
    }
}
function getModelType(colValue, rowData, rowIndex) {
    var status = rowData.modelType;
    if (status == 1) {
        return "设备";
    } else if (status == 2) {
        return '网关';
    } else if (status == 3) {
        return '网关配件';
    } else {
        return '';
    }
}
/**
 * 获取当前月的第一天
 */
function getCurrentMonthFirstDay() {
    var myDate = new Date();
    var year = myDate.getFullYear();
    var day = myDate.getDate();
    var month;
    if (day == 1) {
        month = myDate.getMonth();
        if (month == 0) {
            myDate.setDate(1);
            var y = year - 1;
            myDate.setYear(y);
            myDate.setMonth(11);
            month = myDate.getMonth() + 1;
        }
    } else {
        month = myDate.getMonth() + 1;
    }
    if (month < 10) {
        month = "0" + month;
    }
    year = myDate.getFullYear();
    var firstDay = year + "-" + month + "-" + "01";
    return firstDay;
}

/**
 * 获取当前月的最后一天
 */
function getCurrentMonthLastDay() {
    var date = new Date(); //上月日期
    var year = date.getFullYear();
    var month = date.getMonth();
    var new_year = year;    //取当前的年份
    var new_month = month++;//取下一个月的第一天，方便计算（最后一天不固定）
    if (month > 12) {
        new_month -= 12;        //月份减
        new_year++;            //年份增
    }
    var new_date = new Date(new_year, new_month, 1);                //取当年当月中的第一天
    var newDate = new Date(new_date.getTime() - 1000 * 60 * 60 * 24);
    year = newDate.getFullYear();
    month = newDate.getMonth() + 1;
    if (month < 10) {
        month = "0" + month;
    }
    var day = newDate.getDate();
    if (day < 10) {
        day = "0" + day;
    }
    var lastDay = year + "-" + month + "-" + day;
    return lastDay;
}


/**
 * 获取当前日期
 */
function getCurrentDate() {
    var myDate = new Date();
    var year = myDate.getFullYear();
    var month = myDate.getMonth() + 1;
    var day = myDate.getDate();
    if (month < 10) {
        month = "0" + month;
    }
    if (day < 10) {
        day = "0" + day;
    }
    var curentDay = year + "-" + month + "-" + day;
    return curentDay;
}

/**
 * 获取当前日期+时间
 *前天：GetDateStr(-2));
 昨天：GetDateStr(-1));
 今天：GetDateStr(0));
 明天：GetDateStr(1));
 后天：GetDateStr(2));
 大后天：GetDateStr(3));
 */
function getCurrentDateTime(AddDayCount) {
    var myDate = new Date();
    myDate.setDate(myDate.getDate() + AddDayCount);//获取AddDayCount天后的日期
    var year = myDate.getFullYear();
    var month = myDate.getMonth() + 1;
    var day = myDate.getDate();
    var h = myDate.getHours()
    var m = myDate.getMinutes()
    var s = myDate.getSeconds()
    if (month < 10) {
        month = "0" + month;
    }
    if (day < 10) {
        day = "0" + day;
    }
    if (h < 10) {
        h = "0" + h;
    }
    if (m < 10) {
        m = "0" + m;
    }
    if (s < 10) {
        s = "0" + s;
    }
    var curentDay = year + "-" + month + "-" + day + "T" + h + ":" + m + ":" + s;
    return curentDay;
}
/*  获取前天、昨天、今天、后天、大后天日期
 前天：GetDateStr(-2));
 昨天：GetDateStr(-1));
 今天：GetDateStr(0));
 明天：GetDateStr(1));
 后天：GetDateStr(2));
 大后天：GetDateStr(3));
 */
function GetDateStr(AddDayCount,data) {
    var dd;
    if(data){
      dd = new Date(data.getTime());
    }else{
      dd = new Date();
    }
    dd.setDate(dd.getDate() + AddDayCount);//获取AddDayCount天后的日期
    var y = dd.getFullYear();
    var m = dd.getMonth() + 1;
    if (m < 10) {
        m = "0" + m;
    }
    var d = dd.getDate();
    if (d < 10) {
        d = "0" + d;
    }
    return y + "-" + m + "-" + d;

}

var $$ = function (func) {
    if (document.addEventListener) {
        window.addEventListener("load", func, false);
    }
    else if (document.attachEvent) {
        window.attachEvent("onload", func);
    }
}


/*var tabTitles = {'tab_0': '用户管理','tab_1': '个人信息维护', 'tab_2': '厂商管理','tab_3': '产品管理','tab_4': '型号管理','tab_5': 'APP框架资源管理',
 'tab_6': '模板管理', 'tab_7': '国际化文件管理', 'tab_8': '图标管理', 'tab_9': 'zip文件管理', 'tab_10': '订单管理', 'tab_11': '生产批次管理',
 'tab_12': '运营商管理', 'tab_13': '设备激活统计','tab_14': '在线设备分布','tab_15': '固件版本管理','tab_16': '设备属性模板','tab_17': '设备告警模板',
 'tab_18': '网关激活统计','tab_19': '在线设备分布','tab_20': '模块版本管理','tab_21': '官方消息推送','tab_22': '客户资料','tab_23': '设备故障码',
 'tab_24': '设备故障统计报表','tab_25': '设备故障统计分析','tab_26': 'APP设备引导页','tab_27': 'APP添加设备层级','tab_28': 'APP意见反馈','tab_29': '型号意见反馈',
 'tab_30': 'APP首页广告位','tab_31': '厂商App管理','tab_32':'客户联动规则','tab_33':'关键实时数据','tab_34':'用户行为分析','tab_35':'APP语音关键字'};
 var tabUrls = {'tab_0': ctx+'/auth/viewUser','tab_1': ctx+'/auth/editUserInfo', 'tab_2': ctx+'/v1.1/auth/viewCompany','tab_3': ctx+'/auth/viewProduct',
 'tab_4': ctx+'/auth/viewModel','tab_5': ctx+'/auth/viewVersion', 'tab_6': ctx+'/auth/viewTemplate', 'tab_7': ctx+'/auth/viewInternation',
 'tab_8': ctx+'/auth/viewIcon', 'tab_9': ctx+'/auth/viewZipFile', 'tab_10': ctx+'/auth/OrderView', 'tab_11': ctx+'/auth/SequenceNumberView',
 'tab_12': ctx+'/auth/OperatorView', 'tab_13': ctx+'/auth/device', 'tab_14': ctx+'/auth/device/online','tab_15': ctx+'/auth/ota', 'tab_16': ctx+'/auth/v1.1/deviceAttrTemplate/page',
 'tab_17': ctx+'/auth/alerttemplate','tab_18': ctx+'/auth/viewGateway','tab_19': ctx+'/auth/online/highcharts','tab_20': ctx+'/auth/module/view',
 'tab_21': ctx+'/auth/message/view','tab_22': ctx+'/auth/customer/view','tab_23': ctx+'auth/fault/view','tab_24': ctx+'auth/fault/table',
 'tab_25': ctx+'auth/defaultCharts','tab_26':ctx+"auth/deviceintro",'tab_27': ctx+'/auth/viewDeviceTypes','tab_28': ctx+'/auth/viewAppFeedback',
 'tab_29': ctx+'/auth/viewModelFeedback','tab_30':ctx+'/auth/viewAppStartpage','tab_31': ctx+'/auth/companyapp','tab_32': ctx+'/auth/devicerule',
 'tab_33': ctx+'/auth/viewRealTimeData','tab_34': ctx+'/auth/userBehaviorAnalysis','tab_35': ctx+'/auth/viewDeviceVoice'};*/
var tabTitles = {'tab_6': '模板管理', 'tab_7': '国际化文件管理', 'tab_8': '图标管理'};
var tabUrls = {
    'tab_6': ctx+'/auth/viewTemplate', 'tab_7': ctx+'/auth/viewInternation',
    'tab_8': ctx+'/auth/viewIcon'
};
var order_status_max = 3;


//防止ie console报错
var console = console || {
        log: function () {
            // return false;
        }
    }

function gridTimeAdapter(strTime) {
    var date = '', time = '';
    if ((date = strTime.match(/\d{4}-\d{2}-\d{2}/ig)) && (time = strTime.match(/\d{2}:\d{2}:\d{2}/ig))) {
        return date = date.toString() + "&nbsp" + time.toString().substring(0, time.toString().lastIndexOf(":"));
    }
    return ''
}
/**
 *为空处理
 * @param obj
 * @return {*}
 */
function nullStr(obj) {
    if (obj) {
        return obj.toString();
    }
    return "";
}

function logger(obj) {
    if (window.console) {
        window.console.log(obj);
    }
}

/**
 * 模板格式化
 * @param tpl
 * @return {*}
 */
function tplFomatter(tpl) {
    var arg = arguments;
    if (!arg.length)return;
    var _tpl = tpl || arg[0];
    if (arg.length > 1) {
        for (var i = 1; i < arg.length; i++) {
            _tpl = _tpl.replace("{" + (i - 1) + "}", arg[i]);
        }
    }
    return _tpl;
}

function isEqualJson(json1, json2) {
    var strJson1 = JSON.stringify(json1);
    var strJson2 = JSON.stringify(json2);
    return strJson1 === strJson2;
}

$(document).ready(function () {

    if ($("#buttonBar").length && $(".panel-body").length) {
        var ele = document.createElement("div");
        $(".panel-body").append(ele);
        ele.className = "btn-bar-shadow";
    }
    /**
     * operamask-ui omGrid控件钩子
     * @param ele
     * @param options
     */
    var omGrid = function (ele, options) {
        this.$grid = $(ele);
        this.options = options;
        this.options.showIndex = false;
        var flag = true;
        var self = this;
        if (!options.colModel)return;
        for (var i = 0; i < options.colModel.length; i++) {
            var col = options.colModel[i];
            if (col.name == "handler") {
                flag = false;
                break;
            }
        }
        var $btns = $("#buttonBar button");
        var handlerhtml = "";
        for (var j = 0; j < $btns.length; j++) {
            var $btn = $btns.eq(j);
            if ($btn.attr("id").indexOf("add") > -1 || $btn.attr("id").indexOf("batch") > -1) {
                $btn.parents(".om-btn").show();
                continue;
            } else {
                var $omBtn = $btn.parents(".om-btn");
                $omBtn.hide();
                $omBtn.next(".om-buttonbar-sep").hide();
            }
            if($btn.attr("id")){
                handlerhtml += "<button class='btn-link' onclick='javascript:window.setTimeout(function(){$(\"#" + $btn.attr("id") + "\").click();},10);'>" + $btn.text() + "</button>"
            }
        }
        $("#buttonBar").data("handler", handlerhtml);

        if (flag&&handlerhtml!='') {
            this.options.colModel.push({
                header: '操作',
                name: 'handler',
                width: 100,
                align: 'center',
                wrap: true,
                renderer: function () {
                    return $("#buttonBar").data("handler") ? $("#buttonBar").data("handler") : "";
                }
            });
        }
        if (this.options.onRefresh && typeof this.options.onRefresh == 'function') {
            var refreshFun = this.options.onRefresh;
            this.options.onRefresh = function (a, b, c) {
                refreshFun.call(this, a, b, c);
                $('.hDivBox th').show();
                $('*[data-coltoggle]').attr('checked', 'checked');
                self.$grid.omGrid("resize")
            }
        } else {
            this.options.onRefresh = function () {
                $('.hDivBox th').show();
                $('*[data-coltoggle]').attr('checked', 'checked');
                self.$grid.omGrid("resize")
            }
        }

        if ($.fn.oldOmGrid) {
            columnToggle();
            this.$grid.oldOmGrid(this.options);
            $(".btn-bar-shadow").outerHeight(0);
        }
    }

    function Plugin(option) {
        var args = arguments;
        var $this = $(this);
        var data = $this.data('bs.omGrid');
        var options = $.extend({}, $this.data(), typeof option == 'object' && option);
        if (!data) {
            $this.data('bs.omGrid', (data = new omGrid(this, options)));
            return null;
        } else {
            $("*[data-coltoggle]").attr("checked", "checked")
            return $this.oldOmGrid.apply($this, args);
        }
    }

    $.fn.oldOmGrid = $.fn.omGrid;
    $.fn.omGrid = Plugin;
    $.fn.omGrid.Constructor = omGrid;

    /**
     * omGrid初始化扩展，表格列隐藏
     */
    function columnToggle() {
        $.omWidget.addInitListener('om.omGrid', function () {
            var self = this,
                colModel = this._getColModel(),
                colHide_html = "<div class='column-btn'><label class='btn btn-default btn-sm'>筛选列<span class='caret'></span></label><div class='column-toggle dropdown-menu'></div></div>";

            if (!this.hasColumnToggle) {
                $("#buttonBar").append(colHide_html);
                for (var i = 0; i < colModel.length; i++) {
                    var html = "";
                    if (colModel[i].name != "handler") {
                        html = "<label><input type='checkbox' checked='checked' data-coltoggle='" + colModel[i].name + "'>" + colModel[i].header + "</label>";
                    } else {
                        html = "<label><input type='checkbox' disabled='disabled' checked='checked' data-coltoggle='" + colModel[i].name + "'>" + colModel[i].header + "</label>";
                    }
                    $("#buttonBar").find(".column-toggle").append(html);
                }
                $(".column-btn").click(function (event) {
                    event.stopPropagation();
                });
                $(".column-btn>label").toggle(function () {
                    $(".column-toggle").show();
                }, function () {
                    $(".column-toggle").hide();
                });
                $(document).click(function (event) {
                    $('.column-toggle').hide()
                }); //点击空白处隐藏弹出层

                $("[data-coltoggle]").click(function (e) {
                    if ($(this).hasClass("disabled"))return;
                    var id = $(this).attr("data-coltoggle");
                    if (!$(this).is(":checked")) {
                        $(self.thead).find("th[abbr='" + id + "']").hide();
                        $(self.tbody).find("td[abbr='" + id + "']").hide();
                    } else {
                        $(self.thead).find("th[abbr='" + id + "']").show();
                        $(self.tbody).find("td[abbr='" + id + "']").show();
                    }
                    self.resize();
                });
                this.hasColumnToggle = true;
            }
        });
    }

    if ($.validator) {
        $.validator.addMethod("chartLimit", function (value) {
            var reg = /^[\u4e00-\u9fa5a-z0-9_]+$/gi;
            return reg.test(value);
        }, '只许数字英文汉字');
    }
});
//主体内容响应式布局
/*function serResultHeight() {
 var winHeight = $(window).height();
 var o_seaResult = $("#seaResult");
 o_seaResult.height(winHeight - o_seaResult.offset().top- 65);
 }*/

function adaptHeight() {
    var $resizer = $("*[data-height]");
    $resizer.each(function (i) {
        $this = $(this);
        var layoutH = $this.attr("data-height");
        $this.css("height", $(window).height() - layoutH);
    })
}

function validateName(temp) {
    var Regx = /^[a-zA-Z0-9\u4e00-\u9fa5\(\)/\-+_.]+$/;
    if (Regx.test(temp)) return true;
    return false;
}

function validateTitle(temp) {
    var Regx = /^[a-zA-Z0-9\u4e00-\u9fa5\(\)/\-+._/()%!?,:\uff01\uff1f\uff1a\uff0c]+$/;
    if (Regx.test(temp)) return true;
    return false;
}

function validateNameLengths(name, lens) {
    var nameLen = getByteLens(name);
    if (parseInt(nameLen) > lens) {
        return false;
    }
    return true;
}

function getByteLens(val) {
    var len = 0;
    for (var i = 0; i < val.length; i++) {
        var a = val.charAt(i);
        if (a.match(/[^\x00-\xff]/ig) != null) {
            len += 2;
        }
        else {
            len += 1;
        }
    }
    return len;
}





