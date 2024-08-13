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
        <div>
            <%--该按钮绑定了弹出层里的"保存"按钮,主要是为了用该按钮触发弹出层的表单验证,该按钮已经隐藏--%>
            <button type="button" data-method="addDept" lay-filter="formVerify" lay-submit style="display: none">提交修改后的部门名称</button>
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
                type: 1, // 弹出层类型为内容层（1: HTML内容）
                title: '添加部门', // 弹出层标题
                content: $('#addDept'), // 弹出层内容，从 id 为 `addDept` 的元素中获取
                btn: ['保存', '取消'], // 弹出层的按钮，显示“保存”和“取消”按钮
                area: ['600px', '300px'], // 弹出层的宽度和高度
                closeBtn: 0, // 关闭按钮设置为 0，表示隐藏关闭按钮
                success: function (layero, index) { // 弹出层打开后的回调函数
                    layero.addClass('layui-form'); // 为弹出层添加 `layui-form` 类
                    layero.find('.layui-layer-btn0').attr({ // 修改“保存”按钮的属性
                        'lay-filter': 'formVerify', // 添加 lay-filter 属性，设置为 'formVerify'
                        'lay-submit': '' // 添加 lay-submit 属性，启用 layui 表单提交功能
                    });
                    form.render(); // 渲染表单
                },
                yes: function () { // 点击“保存”按钮后的回调函数
                    form.on('submit(formVerify)', function (data) { // 绑定表单提交事件
                        var formData = form.val('addDeptForm'); // 获取表单数据
                        console.log(formData); // 输出表单数据到控制台
                        var layerui = layer; // 引用 layer 对象
                        $.ajax({
                            url: "/dept/add", // 请求 URL
                            type: "POST", // 请求类型
                            data: JSON.stringify(formData), // 将表单数据转为 JSON 格式
                            contentType: "application/json; charset=utf-8", // 请求内容类型
                            dataType: "json", // 期望返回的数据类型
                            success: function (result) { // 请求成功后的回调函数
                                if(result.code == COMMON_SUCCESS_CODE){ // 判断请求结果
                                    layerui.msg('操作成功'); // 显示成功消息
                                    deptTable.reload(); // 重新加载数据表格
                                } else {
                                    layerui.alert('操作失败', {icon: 2}); // 显示失败消息
                                }
                                layerui.closeAll(); // 关闭所有弹出层
                                $("#addDeptForm")[0].reset(); // 重置表单
                                form.render(); // 重新渲染表单
                            }
                        });
                    });
                },
                btn2: function () { // 点击“取消”按钮后的回调函数
                    layer.closeAll(); // 关闭所有弹出层
                    $("#addDeptForm")[0].reset(); // 重置表单
                    form.render(); // 重新渲染表单
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
                                    deptTable.reload();
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
