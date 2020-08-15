<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2020/4/29
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
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

</head>
<body class="childrenBody">
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户名称:</label>
            <div class="layui-input-inline">
                <input type="text" name="realname"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
        <label class="layui-form-label">登录名称:</label>
        <div class="layui-input-inline">
            <input type="text" name="logname"  autocomplete="off" class="layui-input">
        </div>
    </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户地址:</label>
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
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-inline">
                <input type="text" name="identity"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别:</label>
            <div class="layui-input-inline">
                <input type="radio" name="sex" value="1"  title="男">
                <input type="radio" name="sex" value="0" title="女">
            </div>
        </div>
        <div  class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block" >
                <button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询</button>
                <button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
            </div>
        </div>
    </div>
</form>

<!-- 搜索条件结束 -->


<!-- 数据表格开始 -->
<table class="layui-hide" id="userTable" lay-filter="userTable"></table>
<div style="display: none;" id="userToolBar">
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
    <button type="button" class="layui-btn layui-btn-sm" lay-event="deleteBatch">批量删除</button>
</div>
<div  id="userBar" style="display: none;">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="selectUserRole">分配角色</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="selectUserResetPwd">重置密码</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
    <form class="layui-form"  lay-filter="dataFrm" id="dataFrm" >
        <div class="layui-form-item">
            <div class="layui-inline">
            <label class="layui-form-label">用户名称:</label>
             <div class="layui-input-inline">
                <input type="hidden" name="userid">
                <input type="text" name="realname" lay-verify="required"  placeholder="请输入用户名称" autocomplete="off"
                       class="layui-input">
             </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">登录名称:</label>
                <div class="layui-input-inline">
                    <input type="text" name="logname" lay-verify="required" placeholder="请输入登录名称" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">身份证号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="identity" lay-verify="required" placeholder="请输入身份证号" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">地址:</label>
                <div class="layui-input-inline">
                    <input type="text" name="address"  placeholder="请输入地址" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">手机号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">职位:</label>
                <div class="layui-input-inline">
                    <input type="text" name="position"  placeholder="请输入职位" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">性别:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="sex" value="1" title="男">
                    <input type="radio" name="sex" value="0" title="女">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否可用:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="type" value="1" checked="checked" title="可用">
                    <input type="radio" name="type" value="0" title="不可用">
                </div>
            </div>
            
            <div class="layui-inline">
                <label class="layui-form-label">密码:</label>
                <div class="layui-input-inline">
                    <input type="password" name="pwd"  placeholder="请输入密码" autocomplete="off"
                           class="layui-input">
                </div>
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

<!--分配角色弹出层开始-->
<div style="display: none; padding: 10px" id="selectUserRole">
    <table class="layui-hide" id="roleTable" lay-filter="roleTable"></table>
</div>
<!--分配角色弹出层结束-->

<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript">
    var tableIns;
    layui.extend({
        dtree:'${pageContext.request.contextPath}/static/layui_ext/dist/dtree'
    }).use([ 'jquery', 'layer', 'form', 'table','dtree'  ], function() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var dtree=layui.dtree;
        //渲染数据表格
        tableIns=table.render({
            elem: '#userTable'   //渲染的目标对象
            ,url:'${pageContext.request.contextPath}/login/userList' //数据接口
            ,title: '用户数据表'//数据导出来的标题
            ,toolbar:"#userToolBar"   //表格的工具条
            ,height:'full-150'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,defaultToolbar: ['exports'] //只显示 导出按钮
            ,page: true  //是否启用分页
            ,cols: [[   //列表数据
                {type: 'checkbox', fixed: 'left'}
                ,{field:'userid', title:'ID',align:'center',width:'80'}
                ,{field:'realname', title:'用户名称',align:'center',width:'100'}
                ,{field:'logname', title:'登录名称',align:'center',width:'100'}
                ,{field:'identity', title:'身份证号',align:'center',width:'100'}
                ,{field:'phone', title:'手机号',align:'center',width:'100'}
                ,{field:'address', title:'地址',align:'center',width:'100'}
                ,{field:'pwd',hide:true, title:'密码',align:'center',width:'100'}
                ,{field:'sex', title:'性别',align:'center',width:'80',templet:function(d){
                        return d.sex=='1'?'<font color=blue>男</font>':'<font color=red>女</font>';
                    }}
                ,{field:'position', title:'职位',align:'center',width:'100'}
                ,{field:'type', title:'是否可用',width:'80',align:'center',templet:function(d){
                        return d.type=='1'?'<font color=blue>可用</font>':'<font color=red>不可用</font>';
                    }}
                ,{fixed: 'right', title:'操作', toolbar: '#userBar',align:'center',width:'300'}
            ]]
        })
        //模糊查询
        $("#doSearch").click(function(){
            var params=$("#searchFrm").serialize();
            tableIns.reload({
                url:"${pageContext.request.contextPath}/login/userQuery.action?"+params
            })
        });

        //监听头部工具栏事件
        table.on("toolbar(userTable)",function(obj){
            switch(obj.event){
                case 'add':
                    openAddUser();
                    break;
                case 'deleteBatch':
                    deleteBatch();
                    break;
            };
        })
        //监听行工具事件
        table.on('tool(userTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'del'){ //删除
                layer.confirm('真的删除【'+data.realname+'】这个菜单吗', function(index){
                    //向服务端发送删除指令
                    $.post("${pageContext.request.contextPath}/login/userDelete.action",{userid:data.userid},function(res){
                        layer.msg(res.msg);
                        //刷新数据 表格
                        tableIns.reload();
                    })
                });
            } else if(layEvent === 'edit'){ //编辑
                openUpdateUser(data);
            } else if(layEvent === 'selectUserRole'){
                openselectUserRole(data);
            } else if(layEvent == 'selectUserResetPwd'){
                layer.confirm('真的要重置密码吗', function(index){
                    //向服务端发送删除指令
                    $.post("${pageContext.request.contextPath}/login/userReset.action",{userid:data.userid},function(res){
                        layer.msg(res.msg);
                        //刷新数据 表格
                        tableIns.reload();
                    })
                });
            }
        });

        var url;
        var mainIndex;
        //打开添加页面
        function openAddUser(){
            mainIndex=layer.open({
                type:1,
                title:'添加菜单',
                content:$("#saveOrUpdateDiv"),
                area:['800px','420px'],
                success:function(index){
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    $("#menuSelectDiv").removeClass("layui-show");
                    url="${pageContext.request.contextPath}/login/userAdd.action";
                }
            });
        }
        //打开修改页面
        function openUpdateUser(data){
            mainIndex=layer.open({
                type:1,
                title:'修改用户',
                content:$("#saveOrUpdateDiv"),
                area:['800px','420px'],
                success:function(index){
                    form.val("dataFrm",data);
                    url="${pageContext.request.contextPath}/login/userUpdate.action";
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
            var checkStatus = table.checkStatus('userTable');
            var data = checkStatus.data;
            var params="";
            $.each(data,function(i,item){
                if(i==0){
                    params+="ids="+item.userid;
                }else{
                    params+="&ids="+item.userid;
                }
            })
            layer.confirm('真的删除选择的这些用户吗', function(index){
                //向服务端发送删除指令
                $.post("${pageContext.request.contextPath}/login/userDeleteLot.action",params,function(res){
                    layer.msg(res.msg);
                    //刷新数据 表格
                    tableIns.reload();
                })
            });
        }

        //打开分配角色的弹出层
        function openselectUserRole(data){
            var roleTree;
            mainIndex=layer.open({
                type:1,
                title:'分配['+data.realname+']角色',
                content:$("#selectUserRole"),
                area:['700px','500px'],
                btnAlign:'c',
                btn:['<div class="layui-icon layui-icon-release">确认分配</div>','<div class="layui-icon layui-icon-close">取消分配</div>'],
                yes:function(index, layero){
                    //获取数据行
                    var checkStatus = table.checkStatus('roleTable');
                    var roledata = checkStatus.data;
                    var params="userid="+data.userid;
                    $.each(roledata,function(i,item){
                        params+="&ids="+item.roleid;
                    });

                    //保存
                    $.post(
                        "${pageContext.request.contextPath}/RoleUsers/RoleUsersAdd",
                        params,
                        function(obj){
                            layer.msg(obj.msg);
                            //刷新数据 表格
                            tableIns.reload();
                            layer.close(mainIndex);
                        }
                    )
                },
                success:function(index){
                    //渲染数据表格
                    var tableIns=table.render({
                        elem: '#roleTable'   //渲染的目标对象
                        ,url:'${pageContext.request.contextPath}/RoleUsers/RoleUsersList?uid='+data.userid //数据接口
                        ,title: '角色数据表'//数据导出来的标题
                        ,height:'full-100'
                        ,cellMinWidth:100 //设置列的最小默认宽度
                        ,cols: [[   //列表数据
                            {type: 'checkbox', fixed: 'left'}
                            ,{field:'roleid', title:'ID',align:'center'}
                            ,{field:'rolename', title:'角色名称',align:'center'}
                            ,{field:'roledesc', title:'角色备注',align:'center'}
                        ]]
                    })
                }
            });
        }
    });

</script>
</body>
</html>
