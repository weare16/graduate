<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
%>
<head>
	<meta charset="UTF-8">
	<title>个人信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="${path }/common/layui/css/layui.css" media="all">
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal" style="margin-top: 5%; margin-right: 30px;">
	       <div class="layui-form-mid layui-word-aux"  style="text-align: center;width: 100%"><span id="alertMess" style="font-weight: bold;"></span></div>
			<form class="layui-form" action="${path}/system/login/Login.htm" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">  
						<input type="text" name="logname"  placeholder="请输入用户名"    autocomplete="off" lay-verify="required" class="layui-input " value=""  >
					</div>
				</div>
				<div class="layui-form-item" style="margin-top: 30px;">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">
						<input type="password" name="password"   placeholder="请输入密码"    autocomplete="off" lay-verify="required|pass"  class="layui-input " value="" >
					</div>
				</div>
				<div class="layui-form-item" style="margin-top: 30px;">
					<div class="layui-input-block">
						<button id="loginBut"   class="layui-btn layui-btn-radius" style="background-color: #259B24;padding-left:30%;padding-right: 30% "   lay-submit lay-filter="toLoginButton">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
					</div>
				</div>
			</form>
	</div>
</section>
<script type="text/javascript" src="${path }/common/layui/layui.all.js"></script>
<script  type="text/javascript"  src="${path}/js/jquery.js"></script>
<script type="text/javascript">
;!function(){
         var form = layui.form;
      //自定义验证规则
     //监听表单提交
     form.on('submit(toLoginButton)', function(data){
     //使用axaj
     $.ajax({
		       type:"post",
		       cache:false,
		       data: {  "logname":data.field.logname,"password":data.field.password},
		       dataType:"json",
		       url: "${path}/system/login/Login.htm",
		       success: function(fielddata){
		           if(fielddata=="500"){//用户名或密码错误
		             $("#alertMess").text("用户名或密码错误！").css("color","red ");
		           }else{
		              $("#alertMess").text("");
		              var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引，再关闭自己
                      parent.layer.close(index); 
                       window.parent.location.href = "${path}/main.htm";//成功
		           }
		     },
		     error : function(){
		 	    alertMsg.error("数据加载异常！");
		      }  
	      });
     
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
         
     });

}();
	
	
	
	  
	
</script>
</body>
</html>