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
				<form    class="layui-form col-lg-2 " action="${path}/system/usermanage/bindRole.htm" method="post">
					
					 <div class="layui-form-item">
						<label class="layui-form-label">所属用户组</label>
						<div class="layui-input-block">
						    <input type="hidden" name="userid"  value="${userid}" disabled> 
						    <input type="hidden" id="ugarr_id"  value="${ugarr}" disabled > 
							<c:forEach items="${groupList }" var="group">
							  <input type="checkbox" name="groupid" title="${group.usergpname }" value="${group.usergpid }" > 
						   </c:forEach>
						  
						</div>
					 </div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="bindrolebtn">立即提交</button>
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
		var arr;
		var grouparr;
      //复选框自动选中
      if($("#ugarr_id").val().indexOf(",") > 0){//多个值
          arr=$("#ugarr_id").val().split(",");
	     for(var j = 0,len = arr.length; j < len; j++){
           $("input[name='groupid'][value="+arr[j]+"]").prop("checked","checked");
        }
        //获取复选框初始值
	    grouparr=arr;
      }else if($("#ugarr_id").val()!=''){//一个值
          $("input[name='groupid'][value="+$("#ugarr_id").val()+"]").prop("checked","checked");
      }else{//没有值
        grouparr=[];
      }
      form.render();//js自动选中，需要重新渲染
		
	  
	 //复选框监听
         form.on('checkbox()', function(data){
           if(data.elem.checked){//是否被选中，true或者false
            grouparr.push(data.elem.value);//选中
           }else{
            grouparr.pop(data.elem.value);//移除
           }
        });
		
	     //立即提交
          form.on('submit(bindrolebtn)', function(data){
           //layer.msg(JSON.stringify(data.field));
           //使用ajax提交
           $.ajax({
		       type:"post",
		       cache:false,
		       data: data.field,
		       dataType:"json",
		       url: "${path}/system/usermanage/bindRole.htm?grouparr="+grouparr+"",
		       success: function(fielddata){
		           if(fielddata.result== "500"){
		            layer.alert("绑定失败！", {
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
         



}();	
	
	
		
	 	  
		
	</script>
</body>
</html>