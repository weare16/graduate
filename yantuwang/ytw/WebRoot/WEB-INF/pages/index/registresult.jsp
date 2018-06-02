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
	<div class="larry-personal" style="margin: 10%;text-align: center;">
			<input  id="message_id" type="hidden" value="${msg }">
			<img  id="success"  src="${path }/images/success.png"   style="display: none; width: 100px; height: 100px;">
			<img  id="failed"  src="${path }/images/failed.png" style="display: none; width: 100px; height: 100px;">
			<div id="salertMess" style="margin-top: 5%;display: none;"><span  style="font-size: 15px;color: #259B24;font-weight: bold;">注册成功！</span></div>
	        <div id="falertMess" style="margin-top: 5%; display: none;"><span  style="font-size: 15px;color: #D81E06;font-weight: bold;">注册失败！</span></div>
	    	<button  id="login"  class="layui-btn  layui-btn-danger  layui-btn-radius" style="margin-top: 15%;padding-left: 50px; padding-right: 50px; display: none;">去登录</button>
	</div>
</section>
<script type="text/javascript" src="${path }/common/layui/layui.js"></script>
<script  type="text/javascript"  src="${path}/js/jquery.js"></script>
<script type="text/javascript">
	layui.use(['layer','upload'],function(){
         var layer = layui.layer;
         //自定义弹框皮肤
		layer.config({
          extend: '/myskin/style.css' //同样需要加载新皮肤
         });
          
       $("#login").click(function(){
       //登录
          var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引，再关闭自己
           parent.layer.close(index); 
       
                parent.layer.open({
                type: 2// 2是iframe层
               ,title:'登录'//对话框标题
               ,skin: 'layer-ext-reigst' //样式类名
               ,area:['370px','300px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'login_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/system/login/toLogin.htm"//对话框显示内容,装的是页面
             }); 
       });
	});
	
	var result=$("#message_id").val();
	//alert(result);
	if(result==200){
	  $("#success").css("display","");
	  $("#salertMess").css("display","");
	  $("#login").css("display","");
	}else{
	  $("#failed").css("display","");
	  $("#falertMess").css("display","");
	}
	
	
	
	
	
	  
	
</script>
</body>
</html>