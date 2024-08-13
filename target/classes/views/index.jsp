<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="common/taglibs.jsp" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>员工管理系统</title>
    <%@ include file="common/meta.jsp" %>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">员工管理控制台</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <%--主页显示登录的用户名和头像--%>
                    <img src="${ctx}/static/avatar.png" class="layui-nav-img">
                    ${user.username}
                </a>
            </li>
            <li class="layui-nav-item"><a href="/logout">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="menu">
                <li class="layui-nav-item"><a href="javascript:;" lay-id="menu_employee" data-url="/employee">员工管理</a></li>
                <li class="layui-nav-item"><a href="javascript:;" lay-id="menu_worktime" data-url="/worktime">考勤管理</a></li>
                <li class="layui-nav-item"><a href="javascript:;" lay-id="menu_salary" data-url="/salary">工资管理</a></li>
                <li class="layui-nav-item"><a href="javascript:;" lay-id="menu_dept" data-url="/dept">部门管理</a></li>
                <li class="layui-nav-item"><a href="javascript:;" lay-id="menu_user" data-url="/user">账号管理</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body" style="overflow-y: hidden">
        <!-- 内容主体区域 -->
        <div class="layui-tab" lay-filter="navarea" lay-allowClose="true">
            <ul class="layui-tab-title">
                <li class="layui-this">工作台首页</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">欢迎来到员工管理系统</div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        @2021  员工管理系统
    </div>
</div>
<script>
    //JavaScript代码区域
    layui.use(['dropdown', 'util','element','form'], function(){
        var dropdown = layui.dropdown
            ,util = layui.util
            ,$ = layui.jquery,form=layui.form,
            element=layui.element;

        form.verify({
            confirmPass:function(value){
                if($('input[name=paword]').val() !== value){
                    return false;
                }
            },
            required:function(value){
                console.log(value);
                if(value == null){
                    return false;
                }
            }
        });
        var tabArray;
        //菜单点击事件
        element.on('nav(menu)', function(data){
            //这里是a链接的自定义属性获取，如果属性不含-符号，可以直接使用.获取，如a.id，如果含-符合，可以使用getAttribute获取
            var a_id = data[0].getAttribute("lay-id");
            var a_url = data[0].getAttribute("data-url");
            var a_title = data[0].innerHTML;

            //否则判断该tab项是否以及存在
            var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
            $.each($(".layui-tab-title li[lay-id]"), function () {
                //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                if ($(this).attr("lay-id") == a_id) {
                    isData = true;
                }
            })
            if (isData == false) {
                //标志为false 新增一个tab项
                //调用layui预置的模块element，新增tab
                element.tabAdd('navarea',{
                    title: a_title
                    ,content:'<iframe src="'+a_url+'" style="width: 99%;" scrolling="auto" frameborder="0"></iframe>'
                    ,id: a_id
                })
                FrameWH();
            }

            //将当前选中tab切换到新增的tab上
            element.tabChange('navarea', a_id);

        });
        function FrameWH() {
            var h = $(window).height()-150;
            $("iframe").css("height",h+"px");
        };
    });
</script>
</body>
</html>