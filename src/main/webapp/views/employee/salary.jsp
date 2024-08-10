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
    <form class="layui-form" action="" lay-filter="generateSalarySearchForm">
        <div class="layui-col-md10">
            <div class="grid-demo layui-col-md3">
                <div class="layui-form-item">
                    <label class="layui-form-label">查询员工</label>
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
                    <label class="layui-form-label">工资月份</label>
                    <div class="layui-input-block">
                        <input type="text" name="belongMonth" id="belongMonthSearch" autocomplete="off" class="layui-input" lay-filter="belongMonth">
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
    <button type="button" class="layui-btn" data-method="generateSalary">生成工资</button>
</div>
<table class="layui-hide" id="salaryTable"></table>
</body>
<div hidden id="generateSalary">
    <form class="layui-form" action="" lay-filter="generateSalaryForm" id="generateSalaryForm">
        <div class="layui-form-item" id="imitateDeptDiv" >
            <label class="layui-form-label">部门</label>
            <div class="layui-input-block">
                <select name="dept" lay-filter="dept"  class="dept" id="imitateDept" lay-verify="required" >
                    <option value="">选择部门</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item"  id="employeeGenerateDiv">
            <label class="layui-form-label">员工</label>
            <div class="layui-input-block">
                <select name="employeeId" lay-filter="employeeId" class="employeeImitate" lay-verify="required">
                    <option value="">选择员工</option>
                </select>

            </div>
        </div>

        <div class="layui-form-item" hidden  id="employeeNameHidden">
            <label class="layui-form-label">员工姓名</label>
            <div class="layui-input-block">
                <input name="id" readonly hidden id="salaryId">
                <input name="employeeName" readonly  class="layui-input" type="text" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">基础工资</label>
            <div class="layui-input-block">
                <input type="text" name="baseSalary" autocomplete="off" placeholder="基础工资" class="layui-input" lay-verify="required">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">绩效</label>
            <div class="layui-input-block">
                <input type="text" name="meritsSalary" autocomplete="off" placeholder="绩效" class="layui-input" lay-verify="required">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">奖金</label>
            <div class="layui-input-block">
                <input type="text" name="awardSalary" autocomplete="off" placeholder="奖金" class="layui-input" lay-verify="required">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">交通补助</label>
            <div class="layui-input-block">
                <input type="text" name="transportSubsidy" autocomplete="off" placeholder="交通补助" class="layui-input" lay-verify="required">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">餐补</label>
            <div class="layui-input-block">
                <input type="text" name="mealSubsidy" autocomplete="off" placeholder="餐补" class="layui-input" lay-verify="required">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">话费补助</label>
            <div class="layui-input-block">
                <input type="text" name="phoneSubsidy" autocomplete="off" placeholder="话费补助" class="layui-input" lay-verify="required">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">保险费</label>
            <div class="layui-input-block">
                <input type="text" name="insurance" autocomplete="off" placeholder="保险费" class="layui-input" lay-verify="required">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">个人所得税</label>
            <div class="layui-input-block">
                <input type="text" name="tax" autocomplete="off" placeholder="个人所得税" class="layui-input" lay-verify="required">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">其他加发</label>
            <div class="layui-input-block">
                <input type="text" name="otherSubsidy" autocomplete="off" placeholder="其他加发" class="layui-input" lay-verify="required">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">其他扣款</label>
            <div class="layui-input-block">
                <input type="text" name="otherCut" autocomplete="off" placeholder="其他扣款" class="layui-input" lay-verify="required">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">所属月份</label>
            <div class="layui-input-block">
                <input type="text" name="belongMonth" autocomplete="off" placeholder="所属月份" class="layui-input" lay-verify="required" id="belongMonth">
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
            elem: '#belongMonth'
            ,format: 'yyyy-MM'
            ,type: 'month'
        });
        laydate.render({
            elem: '#belongMonthSearch'
            ,format: 'yyyy-MM'
            ,type: 'month'
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
                            if(selectdept.id == 'searchDept'){//根据已选择的部门,列出该部门下的所有员工
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
                , title: '生成工资'
                , content: $('#generateSalary')
                , btn: ['生成', '取消'] //只是为了演示
                , area: ['600px', '300px'] //宽高
                ,closeBtn: 0
                , yes: function () {
                    var formData = form.val('generateSalaryForm');
                    console.log(formData);
                    var layerui = layer;
                    var currentPage = salaryTable.config.page.curr;//获取当前页码
                    $.ajax({
                        url: "/salary/generate",
                        type: "POST",
                        data: JSON.stringify(formData),//传递json类型的参数
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            if(result.code == COMMON_SUCCESS_CODE){
                                layerui.msg('操作成功');
                                salaryTable.reload({page:{curr: currentPage}})
                            }else{
                                layerui.alert('操作失败', {icon: 2});
                            }
                            layerui.closeAll();
                            $("#generateSalaryForm")[0].reset();
                            $('.employee option:gt(0),.employeeImitate option:gt(0)').remove();
                        }
                    })
                }
                , btn2: function () {
                    layer.close();
                    $("#generateSalaryForm")[0].reset();
                    $('.employee option:gt(0),.employeeImitate option:gt(0)').remove();
                }
            });
        }
        //触发事件
        var active = {
            generateSalary: function () {
                layerForm();
            },
            search: function () {
                var searchData = form.val("generateSalarySearchForm");
                var currentPage = salaryTable.config.page.curr;//获取当前页码
                console.log(searchData);
                salaryTable.reload({
                    where: searchData,
                    page: {
                        curr: currentPage
                    }//设定异步数据接口的额外参数)
                })
            },
            editSalary: function (){
                var othis = $(this), dataId = othis.data('id');
                $.ajax({
                    url: "/salary/search/"+dataId,
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        if(result.code == COMMON_SUCCESS_CODE){
                            var salary = result.data;
                            $("#employeeNameHidden").show();                            //给表单赋值
                            $("#employeeGenerateDiv").hide();                            //给表单赋值
                            $("#imitateDeptDiv").hide();
                            //给表单赋值
                            form.val("generateSalaryForm", { //addEmployeeForm 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                                "id": salary.id
                                ,"dept": salary.employee.deptId// "name": "value"
                                ,"employeeId": salary.employee.id
                                ,"employeeName": salary.employee.emName
                                ,"baseSalary": salary.baseSalary
                                ,"meritsSalary": salary.meritsSalary
                                ,"awardSalary": salary.awardSalary
                                ,"transportSubsidy": salary.transportSubsidy
                                ,"mealSubsidy": salary.mealSubsidy
                                ,"phoneSubsidy": salary.phoneSubsidy
                                ,"insurance": salary.insurance
                                ,"tax": salary.tax
                                ,"otherSubsidy": salary.otherSubsidy
                                ,"otherCut": salary.otherCut
                                ,"belongMonth": salary.belongMonth
                            });
                            layerForm();
                        }else{
                            layer.alert('数据获取失败', {icon: 2});
                        }
                    }
                })
            },
            deleteSalary: function () {
                var othis = $(this),dataId = othis.data('id');
                var currentPage = salaryTable.config.page.curr;//获取当前页码
                layer.confirm('确定删除?',{
                    btn: ['确定', '取消']
                    ,yes: function (index,layero) {
                        var layDelete = layer;
                        $.ajax({
                            url: "/salary/delete/"+dataId,
                            type: "DELETE",
                            contentType: "application/json; charset=utf-8",
                            success: function (result) {
                                if(result.code == COMMON_SUCCESS_CODE){
                                    salaryTable.reload({page:{curr: currentPage}});
                                }else{
                                    layer.alert('删除失败',{icon: 2});
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
        var salaryTable =  table.render({
            elem: '#salaryTable'
            ,url:'/salary/list'
            ,method:"post"
            ,contentType: 'application/json'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'belongMonth', width:100, title: '工资月份', sort: true,
                    templet:function(d){
                        return d.belongMonth
                    }
                },
                {field:'employee.emName', width:100, title: '姓名', sort: true,
                    templet:function(d){
                        return d.employee.emName
                    }
                }
                ,{field:'baseSalary', width:100, title: '基础工资'}
                ,{field:'meritsSalary', width:100, title: '绩效'}
                ,{field:'awardSalary', width:100, title: '奖金'}
                ,{field:'transportSubsidy', width:100, title: '交通补助'}
                ,{field:'mealSubsidy', width:100, title: '餐补'}
                ,{field:'phoneSubsidy', width:100, title: '话费补助'}
                ,{field:'insurance', width:100, title: '保险费'}
                ,{field:'tax', width:100, title: '个人所得税'}
                ,{field:'otherSubsidy', width:100, title: '其他加发'}
                ,{field:'otherCut', width:100, title: '其他扣款'}
                ,{field:'count', width:100, title: '合计',templet:function(d){
                        return  d.baseSalary+d.meritsSalary+d.awardSalary+d.transportSubsidy+d.mealSubsidy+d.phoneSubsidy+d.otherSubsidy
                            -d.insurance-d.tax-d.otherCut;
                    }}
                ,{width:130, title: '操作',templet:function(d){
                        var btnStr = '<button type="button" class="layui-btn layui-btn-sm singleBtn" data-method="editSalary" data-id="'+ d.id+'"><i class="layui-icon layui-icon-edit"/></i></button>' +
                                     '<button type="button" class="layui-btn layui-btn-sm singleBtn" data-method="deleteSalary" data-id="'+d.id+'"><i class="layui-icon layui-icon-delete"></i></button>';
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