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
    <title>公告管理</title>
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
            <label class="layui-form-label">标题:</label>
            <div class="layui-input-inline">
                <input type="text" name="title"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">公告内容:</label>
            <div class="layui-input-inline">
                <input type="text" name="content"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">开始时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="starttime" id="startTime" readonly="readonly" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">结束时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="endtime" id="endTime" readonly="readonly" autocomplete="off" class="layui-input">
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
<table class="layui-hide" id="newsTable" lay-filter="newsTable"></table>
<div style="display: none;" id="newsToolBar">
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
    <button type="button" class="layui-btn layui-btn-sm" lay-event="deleteBatch">批量删除</button>
</div>
<div  id="newsBar" style="display: none;">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="viewNews">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
    <form class="layui-form"  lay-filter="dataFrm" id="dataFrm" >
        <div class="layui-form-item">
            <label class="layui-form-label">公告标题:</label>
            <div class="layui-input-block">
                <input type="hidden" name="newsid">
                <input type="hidden" name="opername" value="${userName}">
                <input type="text" name="title"  placeholder="请输入公告标题" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">公告内容:</label>
            <div class="layui-input-block">
                <!--富文本框-->
                <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="content"></textarea>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>
                <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh" id="dataFrmResetBtn">重置</button>
            </div>
        </div>
    </form>

</div>
<!-- 添加和修改的弹出层结束 -->
<!--查看公告的div-->
<div id="viewNewDiv" style="padding: 10px;display: none;">
    <h2 id="view_title" align="center"></h2>
    <hr>
    <div style="text-align: right;">
        发布人：<span id="view_opername"></span>||
        发布时间：<span id="view_createtime"></span>
    </div>
    <hr>
    <div id="view_content">
    </div>
</div>

<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript">
    var tableIns;
layui.use([ 'jquery', 'layer', 'form', 'table','laydate','layedit' ], function() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laydate1 = layui.laydate;
        var layedit = layui.layedit;
    //渲染时间
    laydate1.render(
        {
            elem:'#startTime',
            type:'datetime'
        }
    );
    laydate1.render(
        {
            elem:'#endTime',
            type:'datetime'
        }
    );
    //初始化富文本框编译器
    var contentIndex ;
        //渲染数据表格
        tableIns=table.render({
            elem: '#newsTable'   //渲染的目标对象
            ,url:'${pageContext.request.contextPath}/news/newsList' //数据接口
            ,title: '公告数据表'//数据导出来的标题
            ,toolbar:"#newsToolBar"   //表格的工具条
            ,height:'full-150'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,defaultToolbar: ['exports']
            ,page: true  //是否启用分页
            ,cols: [[   //列表数据
                {type: 'checkbox', fixed: 'left'}
                ,{field:'newsid', title:'ID',align:'center'}
                ,{field:'title', title:'公告标题',align:'center'}
                ,{field:'content', hide:true, title:'公告内容',align:'center'}
                ,{field:'createtime', title:'发布时间',align:'center'}
                ,{field:'opername', title:'发布人',align:'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#newsBar',align:'center'}
            ]]
        })
        //模糊查询
        $("#doSearch").click(function(){
            var params=$("#searchFrm").serialize();
            tableIns.reload({
                url:"${pageContext.request.contextPath}/news/newsList?"+params,
                page:{curr:1}//当到最后一页点查询时 回到第一页查数据
            })
        });

        //监听头部工具栏事件
        table.on("toolbar(newsTable)",function(obj){
            switch(obj.event){
                case 'add':
                	contentIndex  = layedit.build('content');
                    openAddNews();
                    break;
                case 'deleteBatch':
                    deleteBatch();
                    break;
            };
        })
        //监听行工具事件
        table.on('tool(newsTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'del'){ //删除
                        layer.confirm('真的删除【'+data.title+'】这条公告吗', function(index){
                            //向服务端发送删除指令
                            $.post("${pageContext.request.contextPath}/news/newsDelete.action",{newsid:data.newsid},function(res){
                                layer.msg(res.msg);
                                //刷新数据 表格
                                tableIns.reload();
                            })
                        });
            } else if(layEvent === 'edit'){ //编辑
            	contentIndex  = layedit.build('content');
                openUpdateNews(data);
            } else if(layEvent === 'viewNews'){//查看公告
                openViewNews(data);
            }
        });

        var url;
        var mainIndex;
        //打开添加页面
        function openAddNews(){
            mainIndex=layer.open({
                type:1,
                title:'添加公告',
                content:$("#saveOrUpdateDiv"),
                area:['800px','450px'],
                success:function(index){
                    contentIndex  = layedit.build('content');
                    layedit.setContent(contentIndex,"");
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    $("#menuSelectDiv").removeClass("layui-show");
                    url="${pageContext.request.contextPath}/news/newsAdd.action";
                }
            });
        }
        //打开修改页面
        function openUpdateNews(data){
            mainIndex=layer.open({
                type:1,
                title:'修改公告',
                content:$("#saveOrUpdateDiv"),
                area:['800px','450px'],
                success:function(index){
                  //  contentIndex  = layedit.build('content');
                   // layedit.setContent(contentIndex,layedit.getContent(contentIndex));
                    form.val("dataFrm",data);
                    url="${pageContext.request.contextPath}/news/newsUpdate.action";
                }
            });
        }
        // 手动重置reset不能自动重置的富文本框数据
    $("#dataFrmResetBtn").click(function(){
        //layedit.setContent(contentIndex,"");
        alert(layedit.getContent(contentIndex));
    });

        //保存
        form.on("submit(doSubmit)",function(obj){
            //这个获取富文本框的值 的语句要放在之前的位置
            //这个语句的意思是把富文本框里面的数据同步到自己写的textarea里面
            layedit.sync(contentIndex);
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
            var checkStatus = table.checkStatus('newsTable');
            var data = checkStatus.data;
            var params="";
            $.each(data,function(i,item){
                if(i==0){
                    params+="ids="+item.newsid;
                }else{
                    params+="&ids="+item.newsid;
                }
            })
            layer.confirm('真的删除选择的这些公告吗？', function(index){
                //向服务端发送删除指令
                $.post("${pageContext.request.contextPath}/news/newsDeleteLot.action",params,function(res){
                    layer.msg(res.msg);
                    //刷新数据 表格
                    tableIns.reload();
                })
            });
        }

        //查看
        function openViewNews(data){
            mainIndex=layer.open({
                type:1,
                title:'查看公告',
                content:$("#viewNewDiv"),
                area:['600px','400px'],
                success:function(index){
                    $('#view_title').html(data.title);
                    $('#view_content').html(data.content);
                    $('#view_createtime').html(data.createtime);
                    $('#view_opername').html(data.opername);
                }
            });
        }

    });

</script>
</body>
</html>
