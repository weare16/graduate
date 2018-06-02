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
		<div class="larry-personal-body clearfix">
			<form class="layui-form col-lg-5 " action="${path}/pages/goods/audit.htm" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">审核人</label>
					<div class="layui-input-block">
					     <input type="hidden" name="auditStr"    class="layui-input " value="${auditStr }"   > 
					     <input type="hidden" name="auditperson"    class="layui-input " value="${userid }"   >  
						<input type="text"     class="layui-input " value="${username }"   >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">审核时间</label>
					<div class="layui-input-block">
						<input type="text" name="audittime"   class="layui-input " value="${time }" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">审核意见</label>
					<div class="layui-input-block">
						<input name="suggestion" title="同意" type="radio" checked="" value="0">
                        <input name="suggestion" title="不同意" type="radio" value="1">
						
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="auditGoodsId">提交</button>
						<!-- <button type="reset" lay-submit="" class="layui-btn layui-btn-primary" lay-filter="resetGoodCondition">重置</button> -->
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="${path }/common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['form','layer'],function(){
         var form = layui.form();
         var layer = layui.layer;
        //监听提交
        form.on('submit(auditGoodsId)', function(){
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引，再关闭自己
        parent.layer.close(index); 
        });
	});
	
	//字典编号唯一性校验，ie兼容模式
	
	
      
	
</script>
</body>
</html>