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
			<header class="larry-personal-tit">
				<span>商品信息</span>
			</header>
			<!-- /header -->
			<div class="larry-personal-body clearfix">
				<form id="addgoodsform"      class="layui-form col-lg-5 " action="" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">商品名称</label>
						<div class="layui-input-block">
						   <input type="hidden" name="goodsid"   class="layui-input "
								value="${goods.goodsid }">
							<input type="text" name="name" required  lay-verify="required"  class="layui-input "
								value="${goods.name }" disabled>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">商品编号</label>
						<div class="layui-input-block">
							<input type="text" name="number" required lay-verify="required"
								class="layui-input " value="${goods.number }" disabled>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">商品条码</label>
						<div class="layui-input-block">
							<input type="text" name="barcode" required lay-verify="required"
								class="layui-input " value="${goods.barcode }" disabled>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">商品规格</label>
						<div class="layui-input-block">
							<input type="text" name="measure" required lay-verify="required"
								class="layui-input " value="${goods.measure }" disabled>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">商品类别</label>
						<div class="layui-input-block">
						<input type="hidden" id="lookgoodscategory" value="${goods.category }">
							<select id="selectlookgoodscategory" name="category" lay-verify="" required disabled>
								<option value="">请选择</option>
								<option value="01" >饮料</option>
								<option value="02" >干果</option>
								<option value="05" >膨化食物</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">生产商/生产地</label>
						<div class="layui-input-block">
							<input type="text" name="producer" required lay-verify="required" class="layui-input "
								value="${goods.producer }" disabled>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">生产许可证号</label>
						<div class="layui-input-block">
							<input type="text" name="license" required lay-verify="required" 
								class="layui-input " value="${goods.license }" disabled>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">商品图片</label>
						<div class="layui-input-block">
							<input type="file" name="picture" class="layui-upload-file">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">库存预警</label>
						<div class="layui-input-block">
							<input type="checkbox" name="stockwarn" lay-skin="switch" lay-text="ON|OFF" value="${goods.stockwarn }" >
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">保质期预警</label>
						<div class="layui-input-block">
							<input type="checkbox" name="qualitywarn" lay-skin="switch" lay-text="ON|OFF" value="${goods.qualitywarn }" >
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<a href="${path}/pages/goods/list.htm" class="layui-btn layui-btn-primary ">返回</a>
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

		});
     //下拉框自动选中值
	var category= $("#lookgoodscategory").val();
	$("#selectlookgoodscategory").find("option[value = '"+category+"']").attr("selected","selected");
	//switch开关选中
	var  stockwarn= $("input[name='stockwarn']").val(); 
	var qualitywarn=$("input[name='qualitywarn']").val(); 
	if(stockwarn=='0'){
	$("input[name='stockwarn']").attr('checked','checked');
	}
	if(qualitywarn=='0'){
	$("input[name='qualitywarn']").attr('checked','checked');
	}  
		
	</script>
</body>
</html>