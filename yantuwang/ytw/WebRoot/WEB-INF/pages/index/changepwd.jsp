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
	<title>研途网</title>
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
	<div class="larry-personal" style="margin-top: 20px;margin-right: 20px;">
			<form class="layui-form col-lg-4" method="post" action="${path }/savePwd.htm">
			 	<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">  
					  	<input type="text" name="logname"  autocomplete="off"  class="layui-input " value="${user.logname }" disabled="disabled" >
					    <input type="hidden" name="userid"  autocomplete="off"  class="layui-input layui-disabled" value="${user.userid }" disabled="disabled" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">旧密码</label>
					<div class="layui-input-inline">  
					  	<input type="password" name="oldpass"  autocomplete="off"  class="layui-input" value="" placeholder="请输入旧密码">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">新密码</label>
					<div class="layui-input-inline">  
					  	<input type="password" name="newpass"  autocomplete="off"  class="layui-input" value="" placeholder="请输入新密码">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-inline">  
					  	<input type="password" name="newconfimpass"  autocomplete="off"  class="layui-input" value="" placeholder="请输入确认新密码">
					</div>
				</div>
				<div class="layui-form-item change-submit">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="changePassword">保存</button>
					</div>
				</div>
			</form>
		
	</div>
</section>
<script type="text/javascript" src="${path}/common/layui/layui.all.js"></script>
<script  type="text/javascript"  src="${path}/js/jquery.js"></script>
<script type="text/javascript">
;!function(){
         var form = layui.form;
         
          //立即提交
          form.on('submit(changePassword)', function(data){
          //判断两次密码是否一致
            if (data.field.newpass.length<6) {
              layer.msg("密码至少得6个字符", {
              icon: 5,
              anim: 6
                });
             return false;
         }
           if (data.field.newpass !== data.field.newconfimpass) {
             layer.msg("两次密码输入不一致", {
             icon: 5,
             anim: 6
              });
             return false;
          }else{
               //使用ajax提交
           $.ajax({
		       type:"post",
		       cache:false,
		       data: data.field,
		       dataType:"json",
		       url: "${path }/system/login/changePwd.htm",
		       success: function(fielddata){
		           if(fielddata.result== "501"){
		            layer.alert("原密码不正确！", {
                    title: "提示"
                    ,anim: 0
                    ,icon: 5
                    ,time: 2000
                   });
                   
		          }else if(fielddata.result== "200"){
		          layer.alert("修改成功！", {
                    title: "提示"
                    ,anim: 0
                    ,icon: 6
                    ,time: 2000
                   });
                   var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引，再关闭自己
                      parent.layer.close(index);
                   window.location.href="${path}/noLongin.htm";
		         }else{
		           layer.alert("修改失败！", {
                    title: "提示"
                    ,anim: 0
                    ,icon: 5
                    ,time: 2000
                   });
		         }
		     },
		     error : function(){
		 	 alertMsg.error("数据加载异常！");
		      }  
	      });  
	        return false;//禁止layui提交方式 
         }
        });  
          
}();	
</script>
</body>
</html>