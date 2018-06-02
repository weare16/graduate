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
<title>个人信息</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css"
	href="${path }/common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css"
	href="${path }/common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="${path }/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="${path }/css/personal.css"
	media="all">
</head>
<body>
	<section class="layui-larry-box">
		<div class="larry-personal">
			<div class="larry-personal-body clearfix">
				<form    class="layui-form col-lg-6 " action="" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">用户组名称</label>
						<div class="layui-input-block">
						   <input type="hidden" name="usergpid" required  lay-verify="required"  class="layui-input "
								value="${group.usergpid }" disabled>
							<input type="text" name="usergpname" required  lay-verify="required"  class="layui-input "
								value="${group.usergpname }">
						</div>
					  </div>
					 <div class="layui-form-item">
						<label class="layui-form-label">用户组描述</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="usergpdesc" placeholder="请输入内容" required lay-verify="required">${group.usergpdesc }</textarea>
						</div>
					 </div>
					 <div class="layui-form-item">
						<label class="layui-form-label">可用状态</label>
						<div class="layui-input-block">
						    <input type="hidden" id="gisactive" value="${group.isactive }" />
							<input type="checkbox" name="isactive" lay-skin="switch" lay-text="ON|OFF"  value="0" />
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="editgroup">立即提交</button>
							<a href="${path}/system/rolemanage/toList.htm" class="layui-btn layui-btn-primary ">返回</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="${path }/common/layui/layui.js"></script>
	<script  type="text/javascript"  src="${path}/js/jquery.js"></script>
	<script type="text/javascript">
		layui.use([ 'form', 'upload' ], function() {
			var form = layui.form();
		   
	     //提交监听提交
          form.on('submit(editgroup)', function(data){
           //layer.msg(JSON.stringify(data.field));
           //使用ajax提交
           $.ajax({
		       type:"post",
		       cache:false,
		       data: data.field,
		       dataType:"json",
		       url: "${path}/system/rolemanage/Edit.htm",
		       success: function(fielddata){
		           if(fielddata.result== "500"){
		            layer.alert("保存失败！", {
                    title: "提示"
                    ,anim: 0
                    ,icon: 5
                    ,time: 2000
                   });
		          }else if(fielddata.result== "200"){
		           var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引，再关闭自己
                   parent.layer.close(index); 
                   window.parent.location.href = "${path}/system/rolemanage/toList.htm?groupResult=200";//成功后跳转至列表并提示用户成功
                   
		         }else{
		           layer.alert("保存异常！", {
                   title: "提示"
                   
                   });
		         }
		     },
		     error : function(){
		 	 alertMsg.error("数据加载异常！");
		      }  
	      });  
	        return false;//禁止layui提交方式 
          });
          
          
          
          //switch开关选中
	       var  state= $("#gisactive").val(); 
	       if(state=='0'){
	            $("input[name='isactive']").attr("checked","checked");
	       } 
	       form.render();//js自动选中，需要重新渲染	
         
		});
		
	
		
	</script>
</body>
</html>