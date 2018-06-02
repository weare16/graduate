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
				<span>新增商品</span>
			</header>
			<!-- /header -->
			<div class="larry-personal-body clearfix">
				<form id="addgoodsform"      class="layui-form col-lg-8 " action="${path}/pages/goods/Add.htm" method="post">
					<div class="layui-form-item">
					  <div class="layui-inline">
						<label class="layui-form-label">商品名称</label>
						<div class="layui-input-inline">
							<input type="text" name="name" required  lay-verify="required"  class="layui-input "
								value="">
						</div>
					  </div>
					 <div class="layui-inline">
						<label class="layui-form-label">商品编号</label>
						<div class="layui-input-inline">
							<input type="text" name="number" required lay-verify="required"
								class="layui-input " value="">
						</div>
					 </div>
					</div>
					
					<div class="layui-form-item">
						<label class="layui-form-label">商品条码</label>
						<div class="layui-input-block">
							<input type="text" name="barcode" required lay-verify="required"
								class="layui-input " value="">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">商品规格</label>
						<div class="layui-input-block">
							<input type="text" name="measure" required lay-verify="required"
								class="layui-input " value="">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">商品类别</label>
						<div class="layui-input-block">
							<select name="category" lay-verify="" required>
								<option value="">请选择</option>
								<option value="01">饮料</option>
								<option value="02">干果</option>
								<option value="05">膨化食物</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">生产商/生产地</label>
						<div class="layui-input-block">
							<input type="text" name="producer" required lay-verify="required" class="layui-input "
								value="">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">生产许可证号</label>
						<div class="layui-input-block">
							<input type="text" name="license" required lay-verify="required" 
								class="layui-input ">
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
							<input type="checkbox" name="stockwarn" lay-skin="switch" lay-text="ON|OFF" lay-filter="switchStockwarn" value="0">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">保质期预警</label>
						<div class="layui-input-block">
							<input type="checkbox" name="qualitywarn" lay-skin="switch" lay-text="ON|OFF" lay-filter="switchSQualitywarn" value="0">
						</div>
					</div>

					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="addgoods">立即提交</button>
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
			var form = layui.form();
			//照片上传
			layui.upload({
				url : '',//上传接口 
				success : function(res) {
					//上传成功后的回调 
					console.log(res);
				}
			});
	     //提交监听提交
          form.on('submit(addgoods)', function(data){
           //layer.msg(JSON.stringify(data.field));
           //使用ajax提交
           $.ajax({
		       type:"post",
		       cache:false,
		       data: data.field,
		       dataType:"json",
		       url: "${path}/pages/goods/Add.htm",
		       success: function(fielddata){
		           if(fielddata.result== "500"){
		            layer.alert("保存失败！", {
                    title: "提示"
                    ,anim: 0
                    ,icon: 5
                    ,time: 2000
                   });
		          }else if(fielddata.result== "200"){
                   location.href = "${path}/pages/goods/list.htm?result=200";//成功后跳转至列表并提示用户成功
                  // 
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
         
    
         
          
          










		});
		
	 	  
		
	</script>
</body>
</html>