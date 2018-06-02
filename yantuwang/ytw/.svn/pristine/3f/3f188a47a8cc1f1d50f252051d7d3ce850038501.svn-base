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
	<link rel="stylesheet" type="text/css" href="${path }/common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="${path }/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="${path }/css/personal.css" media="all">
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>注册信息</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix">
			<form class="layui-form col-lg-5 " action="" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">  
						<input type="text" name="logname"  autocomplete="off" required  class="layui-input " value="admin"  oninput="OnInput(event)" onpropertychange="OnPropChanged(event)" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">
						<input type="password" name="password"  autocomplete="off" required  class="layui-input " value="" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-block">
						<input type="password" name="password_re"  autocomplete="off" required  class="layui-input " value="" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名</label>
					<div class="layui-input-block">
						<input type="text" name="username"  autocomplete="off"  required  class="layui-input" value="Larry">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">手机号码</label>
					<div class="layui-input-block">
						<input type="text"  lay-verify="phone"  name="phone"  required  autocomplete="off" class="layui-input" placeholder="输入手机号码">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-block">
						<input type="text"  lay-verify="email" name="email"  autocomplete="off" class="layui-input" placeholder="输入邮箱地址">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">上传头像</label>
					<div class="layui-input-block">
						<input type="file" name="file" class="layui-upload-file">
					</div>
				</div>
			<!-- 	<div class="layui-form-item">
					<label class="layui-form-label">界面语言</label>
					<div class="layui-input-block">
						<select name="interest" lay-filter="aihao">
							<option value=""></option>
							<option value="0" selected="selected">中文</option>
							<option value="1">英文</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">座右铭</label>
					<div class="layui-input-block">
						<textarea placeholder="既然选择了远方，便只顾风雨兼程；路漫漫其修远兮，吾将上下而求索" value="" class="layui-textarea"></textarea>
					</div>
				</div> -->
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="${path }/common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['form','upload'],function(){
         var form = layui.form();
         layui.upload({ 
             url: '' ,//上传接口 
             success: function(res){
              //上传成功后的回调 
              console.log(res) 
            } 
         });

	});
	
	//字典编号唯一性校验，ie兼容模式
	
	
	//字典编号唯一性校验
        function OnInput (event) {
         alert("!!");
        }
        function OnPropChanged () {
         //   var id = obj.val();
            alert("!");
           /*  var dicno = event.srcElement.value;//获取input框实时输入的数据
            DicAction.checkDicUnique(id, dicno, function callback(rs){
                if(rs != null && rs == 1){
                    alert("字典编号不能重复");
                    $(".confirm-submit-btn").prop("disabled", true);
                }else{
                    $(".confirm-submit-btn").prop("disabled", false);
                }
            }); */
        }   
	
</script>
</body>
</html>