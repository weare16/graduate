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
	href="${path }/common/layui/css/layui2.css" media="all">
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
				<form    class="layui-form col-lg-2 " action="${path}/system/usermanage/Add.htm" method="post">
					<div class="layui-form-item ">
					 <div class="layui-inline">
						<label class="layui-form-label">登录名</label>
						<div class="layui-input-inline ">
							<input type="text" name="logname"   lay-verify="required"  class="layui-input "
								value="" >
						</div>
					  </div>
					  <div class="layui-inline">
					   <label class="layui-form-label">登录密码</label>
						<div class="layui-input-inline">
							<input type="password" name="password"   lay-verify="required"  class="layui-input "
								value="">
						</div>
					  </div>
					 </div>
					 <div class="layui-form-item">
					 <div class="layui-inline">
						<label class="layui-form-label">用户姓名</label>
						<div class="layui-input-inline">
							<input type="text" name="username"   lay-verify="required"  class="layui-input "
								value="">
						</div>
					 </div>
					 <div class="layui-inline">
					    <label class="layui-form-label">联系电话</label>
						<div class="layui-input-inline">
							<input type="text" name="phonenum"   lay-verify="phone"  class="layui-input "
								value="">
						</div>
					 </div>
					 </div>
					  <div class="layui-form-item">
					  <div class="layui-inline">
						<label class="layui-form-label">Email</label>
						<div class="layui-input-inline">
							<input type="text" name="email"   lay-verify="email"  class="layui-input "
								value="">
						</div>
					 </div>
					 </div>
					 <div class="layui-form-item">
						<label class="layui-form-label">所属单位</label>
						<div class="layui-input-block">
							<select name="org.orgid" lay-verify="required" lay-search>
							<option value="">请输入搜索</option>
							 <c:forEach items="${orgList }" var="org">
							<option value="${org.orgid }">${org.orgname }</option>
							</c:forEach> 
							</select>
						</div>
					 </div>
					 <div class="layui-form-item">
						<label class="layui-form-label">所属用户组</label>
						<div class="layui-input-block">
						    
							<!-- <select name="groupid" lay-verify="required" lay-search=""> -->
							<!-- <option value="">请输入搜索</option> -->
							<c:forEach items="${groupList }" var="group">
							<%-- <option value="${group.usergpid }">${group.usergpname }</option> --%>
							<input type="checkbox" name="groupid[${group.usergpid }]" title="${group.usergpname }" value="${group.usergpid }"> 
							</c:forEach>
							<!-- </select> -->
						</div>
					 </div>
					 <div class="layui-form-item">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-block">
							<input type="text" name="remark"     class="layui-input "
								value="">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="adduser">立即提交</button>
							<a id="returntouserid"  class="layui-btn layui-btn-primary "  >返回</a>
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
		var form = layui.form,layer = layui.layer;
		var grouparr=[];
	     //立即提交
          form.on('submit(adduser)', function(data){
           //layer.msg(JSON.stringify(data.field));
           //使用ajax提交
           $.ajax({
		       type:"post",
		       cache:false,
		       data: data.field,
		       dataType:"json",
		       url: "${path}/system/usermanage/Add.htm?groupid="+grouparr+"",
		       success: function(fielddata){
		           if(fielddata.result== "500"){
		            layer.alert("保存失败！", {
                    title: "提示"
                    ,anim: 0
                    ,icon: 5
                    ,time: 2000
                   });
		          }else if(fielddata.result!= "500"){
		           var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引，再关闭自己
                   parent.layer.close(index); 
                   window.parent.location.href = "${path}/system/usermanage/toList.htm?result="+fielddata.result;//成功后跳转至列表并提示用户成功
                   
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
         //返回
         $("#returntouserid").click(function (){
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引，再关闭自己
            parent.layer.close(index); 
           $("#returntouserid").attr("href","${path}/system/usermanage/toList.htm");
         
         
         });
         //复选框监听
         form.on('checkbox()', function(data){
           if(data.elem.checked){//是否被选中，true或者false
            grouparr.push(data.elem.value);//选中
           }else{
            grouparr.pop(data.elem.value);//移除
           }
        });


		}();	
		
	 	  
		
	</script>
</body>
</html>