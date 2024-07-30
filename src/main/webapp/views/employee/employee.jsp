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
    <form class="layui-form" action="" lay-filter="searchForm">
    <div class="layui-col-md12">
        <div class="grid-demo layui-col-md3">
            <div class="layui-form-item">
                <label class="layui-form-label">员工姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="emName" autocomplete="off" placeholder="请输入姓名" class="layui-input">
                </div>
            </div>
        </div>
        <div  class="grid-demo layui-col-md3">
            <div class="layui-form-item">
                <label class="layui-form-label">工号</label>
                <div class="layui-input-block">
                    <input type="text" name="emnum" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="grid-demo layui-col-md3">
            <div class="layui-form-item">
                <label class="layui-form-label">电话</label>
                <div class="layui-input-block">
                    <input type="text" name="phone" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="grid-demo layui-col-md2">
            <div class="layui-form-item">
                <label class="layui-form-label">部门</label>
                <div class="layui-input-block">
                    <select name="dept" lay-filter="dept" id="dept" class="dept">
                        <option value="">选择部门</option>
                    </select>
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
    <button type="button" class="layui-btn" data-method="addEmployee">增加</button>
</div>
<table class="layui-hide" id="employee"></table>
<%--<table class="layui-table"
       lay-data="{height:315, url:'/employee/list', page:true, id:'employee',method:'post',contentType: 'application/json'}"
       lay-filter="test">
    <thead>
    <tr>
        <th lay-data="{field:'id', width:80, sort: true}">ID</th>
        <th lay-data="{field:'emnum', width:80}">工号</th>
        <th lay-data="{field:'emName', width:80, sort: true}">姓名</th>
        <th lay-data="{field:'sex', width:80, sort: true}">性别</th>
        <th lay-data="{field:'birthday'}">年龄</th>
        <th lay-data="{field:'dept'}">部门</th>
        <th lay-data="{field:'email', sort: true}">邮箱</th>
    </tr>
    </thead>
</table>--%>
<%--<div id="pageinfo" class="layui-row layui-table-page page-bottom"></div>--%>
</body>
<div hidden id="addEmployee">
    <form class="layui-form" action="" lay-filter="addEmployeeForm" id="addEmployeeForm">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="emName" required  lay-verify="required" autocomplete="off" class="layui-input">
                <input type="text" name="id" hidden>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">工号</label>
            <div class="layui-input-block">
                <input type="text" name="emnum" required  lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出生日期</label>
            <div class="layui-input-inline">
                <input type="text" name="birthday" id="birthday" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="M" title="男" checked="">
                <input type="radio" name="sex" value="F" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">政治面貌</label>
            <div class="layui-input-block">
                <select name="politicalStatus" lay-filter="politicalStatus">
                    <option value=""></option>
                    <option value="0">群众</option>
                    <option value="1">团员</option>
                    <option value="2">中共党员</option>
                    <option value="3">其他党派</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="text" name="email" required  lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-block">
                <input type="text" name="phone" required  lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学历</label>
            <div class="layui-input-block">
                <select name="education" lay-filter="education">
                    <option value=""></option>
                    <option value="0">无学习经历</option>
                    <option value="1">小学</option>
                    <option value="2">初中</option>
                    <option value="3">高中</option>
                    <option value="4">职高或技校</option>
                    <option value="5">中专</option>
                    <option value="6">大专</option>
                    <option value="7">本科</option>
                    <option value="8">硕士</option>
                    <option value="9">博士</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">毕业院校</label>
            <div class="layui-input-block">
                <input type="text" name="university" required  lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">岗位</label>
            <div class="layui-input-block">
                <input type="text" name="station" required  lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">薪酬级别</label>
            <div class="layui-input-block">
                <input type="number" name="salaryLevel" required  lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">部门</label>
            <div class="layui-input-block">
                <select name="dept" lay-filter="dept"  class="dept">
                    <option value="">选择部门</option>
                </select>
            </div>
        </div>
    </form>
</div>
<script>
    layui.use(['table','layer','form','laydate'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.$;
        var form = layui.form;
        var laydate = layui.laydate;

        var dept={};
        //日期
        laydate.render({
            elem: '#birthday'
        });
        $.ajax({
            url: "/dept/list",
            type: "POST",
            data: JSON.stringify(dept),//传递json类型的参数
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                if(result.code == COMMON_SUCCESS_CODE){
                    $.each(result.data,function(index,item){
                        $('.dept').append(new Option(item.deptname,item.id));//往下拉菜单里添加元素
                    })
                    form.render();//菜单渲染 把内容加载进去
                }else{
                    layer.alert('获取部门信息失败', {icon: 2});
                }
            }
        })
        function layerForm(){
            //多窗口模式，层叠置顶
            layer.open({
                type: 1
                , title: '添加员工'
                , content: $('#addEmployee')
                , btn: ['保存', '取消'] //只是为了演示
                , area: ['600px', '300px'] //宽高
                ,closeBtn: 0
                , yes: function () {
                    var formData = form.val('addEmployeeForm');
                    console.log(formData);
                    var layerui = layer;
                    $.ajax({
                        url: "/employee/add",
                        type: "POST",
                        data: JSON.stringify(formData),//传递json类型的参数
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            if(result.code == COMMON_SUCCESS_CODE){
                                layerui.msg('操作成功');
                                employeeTable.reload({page:{curr:1}})
                            }else{
                                alert('')
                                layerui.alert('操作失败', {icon: 2});
                            }
                            layerui.closeAll();
                            $("#addEmployeeForm")[0].reset();
                            form.render();
                        }
                    })

                }
                , btn2: function () {
                    layer.closeAll();
                    console.log($("#addEmployeeForm")[0])
                    $("#addEmployeeForm")[0].reset();
                    form.render();
                }
            });
        }
        //触发事件
        var active = {
            addEmployee: function () {
                var that = this;
                layerForm();
            },
            search:function (){
                var searchData = form.val("searchForm");
                console.log(searchData);
                employeeTable.reload({
                    where: searchData,
                    page:{
                        curr:1
                    }//设定异步数据接口的额外参数)
                })
            },
            editEmployee:function(){
                var othis = $(this), dataId = othis.data('id');
                console.log(dataId);
                $.ajax({
                    url: "/employee/search/"+dataId,
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        if(result.code == COMMON_SUCCESS_CODE){
                           var employee = result.data;
                            //给表单赋值
                            form.val("addEmployeeForm", { //addEmployeeForm 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                                "emName": employee.emName // "name": "value"
                                ,"sex": employee.sex
                                ,"birthday": employee.birthday
                                ,"emnum": employee.emnum
                                ,"id": employee.id
                                ,"politicalStatus": employee.politicalStatus
                                ,"email": employee.email
                                ,"education": employee.education
                                ,"university": employee.university
                                ,"station": employee.station
                                ,"salaryLevel": employee.salaryLevel
                                ,"dept":employee.dept
                                ,"phone":employee.phone
                            });
                            layerForm();
                        }else{
                            layer.alert('数据获取失败', {icon: 2});
                        }
                    }
                });
            },
            deleteEmployee:function(){
                var othis = $(this), dataId = othis.data('id');
                layer.confirm('确定删除？', {
                    btn: ['确定', '取消'] //可以无限个按钮
                    ,yes: function(index, layero){
                        var layDelete  = layer;
                        $.ajax({
                            url: "/employee/delete/"+dataId,
                            type: "DELETE",
                            contentType: "application/json; charset=utf-8",
                            success: function (result) {
                                if(result.code == COMMON_SUCCESS_CODE){
                                    employeeTable.reload({page:{curr:1}})
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
       var employeeTable =  table.render({
            elem: '#employee'
            ,url:'/employee/list'
            ,method:"post"
            ,contentType: 'application/json'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'emnum', width:80, title: '工号', sort: true}
                ,{field:'emName', width:80, title: '姓名'}
                ,{field:'sex', width:80, title: '性别', sort: true,
                templet:function(d){
                   if(d.sex == "F"){
                       return "女"
                   }
                   if(d.sex == "M"){
                       return "男"
                   }
                }}
                ,{field:'deptName', width:80, title: '部门'}
                ,{field:'birthday', title: '出生日期', width: '30%', minWidth: 100} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ,{field:'email', title: '邮箱', sort: true}
                ,{field:'phone', title: '电话', sort: true}
                ,{width:137, title: '操作',templet:function(d){
                    return '<button type="button" class="layui-btn layui-btn-sm singleBtn" data-method="editEmployee" data-id="'+d.id+'"><i class="layui-icon">&#xe642;</i></button>' +
                        ' <button type="button" class="layui-btn layui-btn-sm singleBtn" data-method="deleteEmployee" data-id="'+d.id+'"><i class="layui-icon">&#xe640;</i></button>'
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
    });
</script>

</html>