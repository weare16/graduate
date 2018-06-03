<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
%>
<head>
	<meta charset="UTF-8">
	<title>进销存管理系统</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="${path}/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="${path}/css/login.css" media="all">
</head>
<body class="loginbody">
<div class="layui-layout-logincontainer" >
  <div class="layui-layout layui-layout-login" style="background-color: #fff;" >
	<h1>
		 <strong>进销存后台管理系统</strong>
		 <em>Management System</em>
	</h1>
	<form id="loginform" style="margin-top: 35px; "  class="layui-form" action="${path}/system/login/toMain.htm" method="post">
	<input  type="hidden" value="${msg}" id="msg_id"/>
	<div class="layui-user-icon larry-login layui-form-item">
		 <input type="text" placeholder="账号" name="lname" id="lname_id" required  lay-verify="required"  value="${lname }"  class="login_txtbx "/>
	</div>
	<div class="layui-pwd-icon larry-login layui-form-item">
		 <input type="password" placeholder="密码"  id="pwd_id" required  lay-verify="required"  value="${password }"  class="login_txtbx "/>
	</div>
    <div class="layui-val-icon " style="height: 20px;">
    </div>
    <div class="layui-submit larry-login layui-form-item">
        <a href="${path}/system/login/toRegist.htm" class="regist_btn layui-btn  layui-btn-radius">注册</a>
    	<button  class="submit_btn layui-btn layui-btn-normal layui-btn-radius" lay-submit lay-filter="toLoginButton">立即登录</button>
    	
    </div>
    <div class="layui-login-text">
    	<p>Copyright © 2018 Mtecc.com</p>
    </div>
  </div>
</div>
</form>
<script type="text/javascript" src="${path }/common/layui/layui.all.js"></script>
<script type="text/javascript" src="${path}/js/login.js"></script>
<script type="text/javascript" src="${path}/jsplug/jparticle.jquery.js"></script>
<script type="text/javascript" src="${path}/js/base64_1.0.js"></script>
<script  type="text/javascript"  src="${path}/js/jquery.js"></script>
<script type="text/javascript">

var msg=$("#msg_id").val();
//alert(msg);
if(msg!="" && null !=msg &&msg==500){
  layer.msg('用户名或者密码错误！', {
  icon: 2,//2：表示错误的图片  1：表示正确的图片 
  time: 2000 //2秒关闭（如果不配置，默认是3秒）
  }, function(){
      window.location.href="${path}/system/login/toLogin.htm";
   }); 
}else if(msg!="" && null !=msg &&msg==200){
  layer.msg('恭喜您，注册成功！', {
  icon: 1,//2：表示错误的图片  1：表示正确的图片 
  time: 2000 //2秒关闭（如果不配置，默认是3秒）
  }, function(){
    window.location.href="${path}/system/login/toLogin.htm";
   }); 
}

;!function(){
   var form = layui.form;
  
    //监听表单提交
     form.on('submit(toLoginButton)', function(data){
      var lname=$("#lname_id").val();
      var pwd=$("#pwd_id").val();
	      if(lname!="" && null!=lname &&
	       pwd!="" && null!=pwd ){
	              //将身份信息拼成串,进行base64编码
				    var msg = lname+":"+ Base64.encode(pwd);
				    var base64_msg = Base64.encode(msg);
				   	//将信息设置到消息头，发送请求
					$.ajax({
						url:"${path}/system/login/toMain.htm",
						data:{},
						type:"post",
						dataType:"json",
						beforeSend:function(xhr){//xhr就是XmlHttpRequest
							xhr.setRequestHeader(
								"Authorization","Basic "+base64_msg);
						},
						success:function(data,response,status){
						alert(data);
							if(data=="200"){//进入后台首页
							
								location.href = '${path}/main.htm';
							}else if(data=="500"){
								location.href = '${path}/system/login/toLogin.htm?msg=500';
							}
						 },
						 error:function(){
						 	alert("操作异常");
						 }
					});
	      }
      return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
     });
  
  
  
}();
  





</script>
</body>
</html>