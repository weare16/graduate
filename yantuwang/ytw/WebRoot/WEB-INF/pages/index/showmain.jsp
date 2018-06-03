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
<body class="layui-layout-body" style="background-color: #F7F7FA;overflow-y:auto">
	<div class="layui-layout layui-layout-admin"
		style="margin-left: 8%; margin-right: 8% ;background-color: #fff" >
		<input id="loginstate_id"   type="hidden" value="${loginstate } ">
		<input id="isadmin_id"   type="hidden" value="${isadmin } ">
		<!-- 头部导航 -->
		<div class="layui-header" style="background-color: #259B24">
			<div class="layui-logo">
				<img src="${path }/images/logo.png" height="50px;" />
			</div>
			<ul class="layui-nav layui-layout-left" >
				<li class="layui-nav-item  layui-this"><a href=""><span
						style="  font-size: 20px; font-family: 幼圆; font-weight: bold; color:white;">首页</span></a></li>
				<li class="layui-nav-item"><a href=""><span
						style="  font-size: 15px; font-family: 幼圆; font-weight: bold;">找辅导</span></a></li>
				<li class="layui-nav-item"><a href="${path }/pages/coach/toAdd.htm"><span
						style="  font-size: 15px; font-family: 幼圆; font-weight: bold;">我要辅导</span></a></li>
				<li class="layui-nav-item"><a href=""><span
						style="  font-size: 15px; font-family: 幼圆; font-weight: bold;">免费资料</span></a></li>
				<li  class="layui-nav-item"  style="display: none;"><a href=""><span
						style="  font-size: 15px; font-family: 幼圆; font-weight: bold;">管理员入口</span></a></li>		
			   
			   <%--  <c:forEach items="${firstjson}" var="list">
			     <li class="layui-nav-item"><a href="${path}${list.menuurl}"><span
						style="  font-size: 15px; font-family: 幼圆; font-weight: bold;">${list.menuname}</span></a>
						 <c:if test="${list.secordjson ne '' }">
						    <dl class="layui-nav-child">
						    <c:forEach items="${list.secordjson}" var="seclist">
						       <dd><a href="${path}${seclist.menuurl}">${seclist.menuname }</a></dd>
						     </c:forEach>
						  </dl>   
						 </c:if>
					
						</li>
			     </c:forEach> --%>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
					<div class="demoTable">
						<div class="layui-inline">
							<input name="id" class="layui-input" id="demoReload"
								placeholder="请输入专业或者学校" size="45">
						</div>
					</div>
				</li>
				<li class="layui-nav-item" id="loginli"><a href="javascript:;" id="login">登录</a></li>
				<li class="layui-nav-item" id="registli"><a href="javascript:;" id="regist">注册</a></li>
				<li class="layui-nav-item" id="headphoto" style="display: none;"><a href="javascript:;"  > <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> ${username }
				</a>
					<dl class="layui-nav-child">
					    <dd>
							<a href="">我的辅导</a>
						</dd>
						<dd>
							<a href="">完善资料</a>
						</dd>
						<dd>
							<a href="javascript:;" id="changePwd">修改密码</a>
						</dd>
						<dd>
							<a href="${path }/exit.htm">安全退出</a>
						</dd>
					</dl></li>
			</ul>
		</div>
			<!-- 轮播 -->
		<div style="padding-top: 8px; padding-left: 8%;padding-right: 8%;background-color: #fff" >
		    
			<div class="layui-carousel" id="test1">
				<div carousel-item>
					<div style=" background-color: #E5E5E5;"><img  src="${path }/images/11.png" width="100%"></div>
					<div style=" background-color: #5FB878;"><img  src="${path }/images/12.png" width="100%"></div>
					<div style=" background-color: #E5E5E5;"><img  src="${path }/images/11.png" width="100%"></div>
					<div style=" background-color: #5FB878;"><img  src="${path }/images/12.png" width="100%"></div>
				</div>
			</div>
			
		</div>
		<div style="padding-top: 8px; background-color: #fff">
		<div class="layui-tab layui-tab-brief " lay-filter="docDemoTabBrief"  >
			<ul class="layui-tab-title" style="text-align: center;">
				<li class="layui-this"><span style="font-size: 16px;  ">热门资料</span></li>
				<li><span style="font-size: 16px;  ">靠谱辅导</span></li>
			</ul>
			<div class="layui-tab-content"  style="padding: 20px 0px;" >
			   <div class="layui-tab-item layui-show  "   >
			      <div class="layui-col-md12" style="background-color: #fff;padding-left: 50px;padding-bottom: 20px;"><span style="font-size: 16px; font-weight: bold; color: #259B24;">初试 </span></div>
			     
			      <div class="layui-col-md12" style="background-color: #fff">
			      <div class="layui-col-md2 layui-col-md-offset1">  <img  src="${path }/images/a.png">北京师范大学-地理与信息</br>李晓敏</div>
			      <div class="layui-col-md2">  <img   src="${path }/images/e.png" ></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/b.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/c.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/d.png"></div>
			      </div>
			      
			      <div class="layui-col-md12" style="background-color: #fff">
			      <div class="layui-col-md2 layui-col-md-offset1">  <img  src="${path }/images/a.png">北京师范大学-地理与信息</br>李晓敏</div>
			      <div class="layui-col-md2">  <img   src="${path }/images/e.png" ></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/b.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/c.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/d.png"></div>
			      </div>
			      
			      <div class="layui-col-md12" style="background-color: #fff;padding-left: 50px;padding-bottom: 20px;padding-top: 20px;"><span style="font-size: 16px; font-weight: bold; color: #259B24">复试 </span></div>
			     
			      <div class="layui-col-md12" style="background-color: #fff">
			      <div class="layui-col-md2 layui-col-md-offset1">  <img  src="${path }/images/a.png">北京师范大学-地理与信息</br>李晓敏</div>
			      <div class="layui-col-md2">  <img   src="${path }/images/e.png" ></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/b.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/c.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/d.png"></div>
			      </div>
			      
			      <div class="layui-col-md12" style="background-color: #fff">
			      <div class="layui-col-md2 layui-col-md-offset1">  <img  src="${path }/images/a.png">北京师范大学-地理与信息</br>李晓敏</div>
			      <div class="layui-col-md2">  <img   src="${path }/images/e.png" ></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/b.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/c.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/d.png"></div>
			      </div>
			      
			   </div>
               <div class="layui-tab-item">内容2</div>
			
			
			
			</div>
		</div>
		</div>
			<%-- <jsp:include page="${path }/main_index.htm"></jsp:include> --%>
	</div>
	<!-- 加载js文件-->
	<script type="text/javascript" src="${path }/common/layui/layui.all.js"></script>
	<script type="text/javascript" src="${path }/js/jquery.js"></script>
	<script type="text/javascript" src="${path }/js/myhome.js"></script>
	
</body>
</html>
