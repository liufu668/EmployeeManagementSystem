<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="common/taglibs.jsp" %>

<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>员工管理系统-注册</title>
    <%@ include file="common/meta.jsp" %>
    <link rel="stylesheet" href="/static/css/views/login.css" media="all"/>
</head>
<body>
<!-- Head -->
<!-- Head End -->

<!-- Carousel -->
<!-- Carousel End -->

<!-- Footer -->
<!-- Footer End -->



<!-- LoginForm -->
<div class="login_main">
    <fieldset class="layui-elem-field layui-field-title hazel_mar_02">
        <legend>员工管理系统注册</legend>
    </fieldset>
    <div class="layui-row layui-col-space15">
        <form class="layui-form hazel_pad_01" action="">
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-form-item">
                    <input type="text" name="username" lay-verify="required|userName" autocomplete="off" placeholder="账号" class="layui-input">
                    <i class="layui-icon layui-icon-username login_icon"></i>
                </div>
            </div>
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-form-item">
                    <input type="password" name="paword" lay-verify="required|pass" autocomplete="off" placeholder="密码" class="layui-input">
                    <i class="layui-icon layui-icon-password login_icon"></i>
                </div>
            </div>
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-form-item">
                    <input type="password"  lay-verify="required|confirmPass" autocomplete="off" placeholder="确认密码" class="layui-input">
                    <i class="layui-icon layui-icon-password login_icon"></i>
                </div>
            </div>
            <div class="layui-col-sm12 layui-col-md12">
                <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="go">注册</button>
            </div>
            <div class="layui-form-mid layui-word-aux"><a href="/loginPage">登录</a></div>
            <div class="layui-form-mid layui-word-aux hint">
                <span id="registermsg"></span>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use('form', function () {//加载form模块
        var form = layui.form;
        var $ = layui.$;
        form.verify({
            confirmPass:function(value){
                if($('input[name=paword]').val() !== value){
                    console.log($('input[name=paword]').val()+":"+value);
                    $("#registermsg")[0].innerHTML = '两次密码输入不一致！';
                    return "false";
                }
            }
        });
        //submit登录按钮
        form.on('submit(go)', function (data) {
            var user = {};//构造user对象，传递参数
            user.username = $("input[name=username]").val();
            user.password = hex_md5($("input[name=paword]").val());//密码使用MD5加密
            $.ajax({
                url: "/register",
                type: "POST",
                data: JSON.stringify(user),//传递json类型的参数
                contentType: "application/json; charset=utf-8",
                dataType: "json"
                // success: function (result) {这部分代码无法执行,找不出问题
                //     alert("接收结果")
                //     if(result.code==COMMON_SUCCESS_CODE){
                //         alert("注册成功")
                //         location.href = "/login"
                //     }else{
                //         alert("注册失败")
                //         $("#registermsg")[0].innerHTML = result.msg;//显示错误信息
                //     }
                // }
            })
            location.href = "/login"
            return false;//拦截layui自带的提交
        })
    });

</script>
</body>
</html>