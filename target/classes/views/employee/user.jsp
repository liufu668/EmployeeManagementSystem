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
    <button type="button" class="layui-btn" data-method="addUser">添加账号</button>
</div>
<table class="layui-hide" id="userTable"></table>
</body>
<div hidden id="addUser">
    <form class="layui-form" action="" lay-filter="addUserForm" id="addUserForm">
        <div class="layui-form-item">
            <label class="layui-form-label">真实姓名</label>
            <div class="layui-input-block">
                <input type="text" name="realname" required  lay-verify="required" autocomplete="off" class="layui-input">
                <input type="text" name="id" hidden>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" required  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item"  lay-filter="userPaword" id="userPaword">
        <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="paword" required  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" lay-filter="confirmPaword" id="confirmPaword">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="password" lay-verify="required|confirmPass" autocomplete="off" placeholder="确认密码"  class="layui-input">
            </div>
        </div>
        <div>
            <button type="button" data-method="addUser" lay-filter="formVerify" lay-submit style="display: none">提交新用户表单或修改后的用户表单</button>
        </div>
    </form>
</div>
<div hidden id="editPaword">
    <form class="layui-form" action="" lay-filter="editPawordForm" id="editPawordForm">
        <div class="layui-form-item"  lay-filter="paword">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="text" name="paword" required  lay-verify="required" autocomplete="off" class="layui-input">
                <input type="text" name="id" hidden>
            </div>
        </div>
        <div class="layui-form-item" lay-filter="conformPaword">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="password"  lay-verify="required|confirmPass" autocomplete="off" placeholder="确认密码"  class="layui-input">
            </div>
        </div>
        <div>
            <button type="button" data-method="editPaword" lay-filter="passwordVerify" lay-submit style="display: none">提交修改后的密码</button>
        </div>
    </form>
</div>
<script>
    layui.use(['table','layer','form','laydate'], function() {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.$;
        var form = layui.form;
        var user={};
        form.verify({
            confirmPassword: function(value) {
                if($('input[name=paword]').val() !== value){
                    return "两次输入的密码不一致!";
                }
            }
        });
        var userTable =  table.render({
            elem: '#userTable'
            ,url:'/user/list'
            ,method:"post"
            ,data: JSON.stringify(user)//传递json类型的参数
            ,contentType: 'application/json'
            ,cellMinWidth: 100 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'username', width:200, title: '用户名', sort: true}
                ,{field:'realname', width:200, title: '真实姓名', sort: true}
                ,{field:'lastLogineTime', width:200, title: '上次登录时间', sort: true}
                ,{field:'createtime', width:200, title: '创建时间', sort: true}
                ,{width:300, title: '操作',templet:function(d){
                        return '<button type="button" class="layui-btn layui-btn-sm singleBtn" data-method="editUser" data-id="'
                            +d.id+'"><i class="layui-icon layui-icon-edit"/></button>'
                            +'<button type="button" class="layui-btn layui-btn-sm singleBtn" data-method="editPaword" data-id="'
                            +d.id+'"><i class="layui-icon layui-icon-key" /></button>'
                            +'<button type="button" class="layui-btn layui-btn-sm singleBtn" data-method="deleteUser" data-id="'
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
                , title: '添加账号'
                , content: $('#addUser')
                , btn: ['保存', '取消'] //只是为了演示
                , area: ['600px', '300px'] //宽高
                ,closeBtn: 0
                ,success: function (layero, index) { // 弹出层打开后的回调函数
                    layero.addClass('layui-form'); // 为弹出层添加 `layui-form` 类
                    layero.find('.layui-layer-btn0').attr({ // 修改“保存”按钮的属性
                        'lay-filter': 'formVerify', // 添加 lay-filter 属性，设置为 'formVerify'
                        'lay-submit': '' // 添加 lay-submit 属性，启用 layui 表单提交功能
                    });
                    form.render(); // 渲染表单
                }
                , yes: function () {
                    form.on('submit(formVerify)', function (data) { // 绑定表单提交事件
                        var formData = form.val('addUserForm');//form lay-filter属性
                        console.log(formData);
                        var layerui = layer;
                        $.ajax({
                            url: "/user/add",
                            type: "POST",
                            data: JSON.stringify(formData),//传递json类型的参数
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (result) {
                                if(result.code == COMMON_SUCCESS_CODE){
                                    layerui.msg('操作成功');
                                    userTable.reload()
                                }else{
                                    layerui.alert('操作失败', {icon: 2});
                                }
                                layerui.closeAll();
                                $("#addUserForm")[0].reset();
                                form.render();
                            }
                        })

                    })
                }
                , btn2: function () {
                    layer.closeAll();
                    $("#addUserForm")[0].reset();
                    form.render();
                }
            });
        }
        //触发事件
        var active = {
            addUser: function () {
                var that = this;
                layerForm();
            },
            editUser:function(){
                var othis = $(this), dataId = othis.data('id');
                $("#userPaword").hide();
                $("#confirmPaword").hide();
                $('#userPaword input').attr('lay-verify', ''); // 添加lay-verify属性,进行表单验证
                $('#confirmPaword input').attr('lay-verify', '');
                $.ajax({
                    url: "/user/search/"+dataId,
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        if(result.code == COMMON_SUCCESS_CODE){
                            var user = result.data;
                            //给表单赋值
                            form.val("addUserForm", {
                                "username": user.username,
                                "realname": user.realname,
                                "id": user.id
                            });
                            layerForm();
                        }else{
                            layer.alert('数据获取失败', {icon: 2});
                        }
                    }
                });
            },
            editPaword: function () {
                var othis = $(this), dataId = othis.data('id');
                //多窗口模式，层叠置顶
                layer.open({
                    type: 1
                    , title: '修改密码'
                    , content: $('#editPaword')
                    , btn: ['保存', '取消'] //只是为了演示
                    , area: ['600px', '300px'] //宽高
                    ,closeBtn: 0
                    ,success: function (layero, index) { // 弹出层打开后的回调函数
                        layero.addClass('layui-form'); // 为弹出层添加 `layui-form` 类
                        layero.find('.layui-layer-btn0').attr({ // 修改“保存”按钮的属性
                            'lay-filter': 'passwordVerify', // 添加 lay-filter 属性，设置为 'formVerify'
                            'lay-submit': '' // 添加 lay-submit 属性，启用 layui 表单提交功能
                        });
                        form.render(); // 渲染表单
                    }
                    , yes: function () {
                        form.on('submit(passwordVerify)', function (data) { // 绑定表单提交事件
                            var formData = form.val('editPawordForm');//form lay-filter属性
                            console.log(formData);
                            var layerui = layer;
                            $.ajax({
                                url: "/user/editPaword/"+dataId,
                                type: "POST",
                                data: JSON.stringify(formData),//传递json类型的参数
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (result) {
                                    if(result.code == COMMON_SUCCESS_CODE){
                                        layerui.msg('操作成功');
                                        userTable.reload()
                                    }else{
                                        layerui.alert('操作失败', {icon: 2});
                                    }
                                    layerui.closeAll();
                                    $("#editPawordForm")[0].reset();
                                    form.render();
                                }
                            })
                        })
                    }
                    , btn2: function () {
                        layer.closeAll();
                        $("#editPawordForm")[0].reset();
                        form.render();
                    }
                });
            },
            deleteUser: function(){
                var othis = $(this), dataId = othis.data('id');
                layer.confirm('确定删除？', {
                    btn: ['确定', '取消'] //可以无限个按钮
                    ,yes: function(index, layero){
                        var layDelete  = layer;
                        $.ajax({
                            url: "/user/delete/"+dataId,
                            type: "DELETE",
                            contentType: "application/json; charset=utf-8",
                            success: function (result) {
                                if(result.code == COMMON_SUCCESS_CODE){
                                    userTable.reload()
                                }else{
                                    layer.alert('删除失败', {icon: 2});
                                }
                                layDelete.closeAll();
                            }

                        })

                    }, btn2: function(index, layero){
                        layer.closeAll();
                    }});
            }
        }
        $('#btn_group .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    })
</script>
</html>