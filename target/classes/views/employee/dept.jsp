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
    <div class="layui-btn-group layui-row" id="btn_group">
        <button type="button" class="layui-btn" data-method="addDept">添加</button>
    </div>
    <table class="layui-hide" id="deptTable"></table>
</body>
<div hidden id="addDept">
    <form class="layui-form" action="" lay-filter="addDeptForm" id="addDeptForm">
        <div class="layui-form-item">
            <label class="layui-form-label">部门名称</label>
            <div class="layui-input-block">
                <input type="text" name="deptname" required  lay-verify="required" autocomplete="off" class="layui-input">
                <input type="text" name="id" hidden>
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
        var dept={};

        var deptTable =  table.render({
            elem: '#deptTable'
            ,url:'/dept/list'
            ,method:"post"
            ,data: JSON.stringify(dept)//传递json类型的参数
            ,contentType: 'application/json'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'deptname', width:200, title: '部门名称', sort: true}
                ,{width:137, title: '操作',templet:function(d){
                        return '<button type="button" class="layui-btn layui-btn-sm singleBtn" data-method="editDept" data-id="'
                            +d.id+'"><i class="layui-icon layui-icon-edit"/></button>'
                            +'<button type="button" class="layui-btn layui-btn-sm singleBtn" data-method="deleteDept" data-id="'
                            +d.id+'"><i class="layui-icon layui-icon-delete"/></button>'
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
        function layerForm(){
            //多窗口模式，层叠置顶
            layer.open({
                type: 1
                , title: '添加部门'
                , content: $('#addDept')
                , btn: ['保存', '取消'] //只是为了演示
                , area: ['600px', '300px'] //宽高
                ,closeBtn: 0
                , yes: function () {
                    var formData = form.val('addDeptForm');//form lay-filter属性
                    console.log(formData);
                    var layerui = layer;
                    var currentPage = deptTable.config.page.curr;//获取当前页码
                    $.ajax({
                        url: "/dept/add",
                        type: "POST",
                        data: JSON.stringify(formData),//传递json类型的参数
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            if(result.code == COMMON_SUCCESS_CODE){
                                layerui.msg('操作成功');
                                deptTable.reload({page: {curr: currentPage}})
                            }else{
                                layerui.alert('操作失败', {icon: 2});
                            }
                            layerui.closeAll();
                            $("#addDeptForm")[0].reset();
                            form.render();
                        }
                    })

                }
                , btn2: function () {
                    layer.closeAll();
                    console.log($("#addDeptForm")[0])
                    $("#addDeptForm")[0].reset();
                    form.render();
                }
            });
        }
        //触发事件
        var active = {
            addDept: function () {
                var that = this;
                layerForm();
            },
            editDept:function(){
                var othis = $(this), dataId = othis.data('id');
                var currentPage = deptTable.config.page.curr;//获取当前页码
                console.log(dataId);
                $.ajax({
                    url: "/dept/search/"+dataId,
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        if(result.code == COMMON_SUCCESS_CODE){
                            var dept = result.data;
                            //给表单赋值
                            form.val("addDeptForm", { //addEmployeeForm 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                                "deptname": dept.deptname // "name": "value"
                                ,"id": dept.id
                            });
                            layerForm();
                        }else{
                            layer.alert('数据获取失败', {icon: 2});
                        }
                    }
                })
            },
            deleteDept: function () {
                var othis = $(this), dataId = othis.data('id');
                var currentPage = deptTable.config.page.curr;//获取当前页码
                layer.confirm('确定删除?', {
                    btn: ['确定', '取消'],
                    yes: function (index, layero) {
                        var layDelete = layer;
                        $.ajax({
                            url: "dept/delete/"+dataId,
                            type: "DELETE",
                            contentType: "application/json; charset=utf-8",
                            success: function (result) {
                                if(result.code == COMMON_SUCCESS_CODE){
                                    deptTable.reload({page: {curr: currentPage}});
                                }else{
                                    layer.alert('删除失败',{icon: 2});
                                }
                                layDelete.closeAll();
                            }
                        })
                    },
                    btn2: function (index, layero) {
                        layer.closeAll();
                    }
                });
            }
        }
        $('#btn_group .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    })
</script>
</html>