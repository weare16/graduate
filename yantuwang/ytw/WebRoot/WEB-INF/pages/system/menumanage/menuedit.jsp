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
				<form  class="layui-form col-lg-8 " action="${path}/system/menumanage/Edit.htm" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">菜单名称</label>
						<div class="layui-input-block">
							<input type="text" name="menuname" required lay-verify="required"
								class="layui-input " value="${menu.menuname}">
							<input type="hidden" name="menuid" required lay-verify="required"
								class="layui-input " value="${menu.menuid}" disabled>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">菜单图标</label>
						<div class="layui-input-block">
							<input type="text" name="menuflag"  
								class="layui-input " value="${menu.menuflag}">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">菜单顺序</label>
						<div class="layui-input-block">
							<input type="text" name="menuorder"  lay-verify="required|number"
								class="layui-input " value="${menu.menuorder}">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">菜单链接</label>
						<div class="layui-input-block">
							<input type="text" name="menuurl"  
								class="layui-input " value="${menu.menuurl}">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">父级菜单</label>
						<div class="layui-input-block">
						   <input type="hidden" id="pmenuid_id"  value="${menu.pmenuid}" > 
							<select name="pmenuid"  id="select_editpmenuid"    lay-verify="required"  lay-search>
								<option value="">请输入搜索</option>
								<option value="0">无</option>
								<c:forEach items="${menuList }" var="list">
								<option value="${list.menuid }">${list.menuname }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">菜单类型</label>
						<div class="layui-input-block">
						<input type="hidden" id="menulv_id"  value="${menu.menulv}" >
							<select name="menulv" id="select_editmenulv"   lay-verify="required"   >
							 <option value="" >请选择</option>
							 <option value="1" >一级菜单</option>
							 <option value="2" >二级菜单</option>
							 <option value="3" >三级菜单</option>
							 <option value="4" >按钮</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">可用状态</label>
						<div class="layui-input-block">
						    <input type="hidden" id="isactive_id" value="${menu.isactive }" >
							<input name="isactive" type="checkbox"  lay-skin="switch"  lay-text="ON|OFF" value="0">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="editmenu">立即提交</button>
							<a  id="returntomenulist"  class="layui-btn layui-btn-primary ">返回</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="${path }/common/layui/layui2.all.js"></script>
	<script  type="text/javascript"  src="${path}/js/jquery.js"></script>
	<script type="text/javascript">
	;!function(){
      var layer = layui.layer
      ,form = layui.form;
       //数据渲染
       //下拉框自动选中
       var pmid=$("#pmenuid_id").val();
       $("#select_editpmenuid").find("option[value = "+pmid+"]").attr("selected","selected");
       var mlid=$("#menulv_id").val();
       $("#select_editmenulv").find("option[value = "+mlid+"]").attr("selected","selected");
       //switch开关选中
       var  state=$("#isactive_id").val();
        if(state=='0'){
	       $("input[name='isactive']").attr('checked',true);
	   }
       form.render();//js自动选中，需要重新渲染
      
      
       //返回
         $("#returntomenulist").click(function (){
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引，再关闭自己
           parent.layer.close(index);  
           $("#returntoorgid").attr("href","${path}/system/orgmanage/toList.htm");
         });
        //提交监听提交
          form.on('submit(editmenu)', function(data){
           //layer.msg(JSON.stringify(data.field));
           //使用ajax提交
           $.ajax({
		       type:"post",
		       cache:false,
		       data: data.field,
		       dataType:"json",
		       url: "${path}/system/menumanage/Edit.htm",
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
		           layer.msg(index);
                   parent.layer.close(index);
                   window.parent.location.href = "${path}/system/menumanage/toList.htm?result=200";//成功后跳转至列表并提示用户成功
		         }else{
		           layer.alert("保存异常！", {
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
          }); 
         
         
 
   }();	
		 
	 	  
		
	</script>
</body>
</html>