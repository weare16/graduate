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
							<input type="text" name="busintypename"   lay-verify="required"  class="layui-input " value="${name }" >
						</div>
					 </div>
					 <div class="layui-form-item">
						<label class="layui-form-label">业务字典编码</label>
						<div class="layui-input-inline">
							<input type="text" name="busintypeid"   lay-verify="required"  class="layui-input " value="${typeid }" >
						</div>
					 </div>
					 <div class="layui-form-item">
					 <table class="layui-table" >
                         <thead>
                         <tr>
                         <th rowspan="2" lay-data="{field:'BUSINID', width:150}">字典明细代码</th>
                         <th rowspan="3" lay-data="{field:'BUSINNAME'}">字典明细名称</th>
                         <th rowspan="2" lay-data="{field:'status', width:120}">是否可用</th>
                         <th rowspan="2" >操作</th>
                         </tr>
                         </thead>
                         <tbody id="add_configuration_tbodyid">
                         <c:forEach  items="${dicList }" var="list">
                         <tr id="addbtn_tbody_tr_id0">
                              <td style="width: 150px;"><input type="text" name="BUSINID"    lay-verify="required"  class="layui-input " value="${list.BUSINID }"></td>
                              <td style="width: 150px;"><input type="text" name="BUSINNAME"    lay-verify="required"  class="layui-input " value="${list.BUSINNAME }"></td>
                              <td style="width: 120px;"><input type="checkbox" name="status"   lay-verify="required" lay-skin="switch"   value="0" ${list.status eq '0'? 'checked':'' }></td>
                              <td style="width: 160px;"> 
                              <button class="layui-btn layui-btn-sm  layui-btn-radius" lay-submit="" lay-filter="addrowfilter"> <i class="layui-icon">&#xe608;</i></button>
                              </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </div>
                    <div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="editdic">立即提交</button>
							<a href="${path}/system/dicmanage/toList.htm" class="layui-btn layui-btn-primary ">返回</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="${path }/common/layui/layui.js"></script>
	<script  type="text/javascript"  src="${path}/js/jquery.js"></script>
	<script type="text/javascript">
		layui.use([ 'form' ], function() {
			var form = layui.form();
		//增加一行
		form.on('submit(addrowfilter)', function(data){
             var tr = "";
            tr = "<tr >"
		      +"<td style='width: 150px;'><input type='text' name='BUSINID'   lay-verify='required'  class='layui-input ' value=''></td>"
		      +"<td style='width: 150px;'><input type='text' name='BUSINNAME'   lay-verify='required'  class='layui-input ' value=''></td>"
		      +"<td style='width: 120px;'><input type='checkbox' name='status'   lay-verify='required'  lay-skin='switch'  checked value='0'></td>"
		      +" <td style='width: 160px;'> "
              +"<button class='layui-btn layui-btn-sm  layui-btn-radius' lay-submit='' lay-filter='addrowfilter'> <i class='layui-icon'>&#xe608;</i></button>"               
              +" <button class='layui-btn layui-btn-sm layui-btn-danger layui-btn-radius' lay-submit='' lay-filter='deleterowfilter'> <i class='layui-icon'>&#xe640;</i></button>"
              +"</td>"  
           + "</tr>"; 
         var ctr= $("#add_configuration_tbodyid").find("tr:last");//获取最后一行
         ctr.after(tr);//追加一行
         form.render();//重新渲染表格，否则checkbox无法加载样式 
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
      });
		//删除一行
		form.on('submit(deleterowfilter)', function(data){
            var row = data.elem.parentNode.parentNode;
            var tb = row.parentNode;
            var rowindex = row.rowIndex;
            tb.deleteRow(rowindex-1);
            form.render();  
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
      });	
	     //提交监听提交
          form.on('submit(editdic)', function(data){
           //layer.msg(JSON.stringify(data.field));
           var BUSINIDarr=[];
           var BUSINNAMEarr=[];
           var statusArr=[];
            $.each($("input[name='BUSINID']"),function(){
                     BUSINIDarr.push($(this).val());
                     //layer.msg(BUSINIDarr);
            });
            $.each($("input[name='BUSINNAME']"),function(){
                     BUSINNAMEarr.push($(this).val());
            });
            $.each($("input[name='status']:checkbox"),function(){
              if($(this).attr("checked")){//选中为true
                statusArr.push($(this).val());
                //alert("选中！");
              }else{
               statusArr.push(null);
                //alert("未选中！");
              }
                     
            });
           //使用ajax提交
           $.ajax({
		       type:"post",
		       cache:false,
		       data: data.field,
		       dataType:"json",
		       url: "${path}/system/dicmanage/Edit.htm?BUSINIDarr="+BUSINIDarr+"&BUSINNAMEarr="+BUSINNAMEarr+"&statusArr="+statusArr+"",
		       success: function(fielddata){
		           if(fielddata.result== "500"){
		            layer.alert("保存失败！", {
                    title: "提示"
                    ,anim: 0
                    ,icon: 5
                    ,time: 2000
                   });
		          }else if(fielddata.result== "200"){
                   location.href = "${path}/system/dicmanage/toList.htm?result=200";//成功后跳转至列表并提示用户成功
                   
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