<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2020/4/21
  Time: 22:28
  To change this template use File | Settings | File Templates.

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<!DOCTYPE html>
<html class="loginHtml">
<head>
    <meta charset="utf-8">
    <title>登录 汽车出租系统!!</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="${pageContext.request.contextPath}/static/00.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/public.css" media="all" />
</head>
<body class="loginBody">
<form class="layui-form" lay-filter="form" id="loginFrm" action="${pageContext.request.contextPath}/login" method="post">
     <security:csrfInput/>
    <div class="login_face"><img src="${pageContext.request.contextPath}/static/images/1.png" class="userAvatar"></div>
    <div class="layui-form-item input-item">
        <label for="loginname">用户名</label>
        <input type="text" placeholder="请输入用户名" autocomplete="off" id="loginname" name="logname"  class="layui-input" lay-verify="required">
    </div>
    <div class="layui-form-item input-item">
        <label for="pwd">密码</label>
        <input type="password" placeholder="请输入密码" autocomplete="off" id="pwd" name="pwd"  class="layui-input" lay-verify="required">
    </div>
    <div class="layui-form-item input-item" id="imgCode">
        <label for="code">验证码</label>
        <input type="text" placeholder="请输入验证码" autocomplete="off" id="code" name="code" class="layui-input" >
        <img src="${pageContext.request.contextPath}/code/vcode" id="imgcodes" onclick="this.src=this.src+'?'">
    </div>
    <div class="layui-form-item">
        <p class="layui-btn layui-block" id="login">登录</p>
    </div>
    <div class="layui-form-item layui-row" style="color:red;">

<%--        <a href="javascript:;" class="seraph icon-qq layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>--%>
<%--        <a href="javascript:;" class="seraph icon-wechat layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>--%>
<%--        <a href="javascript:;" class="seraph icon-sina layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>--%>
    </div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cache.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cache.js"></script>
<script type="text/javascript">
    layui.use(['form','layer','jquery'],function(){
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer
        $ = layui.jquery;
        //登录按钮
      //  form.on("submit(login)",function(data){
        //   $(this).text("登录中...").attr("disabled","disabled").addClass("layui-disabled");
        //    setTimeout(function(){
         //       $("#loginFrm").submit();
         //   },1000);
         //   return false;
       // })
        
       //验证码 登录 分开处理
        $("#login").click(function(){
        	var code = $("#code").val();
        $.ajax( {type:'get',
        			url:"${pageContext.request.contextPath}/code/codeValid",
        			data:{code:code},
        			success:function(res){
        				if(res.msg==1){
        					$("#loginFrm").submit();
        				}else{
        					layer.msg(res.msg);
        					//location.reload(); 刷新页面
        				}
        				
        	        }})
        	     
        });

        //表单输入效果
        $(".loginBody .input-item").click(function(e){
            e.stopPropagation();
            $(this).addClass("layui-input-focus").find(".layui-input").focus();
        })
        $(".loginBody .layui-form-item .layui-input").focus(function(){
            $(this).parent().addClass("layui-input-focus");
        })
        $(".loginBody .layui-form-item .layui-input").blur(function(){
            $(this).parent().removeClass("layui-input-focus");
            if($(this).val() != ''){
                $(this).parent().addClass("layui-input-active");
            }else{
                $(this).parent().removeClass("layui-input-active");
            }
        })
    })


</script>
</body>
</html>
