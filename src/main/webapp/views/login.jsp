<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="common/taglibs.jsp" %>

<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>员工管理系统-登录</title>
    <%@ include file="common/meta.jsp" %>
    <link rel="stylesheet" href="/static/css/views/login.css" media="all"/>
</head>
<body>
<!-- LoginForm -->
<div class="login_main">
    <fieldset class="layui-elem-field layui-field-title hazel_mar_02">
        <legend>员工管理系统登录</legend>
    </fieldset>
    <div class="layui-row layui-col-space15">
        <form class="layui-form hazel_pad_01"
              action="/login" method="post" enctype="application/json" lay-filter="login">
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-form-item">
                    <input type="text" name="username" lay-verify="required|username" autocomplete="off" placeholder="账号" class="layui-input">
                    <i class="layui-icon layui-icon-username login_icon"></i>
                </div>
            </div>
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-form-item">
                    <input type="password" name="password" lay-verify="required|pass" autocomplete="off" placeholder="密码" class="layui-input">
                    <i class="layui-icon layui-icon-password login_icon"></i>
                </div>
            </div>
            <div class="layui-col-sm12 layui-col-md12">
                <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="gofilter">登录</button>
            </div>
            <div class="layui-form-mid layui-word-aux"><a href="/registerPage">注册</a></div>
            <div class="layui-form-mid layui-word-aux hint">
                <span id="loginmsg"></span>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use('form', function () {//加载form模块
        var form = layui.form;
        var $ = layui.$;
        form.verify({
            username: function(value, item){ //value：表单的值、item：表单的DOM对象
                if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                    return '用户名不能有特殊字符';
                }
                if(/(^\_)|(\__)|(\_+$)/.test(value)){
                    return '用户名首尾不能出现下划线\'_\'';
                }
                if(/^\d+\d+\d$/.test(value)){
                    return '用户名不能全为数字';
                }
            }
            //我们既支持上述函数式的方式，也支持下述数组的形式
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            ,pass: [/^[\S]{6,12}$/,'密码必须6到12位，且不能出现空格']
        });
        //submit登录按钮
        form.on('submit(gofilter)', function (data) {
            console.log(data);
            var user = {};//构造user对象，传递参数
            user.username = $("input[name=username]").val();
            user.password = hex_md5($("input[name=password]").val());//密码使用MD5加密
            $.ajax({
                url: "/login",
                type: "POST",
                data: JSON.stringify(user),//传递json类型的参数
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    if(result.code == COMMON_SUCCESS_CODE){
                        location.href = "/index"// 登录成功跳转index页面
                    }else{
                        $("#loginmsg")[0].innerHTML = result.msg;//显示登录的错误信息
                    }
                }
            })
            return false;//拦截layui自带的提交
        })
    });
</script>
</body>
</html>