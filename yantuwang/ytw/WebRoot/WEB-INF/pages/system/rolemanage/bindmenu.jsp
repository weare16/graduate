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
			        <h2 class="layui-colla-title" style="padding-left: 15px;" ><input type="checkbox" id="tetst"  style="height:12px;" value="" onclick="getALLMenu(this)">Mtecc管理系统</h2>
			        <div class="layui-collapse" lay-filter="menu_collapse" lay-accordion  >
			        <c:forEach items="${menuList }" var="firstlist"  >
			        <div class="layui-colla-item " >
                        <h2 class="layui-colla-title" style="background-color: #fff;"><input    type="checkbox" name="menuid"  style="height:12px;" value="${firstlist.menuid }" onclick="getSonMenu(this)">${firstlist.menuname }</h2>
                         <c:if test="${not empty firstlist.sonlist }">
                         <div class="layui-colla-content layui-show" >
                        
                         <div class="layui-collapse" lay-accordion>
							 <c:forEach items="${firstlist.sonlist }"  var="sonlist">
							 <div class="layui-colla-item">
                             <h2 class="layui-colla-title" style="background-color: #fff;"><input    type="checkbox" name="menuid" style="height:12px;" value="${sonlist.menuid }" onclick="getSonMenu(this)">${sonlist.menuname }</h2>
                             <c:if test="${not empty sonlist.sonlist }">
                             <div class="layui-colla-content layui-show" >
                             
                             <div class="layui-collapse" lay-accordion>
                             <c:forEach items="${sonlist.sonlist }"  var="gsonlist">
                                 <div class="layui-colla-item">
                                  <h2 class="layui-colla-title" style="background-color: #fff;"><input type="checkbox" name="menuid" style="height:12px;" value="${gsonlist.menuid }" onclick="getSonMenu(this)">${gsonlist.menuname }</h2>
                                </div>
                             </c:forEach>
                             </div>
                             </div>
                            </c:if>
                           </div> 
                          </c:forEach>
                        </div>
                        </div>
                        </c:if>
					</div>
				    </c:forEach>
					</div>
				    <form    class="layui-form col-lg-2 " action="${path}/system/rolemanage/bindMenu.htm" method="post">
					<div class="layui-form-item">
						<div class="layui-input-block">
						    <input  type="hidden" name="groupid" value="${usergpid }">
						    <input type="hidden" id="gmarr_id"  value="${gmarr}" disabled > 
							<button class="layui-btn" lay-submit lay-filter="bindmenubtn">立即提交</button>
							<a id="returntolist"  class="layui-btn layui-btn-primary "  >返回</a>
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
  ,form = layui.form
 , element = layui.element;
 
      //复选框自动选中已绑定的菜单
      var c=$("#gmarr_id").val();
      if(c.indexOf(",") > 0){
          arr=$("#gmarr_id").val().split(",");
	     for(var j = 0,len = arr.length; j < len; j++){
           $("input[name='menuid'][value="+arr[j]+"]").prop("checked","checked");
        }
      }else if(c!=''){
          $("input[name='menuid'][value="+c+"]").prop("checked","checked");
      }
    //返回
         $("#returntolist").click(function (){
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引，再关闭自己
            parent.layer.close(index); 
           $("#returntouserid").attr("href","/system/rolemanage/toList.htm");
         
         
         });
      //监听折叠
            element.on('collapse(menu_collapse)', function(data){
               if(data.show){//得到当前面板的展开状态，true或者false
              
               }else{//始终让面板处于打开状态
                 $(".layui-colla-content").attr("class","layui-colla-content  layui-show ");
               }
               });
      //提交监听提交
          
          form.on('submit(bindmenubtn)', function(data){
            var menuarr=[];
            $.each($('input:checkbox:checked'),function(){
                     menuarr.push($(this).val());
                      //alert(menuarr);
            });
           //使用ajax提交
            $.ajax({
		       type:"post",
		       cache:false,
		       data: data.field,
		       dataType:"json",
		       url: "${path}/system/rolemanage/bindMenu.htm?menuarr="+menuarr,
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

}();
   //绑定全部菜单
	function getALLMenu(obj){
	  if(obj.checked){//选中全部菜单
	     $("input[name='menuid']").prop("checked",true);
	   }else{
	     $("input[name='menuid']").prop("checked",false);
	   }
	}
	//绑定全部子菜单
	function getSonMenu(obj){
	var b= obj.parentNode.parentNode.getElementsByTagName("input") ;//返回数组
	
	  if(obj.checked){//选中全部子菜单
	  
	    for( var i=0;i<b.length;i++){
            b[i].setAttribute("checked",true);
           }  
          
	  }else{//取消选中全部子菜单
	   
	        for( var j=0;j<b.length;j++){
            b[j].setAttribute("checked",false);
           // alert(b[j].getAttribute("checked"));
           } 
          
	   }
	}
		
	 	  
		
	</script>
</body>
</html>