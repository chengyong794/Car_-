<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>资料信息</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/public.css" media="all" />
</head>
<body class="childrenBody">
<form class="layui-form layui-row"  lay-filter="Fromdata">
	<div class="layui-col-md3 layui-col-xs12 user_right">
		<div class="layui-upload-list">
			<img class="layui-upload-img layui-circle " src="${requestScope.user.headpic}" id="userFace">
		</div>
		<button type="button" class="layui-btn" id="upload"><i class="layui-icon">&#xe67c;</i>上传头像</button>
		<p>头像</p>
	</div>
	<div class="layui-col-md6 layui-col-xs12">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" id="logname" name="logname" value="${requestScope.user.logname}" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户组</label>
			<div class="layui-input-block">
				<input type="text" value="${requestScope.user.position}" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">真实姓名</label>
			<div class="layui-input-block">
				<input type="text" name="realname" value="${requestScope.user.realname}" placeholder="请输入真实姓名" lay-verify="required" class="layui-input realName">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">性别</label>
			<c:if test='${requestScope.user.sex == 1}'>
			   <div class="layui-input-block">
                 <input type="radio" name="sex" value="1" title="男" checked="checked">
				 <input type="radio" name="sex" value="0" title="女">
			   </div>
			   </c:if>
			   <c:if test='${requestScope.user.sex == 0} '>
			   <div class="layui-input-block">
                 <input type="radio" name="sex" value="1" title="男" >
				 <input type="radio" name="sex" value="0" title="女" checked="checked">
               </div>
               </c:if>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">手机号码</label>
			<div class="layui-input-block">
				<input type="tel" name="phone" value="${requestScope.user.phone}" placeholder="请输入手机号码" lay-verify="phone" class="layui-input userPhone">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">家庭住址</label>
			<div class="layui-input-inline">
				<select name="address" id="option1" lay-filter="province" class="province">
				  <option value="${requestScope.user.address}">${requestScope.user.address}</option>
				  <option value="湖北">湖北</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="changeUser" lay-filter="changeUser">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>
<script type="text/javascript">
  layui.use(['jquery', 'layer', 'form','upload'],function(){
	  var $ = layui.jquery;
      var layer = layui.layer;
      var form = layui.form;
      var upload = layui.upload;
      
      var logname = $("#logname").val();
      
      form.on('submit(changeUser)',function(data){
    	  $.ajax({
			   type:'post',
			   url:"${pageContext.request.contextPath}/login/userPerUpdate",
			   data:data.field,
			   success:function(res){
				   layer.msg(res.msg);
			   }});
		   return false;
      })
      
    //执行实例
      var uploadInst = upload.render({
        elem: '#upload' //绑定元素
        ,url: '${pageContext.request.contextPath}/headUpload/headFileUpLoad?logname='+logname //上传接口
        ,acceptMime:'images/*'
        ,field:"mf"
        ,done: function(res, index, upload){
        	$("#userFace").attr('src',res.src);
          //上传完毕回调
        }
        ,error: function(){
        	layer.msg("上传失败");
          //请求异常回调
        }
      });
  });
  
  
  
  
</script>
</body>
</html>