<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2020/4/25
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>客户管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/public.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui_ext/dtree/font/dtreefont.css">

</head>
<body class="childrenBody">
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">客户姓名:</label>
            <div class="layui-input-inline">
                <input type="text" name="custname"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-inline">
                <input type="text" name="identity" id="identity" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">地址:</label>
            <div class="layui-input-inline">
                <input type="text" name="address"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">手机号:</label>
            <div class="layui-input-inline">
                <input type="text" name="phone"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">职位:</label>
            <div class="layui-input-inline">
                <input type="text" name="career"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别:</label>
            <div class="layui-input-inline">
                <input type="radio" name="sex" value="1"  title="男">
                <input type="radio" name="sex" value="0" title="女">
            </div>
        </div>
        <div class="layui-item" style="padding:10px;text-align: center;">
            <button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询</button>
            <button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
            <button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-download-circle" id="doExport">导出</button>
        </div>
    </div>
</form>

<!-- 搜索条件结束 -->


<!-- 数据表格开始 -->
<table class="layui-hide" id="customerTable" lay-filter="customerTable"></table>
<div style="display: none;" id="customerToolBar">
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
    <button type="button" class="layui-btn layui-btn-sm" lay-event="deleteBatch">批量删除</button>
</div>
<div  id="customerBar" style="display: none;">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
    <form class="layui-form"  lay-filter="dataFrm" id="dataFrm" >
        <div class="layui-form-item">
            <label class="layui-form-label">客户姓名:</label>
            <div class="layui-input-block">
                <input type="hidden" name="createtime">
                <input type="text" name="custname"  placeholder="请输入客户姓名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-block">
                <input type="text" name="identity" placeholder="请输入身份证号" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地址:</label>
            <div class="layui-input-block">
                <input type="text" name="address" placeholder="请输入地址" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号:</label>
            <div class="layui-input-block">
                <input type="text" name="phone" placeholder="请输入手机号" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">职位:</label>
            <div class="layui-input-block">
                <input type="text" name="career" placeholder="请输入职位" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
            <div class="layui-inline">
                <label class="layui-form-label">性别:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="sex" value="1" checked="checked" title="男">
                    <input type="radio" name="sex" value="0" title="女">
                </div>
            </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>
                <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh" >重置</button>
            </div>
        </div>
    </form>


</div>
<!-- 添加和修改的弹出层结束 -->

<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript">
    var tableIns;
layui.use([ 'jquery', 'layer', 'form', 'table'  ], function() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        //渲染数据表格
        tableIns=table.render({
            elem: '#customerTable'   //渲染的目标对象
            ,url:'${pageContext.request.contextPath}/customer/CustomerList' //数据接口
            ,title: '用户数据表'//数据导出来的标题
            ,toolbar:"#customerToolBar"   //表格的工具条
            ,height:'full-150'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,defaultToolbar: ['exports']
            ,page: true  //是否启用分页
            ,cols: [[   //列表数据
                {type: 'checkbox', fixed: 'left'}
                ,{field:'identity', title:'身份证号',align:'center',width:'180'}
                ,{field:'custname', title:'客户姓名',align:'center',width:'100'}
                ,{field:'phone', title:'客户电话',align:'center',width:'180'}
                ,{field:'address', title:'客户地址',align:'center',width:'150'}
                ,{field:'career', title:'客户职位',align:'center',width:'180'}
                ,{field:'sex', title:'性别',align:'center',width:'180',templet:function(d){
                        return d.sex=='1'?'<font color=blue>男</font>':'<font color=red>女</font>';
                    }}
                //,{field:'createtime', title:'录入时间',align:'center',width:'180'}
                ,{fixed: 'right', title:'操作', toolbar: '#customerBar', width:180,align:'center'}
            ]],
            done:function(data,curr,count){
                //不是第一页时如果当前返回的数据为0那么就返回上一页
                if(data.data.length==0&&curr!=1){
                    tableIns.reload({
                        page: {curr:curr - 1}
                    })
                }
            }
        })
        //模糊查询
        $("#doSearch").click(function(){
            var params=$("#searchFrm").serialize();
            tableIns.reload({
                url:"${pageContext.request.contextPath}/customer/CustomerList?"+params
                ,page:{
                    curr:1
                }
            })
        });

        //监听导出
    $("#doExport").click(function(){
        var params=$("#searchFrm").serialize();
        window.location.href="${pageContext.request.contextPath}/customer/exportCustomer?"+params;
    });

        //监听头部工具栏事件
        table.on("toolbar(customerTable)",function(obj){
            switch(obj.event){
                case 'add':
                    openAddCustomer();
                    break;
                case 'deleteBatch':
                    deleteBatch();
                    break;
            };
        })
        //监听行工具事件
        table.on('tool(customerTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'del'){ //删除
                        layer.confirm('真的删除【'+data.custname+'】这个菜单吗', function(index){
                            //向服务端发送删除指令
                            $.post("${pageContext.request.contextPath}/customer/customerDelete",{identity:data.identity},function(res){
                                layer.msg(res.msg);
                                //刷新数据 表格
                                tableIns.reload();
                            })
                        });
            } else if(layEvent === 'edit'){ //编辑
                openUpdateCustomer(data);
            }
        });

        var url;
        var mainIndex;
        //打开添加页面
        function openAddCustomer(){
            mainIndex=layer.open({
                type:1,
                title:'添加菜单',
                content:$("#saveOrUpdateDiv"),
                area:['800px','450px'],
                success:function(index){
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    $("#menuSelectDiv").removeClass("layui-show");
                    url="${pageContext.request.contextPath}/customer/customerAdd";
                    $("identity").removeAttr("readonly");
                }
            });
        }
        //打开修改页面
        function openUpdateCustomer(data){
            mainIndex=layer.open({
                type:1,
                title:'修改用户',
                content:$("#saveOrUpdateDiv"),
                area:['800px','450px'],
                success:function(index){
                    form.val("dataFrm",data);
                    url="${pageContext.request.contextPath}/customer/customerUpdate";
                    $("identity").attr("readonly","readonly");
                }
            });
        }
        //保存
        form.on("submit(doSubmit)",function(obj){
            //序列化表单数据
            var data=$("#dataFrm").serialize();
            $.ajax({
                type: "post",
                url: url,
                data: data,
                dataType:'json',
                success: function(data){
                    layer.msg(data.msg);
                    //关闭弹出层
                    layer.close(mainIndex)
                    //刷新数据 表格
                    tableIns.reload();
                }
            })
        });
        //批量删除
        function deleteBatch(id){
            //得到选中的数据行
            var checkStatus = table.checkStatus('customerTable');
            var data = checkStatus.data;
            var params="";
            $.each(data,function(i,item){
                if(i==0){
                    params+="identitys="+item.identity;
                }else{
                    params+="&identitys="+item.identity;
                }
            })
            layer.confirm('真的删除选择的这些角色吗', function(index){
                //向服务端发送删除指令
                $.post("${pageContext.request.contextPath}/customer/customerDeleteLot.action",params,function(res){
                    layer.msg(res.msg);
                    //刷新数据 表格
                    tableIns.reload();
                })
            });
        }
    });

</script>
</body>
</html>
