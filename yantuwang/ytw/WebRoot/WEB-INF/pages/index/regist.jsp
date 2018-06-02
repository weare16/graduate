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
			<form class="layui-form" action="${path}/system/login/Regist.htm" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">  
						<input type="text" name="logname"  placeholder="请输入用户名"    autocomplete="off" lay-verify="required" class="layui-input " value=""  onchange="validate(this)">
					</div>
				</div>
				<div class="layui-form-item" style="margin-top: 30px;">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">
						<input type="password" name="password"   placeholder="请输入密码"    autocomplete="off" lay-verify="required|pass"  class="layui-input " value="" >
					</div>
				</div>
				<div class="layui-form-item"style="margin-top: 30px;">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-block">
						<input type="password" name="password_re"   placeholder="请再次确认密码"    autocomplete="off" lay-verify="required|pass_re"  class="layui-input " value="" >
					</div>
				</div>
				<div class="layui-form-item" style="margin-top: 30px;">
					<div class="layui-input-block">
						<button id="regBut"   class="layui-btn layui-btn-radius" style="background-color: #259B24;padding-left:25%;padding-right: 25% "   lay-submit lay-filter="toRegistButton">立即注册</button>
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
     form.on('submit(toRegistButton)', function(data){
       // alert(data.field);
       if (data.field.password.length<6) {
        layer.msg("密码至少得6个字符", {
            icon: 5,
            anim: 6
        });
        return false;
    }
    if (data.field.password !== data.field.password_re) {
        layer.msg("两次密码输入不一致", {
            icon: 5,
            anim: 6
        });
        return false;
    }
       // return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
         
     });

}();
	//异步请求用户名是否唯一
	 function   validate(obj){
           if(obj.value!=""){
           $.ajax({
		       type:"post",
		       cache:false,
		       data: {  "logname":obj.value},
		       dataType:"json",
		       url: "${path}/system/login/validateLogName.htm",
		       success: function(fielddata){
		           if(fielddata.result){//用户名已存在
		             $("#alertMess").text("用户名已存在！").css("color","red ");
		             $("#regBut").attr("disabled", true);
		            
		           }else{
		             $("#alertMess").text("");
		              $("#regBut").attr("disabled", false);
		           }
		     },
		     error : function(){
		 	    alertMsg.error("数据加载异常！");
		      }  
	      });  
          }
         
       } 
	
	
	  
	
</script>
</body>
</html>