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
    <title>出租单管理</title>
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
            <label class="layui-form-label">出租单号:</label>
            <div class="layui-input-inline">
                <input type="text" name="rentid"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-inline">
                <input type="text" name="identity" id="identity" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">车牌号:</label>
            <div class="layui-input-inline">
                <input type="text" name="carnumber"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">开始时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="startdate" id="starttime" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">结束时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="returndate" id="endtime" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">出租单状态:</label>
            <div class="layui-input-inline">
                <input type="radio" name="rentflag" value="1"  title="已归还">
                <input type="radio" name="rentflag" value="0" title="未归还">
            </div>
        </div>
        <div class="layui-item" style="padding:10px; text-align: center;">
            <button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询</button>
            <button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
        </div>
    </div>
</form>

<!-- 搜索条件结束 -->


<!-- 数据表格开始 -->
<table class="layui-hide" id="rentTable" lay-filter="rentTable"></table>
  <script type="text/html" id="rentBar">
      {{#  if(d.rentflag ==1){ }}
      <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="exportRent">导出出租单</a>
      {{#  } else { }}
      <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
      <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
      <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="exportRent">导出出租单</a>
      {{#  } }}
  </script>
<!-- 数据表格结束 -->

<!-- 修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
    <form class="layui-form"  lay-filter="dataFrm" id="dataFrm" >
        <div class="layui-form-item">
            <label class="layui-form-label">出租单号:</label>
            <div class="layui-input-block">
                <input type="text" name="rentid" lay-verify="required" readonly="readonly" placeholder="请输入出租单号" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-block">
                <input type="text" name="cusIdentity" lay-verify="required" readonly="readonly" placeholder="请输入身份证号" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">车牌号:</label>
            <div class="layui-input-block">
                <input type="text" name="carNumber" lay-verify="required" readonly="readonly" placeholder="请输入车牌号" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出租价格:</label>
            <div class="layui-input-block">
                <input type="text" name="price" lay-verify="required" placeholder="请输入出租价格" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">操作员:</label>
            <div class="layui-input-block">
                <input type="text" name="opername" lay-verify="required" readonly="readonly" placeholder="请输入操作员" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">起租时间:</label>
            <div class="layui-input-block">
                <input type="text" name="startdate" id="begindate" lay-verify="required"  placeholder="请输入起租时间" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">还租时间:</label>
            <div class="layui-input-block">
                <input type="text" name="returndate" id="returndate" lay-verify="required"  placeholder="请输入还租时间" autocomplete="off"
                       class="layui-input">
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
<!-- 修改的弹出层结束 -->

<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript">
    var tableIns;
layui.use([ 'jquery', 'layer', 'form', 'table','laydate' ], function() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;
        laydate.render({
            elem:'#starttime',
            type:'datetime'
        });
    laydate.render({
        elem:'#endtime',
        type:'datetime'
    });
    //渲染时间选择器
    laydate.render({
        elem:'#begindate',
        type:'datetime',
        format: 'yyyy-MM-dd HH:mm:ss'
    });
    laydate.render({
        elem:'#returndate',
        type:'datetime',
        format: 'yyyy-MM-dd HH:mm:ss'
    });
        //渲染数据表格
        tableIns=table.render({
            elem: '#rentTable'   //渲染的目标对象
            ,url:'${pageContext.request.contextPath}/CarRent/CarRentList' //数据接口
            ,title: '用户数据表'//数据导出来的标题
            ,toolbar:"#rentToolBar"   //表格的工具条
            ,height:'full-150'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,defaultToolbar: ['exports']
            ,page: true  //是否启用分页
            ,cols: [[   //列表数据
                {field:'rentid', title:'出租单号',align:'center',width:'275'}
                ,{field:'cusIdentity', title:'身份证号',align:'center',width:'175'}
                ,{field:'carNumber', title:'车牌号',align:'center',width:'150'}
                ,{field:'rentflag', title:'出租单状态',align:'center',width:'115',templet:function(d){
                        return d.rentflag=='1'?'<font color=blue>已归还</font>':'<font color=red>未归还</font>';
                    }}
                ,{field:'startdate', title:'起租时间',align:'center',width:'180'}
                ,{field:'returndate', title:'还车时间',align:'center',width:'180'}
                ,{field:'price', title:'出租价格',align:'center',width:'120'}
                ,{field:'opername', title:'操作员',align:'center',width:'120'}
                ,{fixed: 'right', title:'操作', toolbar: '#rentBar', width:'200',align:'center'}
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
                url:"${pageContext.request.contextPath}/CarRent/CarRentList?"+params
                ,page:{
                    curr:1
                }
            })
        });


        //监听行工具事件
        table.on('tool(rentTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'del'){ //删除
                        layer.confirm('真的删除【'+data.rentid+'】这个出租单吗', function(index){
                            //向服务端发送删除指令
                            $.post("${pageContext.request.contextPath}/CarRent/carRentDelete",{rentid:data.rentid},function(res){
                                layer.msg(res.msg);
                                //刷新数据 表格
                                tableIns.reload();
                            })
                        });
            } else if(layEvent === 'edit'){ //编辑
                openUpdateRent(data);
            } else if(layEvent === 'exportRent'){
                window.location.href="${pageContext.request.contextPath}/CarRent/carRentexport?rentid="+data.rentid;
            }
        });

        var url;
        var mainIndex;
        //打开修改页面
        function openUpdateRent(data){
            mainIndex=layer.open({
                type:1,
                title:'修改出租单',
                content:$("#saveOrUpdateDiv"),
                area:['800px','450px'],
                success:function(index){
                    form.val("dataFrm",data);
                    url="${pageContext.request.contextPath}/CarRent/carRentUpdate";
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
    });

</script>
</body>
</html>
