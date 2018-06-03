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
	<title>进销存后台管理系统</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="${path }/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="${path }/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="${path }/css/adminstyle.css" media="all">
	
	
</head>
<body>
<div class="layui-layout layui-layout-admin" id="layui_layout">
	<!-- 顶部区域 -->
	<div class="layui-header header header-demo">
		<div class="layui-main">
		    <!-- logo区域 -->
			<div class="admin-logo-box">
				<a class="logo" href="http://www.kuxuebao.net" title="logo">Mtecc管理系统</a>
				<div class="larry-side-menu">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</div>
				<!-- 天气信息 -->
			</div>
            <!-- 顶级菜单区域 -->
            <div class="layui-larry-menu">
                  <ul class="layui-nav clearfix">
                      <!--  <li class="layui-nav-item layui-this">
                 	   	   <a href="javascirpt:;"><i class="iconfont icon-wangzhanguanli"></i>内容管理</a>
                 	   </li>
                 	   <li class="layui-nav-item">
                 	   	   <a href="javascirpt:;"><i class="iconfont icon-weixin3"></i>微信公众</a>
                 	   </li>
                 	   <li class="layui-nav-item">
                 	   	   <a href="javascirpt:;"><i class="iconfont icon-ht_expand"></i>扩展模块</a>
                 	   </li> -->
                 	   <div class="weather"   pc>
			    	<div id="tp-weather-widget"></div>
					<script>(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))</script>
					<script>tpwidget("init", {
					    "flavor": "slim",
					    "location": "WX4FBXXFKE4F",
					    "geolocation": "disabled",
					    "language": "zh-chs",
					    "unit": "c",
					    "theme": "chameleon",
					    "container": "tp-weather-widget",
					    "bubble": "disabled",
					    "alarmType": "badge",
					    "color": "#FFFFFF",
					    "uid": "U9EC08A15F",
					    "hash": "14dff75e7253d3a8b9727522759f3455"
					});
					tpwidget("show");</script>
			    </div>
                 </ul>
            </div> 
             
            <!-- 右侧导航 -->
            <ul class="layui-nav larry-header-item">
            		<li class="layui-nav-item">
            		  <a href="javascript:;">
							<img width="35" height="35" class="layui-circle" src="${path}/images/user.jpg"/>
							<cite>${username }</cite>
						</a>
						<dl class="layui-nav-child" id="layui-nav-child_id">
							<dd><a href="javascript:;" data-url="${path }/userInfo.htm"><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人资料</cite></a></dd>
							<dd><a href="javascript:;" data-url="${path }/changePwd.htm"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>修改密码</cite></a></dd>
							
						</dl>
            		</li>
					<li class="layui-nav-item lockcms" pc>
						<a href="javascript:;" onclick="lockmydevice();"><i class="iconfont icon-suoping"></i><cite>锁屏</cite></a>
					</li>
					<li class="layui-nav-item">
						<a href="${path}/system/login/toLogin.htm">
                        <i class="iconfont icon-exit"></i>
						退出</a>
					</li> 
            </ul>
		</div>
	</div>
	<!-- 左侧侧边导航开始 -->
	<div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
        <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">
		
		<!-- 左侧菜单 -->
		<ul class="layui-nav layui-nav-tree">
			<li class="layui-nav-item layui-this">
				<a href="javascript:;" data-url="main.html">
				    <i class="iconfont icon-home1" data-icon='icon-home1'></i>
					<span>后台首页</span>
				</a>
			</li>
			<!-- 功能菜单 -->
		  <c:forEach items="${firstjson}" var="list">
		   <li class="layui-nav-item">
				<a href="javascript:;" data-url="${path}${list.menuurl}">
					<i class="iconfont ${list.menuflag }" ></i>
					<span>${list.menuname}</span>
					<c:if test="${list.secordjson ne '' } ">
					 <em class="layui-nav-more"></em>
					</c:if>
					
				</a>
				<c:forEach items="${list.secordjson}" var="seclist">
				<dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-url="${path}${seclist.menuurl}">
                            <i class="iconfont ${seclist.menuflag }" data-icon='${seclist.menuflag }'></i>
                            <span>${seclist.menuname}</span>
                        </a>
                    </dd>
               </dl>
               </c:forEach>
		 </li>
		 </c:forEach>
			
			
		</ul>
	    </div>
	</div>

	<!-- 左侧侧边导航结束 -->
	<!-- 右侧主体内容 -->
	<div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #2299ee;">
		<div class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="demo" lay-allowclose="true">
			<div class="go-left key-press pressKey" id="titleLeft" title="滚动至最右侧"><i class="larry-icon larry-weibiaoti6-copy"></i> </div>
			<ul class="layui-tab-title">
				<li class="layui-this" id="admin-home"><i class="iconfont icon-diannao1"></i><em>后台首页</em></li>
			</ul>
			<div class="go-right key-press pressKey" id="titleRight" title="滚动至最左侧"><i class="larry-icon larry-right"></i></div> 
			<div class="layui-tab-content" style="min-height: 150px;">
				<div class="layui-tab-item layui-show">
					<iframe class="larry-iframe" data-id='0'  src="${path }/main_index.htm"></iframe>
				</div>
			</div>
		</div>
	</div>
	<!-- 底部区域 -->
	<div class="layui-footer layui-larry-foot" id="larry-footer">
		<div class="layui-mian">  
		    <p class="p-admin">
		    	<span>2017 &copy;</span>
		    	 普众科技(北京)有限公司,版权所有
		    </p>
		</div>
	</div>
</div>
<!-- 加载js文件-->                                                                                                                                                                                           
	<script type="text/javascript" src="${path }/common/layui/layui.js"></script> 
	<script type="text/javascript" src="${path }/js/larry.js"></script>
	<script type="text/javascript" src="${path }/js/index.js"></script>
	
	
	
<!-- 锁屏 -->
<div class="lock-screen" style="display: none;">
	<div id="locker" class="lock-wrapper">
		<div id="time"></div>
		<div class="lock-box center">
			<img src="${path }/images/user.jpg" alt="" width="100px";height="100px;">
			<h1>admin</h1>
			<duv class="form-group col-lg-12">
				<!-- <input type="password" placeholder='锁屏状态，请输入密码解锁' id="lock_password" class="form-control lock-input" autofocus name="lock_password"> -->
				<button id="unlock" class="btn btn-lock layui-btn">解锁</button>
			</duv>
		</div>
	</div>
</div>

</body>
</html>
<script>

function lockmydevice(){
$(".lock-screen").css("display","block");
$("#locker").css("display","block");
}




</script>