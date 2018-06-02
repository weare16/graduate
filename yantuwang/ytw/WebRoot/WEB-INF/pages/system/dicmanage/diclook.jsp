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
						<label class="layui-form-label">业务字典名称</label>
						<div class="layui-input-inline">
							<input type="text" name="busintypename"   lay-verify="required"  class="layui-input " value="${name }" disabled="disabled">
						</div>
					 </div>
					 <div class="layui-form-item">
						<label class="layui-form-label">业务字典编码</label>
						<div class="layui-input-inline">
							<input type="text" name="busintypeid"   lay-verify="required"  class="layui-input " value="${typeid }" disabled="disabled">
						</div>
					 </div>
					 <div class="layui-form-item">
					 <table class="layui-table" >
                         <thead>
                         <tr>
                         <th rowspan="2" lay-data="{field:'BUSINID', width:150}">字典明细代码</th>
                         <th rowspan="3" lay-data="{field:'BUSINNAME'}">字典明细名称</th>
                         <th rowspan="2" lay-data="{field:'status', width:120}">是否可用</th>
                         </tr>
                         </thead>
                         <tbody id="add_configuration_tbodyid">
                         <c:forEach  items="${dicList }" var="list">
                         <tr id="addbtn_tbody_tr_id0">
                              <td style="width: 150px;">${list.BUSINID }</td>
                              <td style="width: 150px;">${list.BUSINNAME }</td>
                              <td style="width: 120px;">
                                <c:if test="${list.status eq '0' }">可用</c:if>
                                <c:if test="${list.status eq null  || list.status eq ''}">禁用</c:if>
                              </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </div>
				</form>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="${path }/common/layui/layui.js"></script>
	<script  type="text/javascript"  src="${path}/js/jquery.js"></script>
	<script type="text/javascript">
		
	 	  
		
	</script>
</body>
</html>