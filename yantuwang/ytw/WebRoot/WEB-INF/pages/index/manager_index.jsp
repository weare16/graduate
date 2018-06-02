<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
%>
<head>
<meta charset="UTF-8">
<title>研途网</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<!-- load css -->
<link rel="stylesheet" type="text/css"
	href="${path }/common/layui/css/layui.css" media="all">
</head>
<body>
<section class="larry-wrapper">
      

</section>

<script type="text/javascript" src="${path }/common/layui/layui.all.js"></script>
<script type="text/javascript" src="${path }/js/jquery.js"></script>
<script type="text/javascript">
	;!function(){
		var element = layui.element,
		carousel = layui.carousel,
		layer = layui.layer;
		//建造轮播实例
		carousel.render({
			elem : '#test1',
			width : '100%' //设置容器宽度
			,
			arrow : 'always' //始终显示箭头
		//,anim: 'updown' //切换动画方式
		});
		//自定义弹框皮肤
		layer.config({
          extend: '/myskin/style.css' //同样需要加载新皮肤
         });
		 //注册
       $("#regist").click(function(){
                layer.open({
                type: 2// 2是iframe层
               ,title:'注册'//对话框标题
               ,skin: 'layer-ext-reigst' //样式类名
               ,area:['370px','370px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'regist_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/system/login/toRegist.htm"//对话框显示内容,装的是页面
             }); 
       });
        //登录
       $("#login").click(function(){
                layer.open({
                type: 2// 2是iframe层
               ,title:'登录'//对话框标题
               ,skin: 'layer-ext-reigst' //样式类名
               ,area:['370px','300px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'login_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/system/login/toLogin.htm"//对话框显示内容,装的是页面
             }); 
       });
	}();
</script>


</body>
</html>