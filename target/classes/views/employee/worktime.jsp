<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="../common/taglibs.jsp" %>

<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%@ include file="../common/meta.jsp" %>
</head>
<body>

<div class="layui-row">
    <form class="layui-form" action="" lay-filter="workSearchForm">
        <div class="layui-col-md10">
            <div class="grid-demo layui-col-md3">
                <div class="layui-form-item">
                    <label class="layui-form-label">打卡人员</label>
                    <div class="layui-input-block">
                        <select name="dept" lay-filter="dept" id="searchDept" class="dept">
                            <option value="">选择部门</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="grid-demo layui-col-md3">
                <div class="layui-form-item">
                    <label class="layui-form-label">选择员工</label>
                    <div class="layui-input-block">
                        <select name="employeeId" lay-filter="employee" id="employee" class="employee">
                            <option value="">选择员工</option>
                        </select>
                    </div>
                </div>
            </div>
            <div  class="grid-demo layui-col-md3">
                <div class="layui-form-item">
                    <label class="layui-form-label">打卡时间</label>
                    <div class="layui-input-block">
                    <input type="date" name="checkTime" id="checkTimeSearch" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>

            <div class="grid-demo layui-col-md1">
                <div class="grid-demo layui-layout-right">
                    <button type="button" class="layui-btn layui-btn-normal "  data-method="search" id="searchBtn">查询</button>
                </div>
            </div>
        </div>
    </form>
</div>
<div class="layui-btn-group layui-row" id="btn_group">
    <button type="button" class="layui-btn" data-method="imitateCheck">模拟打卡</button>
</div>
<table class="layui-hide" id="worktime"></table>
</body>
<div style="display: none" id="imitateCheck">
    <form class="layui-form" action="" lay-filter="imitateCheckForm" id="imitateCheckForm">
        <div class="layui-form-item">
            <label class="layui-form-label">部门</label>
            <div class="layui-input-block">
                <select name="dept" lay-filter="dept"  class="dept" id="imitateDept">
                    <option value="">选择部门</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">员工</label>
            <div class="layui-input-block">
                <select name="employeeId"lay-filter="employee" class="employeeImitate">
                    <option value="">选择员工</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">打卡状态</label>
            <div class="layui-input-block">
                <select name="status" lay-filter="status">
                    <option value="0">正常</option>
                    <option value="1">迟到</option>
                    <option value="2">早退</option>
                    <option value="3">外勤</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">打卡类型</label>
            <div class="layui-input-block">
                <select name="checkType" lay-filter="checkType">
                    <option value="0">上班</option>
                    <option value="1">下班</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">打卡时间</label>
            <div class="layui-input-inline">
                <input type="text" name="checkTime" lay-verify="date" id="checkTime" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div>
    </form>
</div>
<script>
    layui.use(['table','layer','form','laydate'], function() {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.$;
        var form = layui.form;
        var laydate = layui.laydate;

        var dept = {};

        //日期
        laydate.render({
            elem: '#checkTime'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#checkTimeSearch'
            ,type: 'date'
        });
        $.ajax({
            url: "/dept/list",
            type: "POST",
            data: JSON.stringify(dept),//传递json类型的参数
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                if (result.code == COMMON_SUCCESS_CODE) {
                    $.each(result.data, function (index, item) {
                        $('.dept').append(new Option(item.deptname, item.id));//往下拉菜单里添加元素
                    })
                    form.render();//菜单渲染 把内容加载进去
                } else {
                    layer.alert('获取部门信息失败', {icon: 2});
                }
            }
        });
        form.on('select(dept)', function(data){
            console.log(data.elem); //得到select原始DOM对象
            console.log(data.value); //得到被选中的值
            console.log(data.othis); //得到美化后的DOM对象
            var selectdept = data.elem;


            if(data.value != null){
                var employee={};
                employee.dept = data.value;
                $.ajax({
                    url: "/employee/searchAll",
                    type: "POST",
                    data: JSON.stringify(employee),//传递json类型的参数
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        if (result.code == COMMON_SUCCESS_CODE) {
                            if(selectdept.id == 'searchDept'){
                                $(".employee option:gt(0)").remove();
                                $.each(result.data, function (index, item) {
                                    $('.employee').append(new Option(item.emName, item.id));//往下拉菜单里添加元素
                                })
                            }else{
                                $(".employeeImitate option:gt(0)").remove();
                                $.each(result.data, function (index, item) {
                                    $('.employeeImitate').append(new Option(item.emName, item.id));//往下拉菜单里添加元素
                                })
                            }
                            form.render();//菜单渲染 把内容加载进去
                        } else {
                            layer.alert('获取信息失败', {icon: 2});
                        }
                    }
                });
            }
        });
        function layerForm(){
            //多窗口模式，层叠置顶
            layer.open({
                type: 1
                , title: '模拟打卡--'
                , content: $('#imitateCheck')
                , btn: ['打卡', '取消'] //只是为了演示
                , area: ['600px', '300px'] //宽高
                ,closeBtn: 0
                , yes: function () {
                    var formData = form.val('imitateCheckForm');
                    console.log(formData);
                    var layerui = layer;
                    var currentPage = workTable.config.page.curr;//获取当前页码
                    $.ajax({
                        url: "/worktime/imitateCheck",
                        type: "POST",
                        data: JSON.stringify(formData),//传递json类型的参数
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            if(result.code == COMMON_SUCCESS_CODE){

                                layerui.msg('操作成功');
                                workTable.reload({page:{curr: currentPage}})
                            }else{
                                layerui.alert('操作失败', {icon: 2});
                            }
                            layerui.closeAll();
                            $("#imitateCheckForm")[0].reset();
                            $('.employee option:gt(0),.employeeImitate option:gt(0)').remove();
                        }
                    })
                }
                , btn2: function () {
                    layer.close();
                    $("#imitateCheckForm")[0].reset();
                    $('.employee option:gt(0),.employeeImitate option:gt(0)').remove();
                }
            });
        }
        //触发事件
        var active = {
            imitateCheck: function () {
                layerForm();
            },
            search: function () {
                var searchData = form.val("workSearchForm");
                var currentPage = workTable.config.page.curr;//获取当前页码
                console.log(searchData);
                workTable.reload({
                    where: searchData,
                    page: {
                        curr: currentPage
                    }//设定异步数据接口的额外参数)
                })
            },
            changeStatus:function (){
                var othis = $(this), dataId = othis.data('id');
                var currentPage = workTable.config.page.curr;//获取当前页码
                console.log(dataId);
                $.ajax({
                    url: "/work/changeStatus/"+dataId,
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        if(result.code == COMMON_SUCCESS_CODE){
                            layer.msg('操作成功');
                            workTable.reload({page:{curr: currentPage}})
                        }else{
                            layerui.alert('操作失败', {icon: 2});
                        }
                    }
                });

            },
            deleteRecord: function () {
                var othis = $(this),dataId = othis.data('id');
                var currentPage = workTable.config.page.curr;//获取当前页码
                layer.confirm('确定删除?',{
                    btn: ['确定','删除']
                    ,yes: function (index,layero) {
                        var layDelete = layer;
                        $.ajax({
                            url: "/work/deleteRecord/"+dataId,
                            type: "DELETE",
                            contentType: "application/json; charset=utf-8",
                            success: function(result){
                                if(result.code == COMMON_SUCCESS_CODE){
                                    workTable.reload({page:{curr: currentPage}});
                                }else{
                                    layer.alert('删除失败',{icon:2});
                                }
                                layDelete.closeAll();
                            }
                        })
                    }, btn2: function (index, layero) {
                        layer.closeAll();
                    }
                });
            }
        }
        var workTable =  table.render({
            elem: '#worktime'
            ,url:'/worktime/list'
            ,method:"post"
            ,contentType: 'application/json'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'employee.emName', width:150, title: '打卡人', sort: true,
                    templet:function(d){
                    return d.employee.emName
                }
                }
                ,{field:'checkTime', width:150, title: '打卡时间'}
                ,{field:'status', width:150, title: '打卡状态', sort: true,
                    templet:function(d){
                        if(d.status == 0){
                            return "正常"
                        }
                        if(d.status == 1){
                            return "迟到"
                        }
                        if(d.status == 2){
                            return "早退"
                        }
                        if(d.status == 3){
                            return "外勤"
                        }
                    }}
                ,{field:'checkType', width:150, title: '打卡类型',
                    templet:function(d){
                        if(d.checkType == 0){
                            return "上班"
                        }
                        if(d.checkType == 1){
                            return "下班"
                        }
                    }
                }
                ,{width:160, title: '操作',templet:function(d){
                        var btnStr = ' <button type="button" class="layui-btn layui-btn-sm singleBtn" data-method="changeStatus" data-id="'+ d.id+'">改为正常</button>' +
                                     '<button type="button" class="layui-btn layui-btn-sm singleBtn" data-method="deleteRecord" data-id="'+d.id+'"><i class="layui-icon layui-icon-delete"></i></button>';;
                    return  btnStr;
                }}
            ]],
            parseData: function(res){ //res 即为原始返回的数据
                return res
            },
            done: function(res, curr, count){
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                console.log(res);
                //得到当前页码
                console.log(curr);

                //得到数据总量
                console.log(count);
                $('.singleBtn').on('click', function(){
                    var othis = $(this), method = othis.data('method');
                    active[method] ? active[method].call(this, othis) : '';
                });
            },
            page: true
        });
        $('#btn_group .layui-btn,#searchBtn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    })
</script>
</html>