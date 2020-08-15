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
    <title>车辆出租管理</title>
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
            <label class="layui-form-label">身份证号:</label>
        <div class="layui-input-inline">
                <input type="text" name="identity" id="identity" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline">
                <button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询</button>
        </div>
    </div>
</form>

<!-- 搜索条件结束 -->


<!-- 数据表格开始 -->
<div id="content" style="display: none;">
    <table id="rentTable" lay-filter="rentTable"></table>
    <div  id="rentBar" style="display: none;">
        <a class="layui-btn layui-btn-xs layui-btn-warm"  lay-event="outCar">出租汽车</a>
        <a class="layui-btn layui-btn-xs"  lay-event="viewImage">查看大图</a>
    </div>
</div>
<!-- 数据表格结束 -->
<!--汽车出租的弹出层开始 -->
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
                <input type="text" name="price" lay-verify="required" readonly="readonly" placeholder="请输入出租价格" autocomplete="off"
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
                <input type="text" name="startdate" id="begindate"  placeholder="请输入起租时间" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">还租时间:</label>
            <div class="layui-input-block">
                <input type="text" name="returndate" id="returndate"  placeholder="请输入还租时间" autocomplete="off"
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
<!-- 汽车出租的弹出层结束 -->

<!--查看大图的弹出div-->
<div id="viewCarImageDiv" style="display: none;text-align: center;">
    <img alt="车辆图片" width="450px" height="450px" id="viewCarImage">
</div>
<!--查看大图的弹出div 结束-->

<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript">
    var tableIns;
layui.use([ 'jquery', 'layer', 'form', 'table','laydate'], function() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;
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

        //一开始这个不加载，需要搜索后进行加载
    function initCarData(){
        //渲染数据表格
        tableIns=table.render({
            elem: '#rentTable'   //渲染的目标对象
            ,url:'${pageContext.request.contextPath}/car/carList?isrentiing=0' //数据接口 ,只显示未出租的等于0的
            ,title: '车辆数据表'//数据导出来的标题
            ,height:'full-150'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,defaultToolbar: ['exports']
            ,page: true  //是否启用分页
            ,cols: [[   //列表数据
                ,{field:'carnumber', title:'车牌号',align:'center',width:'120'}
                ,{field:'cartype', title:'车辆类型',align:'center',width:'100'}
                ,{field:'color', title:'车辆颜色',align:'center',width:'120'}
                ,{field:'price', title:'购买价格',align:'center',width:'150'}
                ,{field:'rentprice', title:'出租价格',align:'center',width:'120'}
                ,{field:'deposit', title:'出租押金',align:'center',width:'120'}
                ,{field:'description', title:'车辆描述',align:'center',width:'120'}
                ,{field:'isrentiing', title:'出租状态',align:'center',width:'100',templet:function(d){
                        return d.isrentiing=='1'?'<font color=blue>已出租</font>':'<font color=red>未出租</font>';
                    }}
                ,{field:'carimg', title:'缩略图',align:'center',width:'120',templet:function(d){
                        return "<img width=40 height=40 src="+d.carimg+">"}}
                ,{fixed: 'right', title:'操作', toolbar: '#rentBar',width:'200',align:'center'}
            ]],
        })
    }

        //模糊查询
        $("#doSearch").click(function(){
            var params=$("#searchFrm").serialize();
            $.post("${pageContext.request.contextPath}/customer/CustomerIdentity",params,function(obj){
                if(obj.msg>=0){
                    //如果该客户存在就渲染初始化数据
                    $("#content").show();
                    initCarData();
                }else{
                    layer.msg("客户不存在，请确认身份证！");
                    //隐藏 车辆数据表
                    $("#content").hide();
                }
            })
        });

        //监听行工具事件
        table.on('tool(rentTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'viewImage'){
                openviewImage(data);
            }else if(layEvent === 'outCar'){
                openRentCar(data);
            }
        });

    var url;
    var mainIndex;
    function openRentCar(data){
        mainIndex=layer.open({
            type:1,
            title:'出租菜单',
            content:$("#saveOrUpdateDiv"),
            area:['900px','600px'],
            success:function(index){
                var identity = $("#identity").val();
                var price = data.rentprice;
                var carnumber = data.carnumber;
               //清空表单数据
                $("#dataFrm")[0].reset();
                //请求数据
                $.get("${pageContext.request.contextPath}/CarRent/Cust_CarRentList",{
                    identity:identity,
                    price:price,
                    carnumber:carnumber
                },function (data) { //obj == rentVo
                    //后台响应一个 data json数据然后给表复赋值
                    form.val("dataFrm",data);
                })
            }
        });
    }

    //保存
    form.on("submit(doSubmit)",function(obj){
        //序列化表单数据
        var data=$("#dataFrm").serialize();
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/CarRent/CarRentAdd",
            data: data,
            dataType:'json',
            success: function(data){
                layer.msg(data.msg);
                //关闭弹出层
                layer.close(mainIndex)
                //隐藏 车辆数据表
                $("#content").hide();
            }
        })
    });

        //查看大图
        function openviewImage(data) {
            mainIndex=layer.open({
                type:1,
                title:data.carnumber+'的车辆图片',
                content:$("#viewCarImageDiv"),
                area:['450px','450px'],
                success:function(index){
                   $("#viewCarImage").attr("src",data.carimg);
                }
            });
        }
    });

</script>
</body>
</html>
