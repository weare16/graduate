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
</head>

<body>
	<section class="layui-larry-box">
		<div class="larry-personal">
			<div class="layui-tab">
			      <input id="opResultid"  type="hidden" value="${result}" >
			      <div class="layui-inline " style="margin-top: 10px;">       
                  <div class="layui-btn-group">
                  <button class="layui-btn "  id="toadd_org" ><i class="layui-icon">&#xe608;</i>新增机构</button>
                  <button class="layui-btn "  id="toedit_org" > <i class="layui-icon">&#xe642;</i>修改机构</button>
                  <button class="layui-btn "  id="todelete_org"> <i class="layui-icon">&#xe640;</i>删除机构</button>
                  </div>
                    </div>
                  
				 <div class="layui-inline col-lg-3" style="margin-top: 10px;">
				  <div class="layui-collapse" lay-filter="org_collapse" lay-accordion="">
					<c:forEach items="${orglist }"  var="list">
					   <div class="layui-colla-item">
							<h2   class="layui-colla-title" style="background-color: #fff;" onclick="ischangeData('${list.orgid }','${list.orgname }');">${list.orgname }</h2>
							 <c:if test="${not empty list.sonorglist }">
							 <div class="layui-colla-content " layui-show>
							 <div class="layui-collapse" lay-accordion="">
							 <c:forEach items="${list.sonorglist }"  var="sonlist">
							 <div class="layui-colla-item">
							     <h2   class="layui-colla-title"  onclick="ischangeData('${sonlist.orgid }','${sonlist.orgname }');">${sonlist.orgname }</h2>
							      <c:if test="${not empty sonlist.sonorglist }">
							         <div class="layui-colla-content " layui-show>
							          <div class="layui-collapse" lay-accordion="">
							          <c:forEach items="${sonlist.sonorglist }"  var="grasonlist">
							          <div class="layui-colla-item">
							             <h2   class="layui-colla-title"  onclick="ischangeData('${grasonlist.orgid }','${grasonlist.orgname }');">${grasonlist.orgname }</h2>
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
				</div>
				 
				<div class="layui-inline col-lg-9 " style="padding-left: 0px;">
					<!-- table数据展示 -->
					<div class="layui-tab-item layui-field-box layui-show">
						<table id="user_tableid" class="layui-table table-hover "
							lay-filter="users_table" lay-even="" lay-data="{id: 'userid'}">
						</table>
						<div class="larry-table-page clearfix">
							<div id="goodspage_id"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
	<script type="text/javascript" src="${path }/common/layui/layui2.all.js"></script>
	<script type="text/javascript" src="${path }/js/jquery.js"></script>
	<script type="text/javascript">
		
		var orgid;
		var orgname;
		;!function() {

			var table = layui.table, laypage = layui.laypage, layer = layui.layer;
			var element = layui.element;
			//表格初始化
			table.render({
						id : 'userid'//对象主键名称
						,elem : '#user_tableid'//表格id
						,height : 'full-120'//高度最大化适应,full为固定参数，数字可随意调整
						,url : '${path}/system/orgmanage/listfortable.htm'//请求url
						,cols: [[//列名
                         {field:'logname', width:120, title: '登录名'}
                         ,{field:'username', width:120, title: '用户姓名'}
                         ,{field:'phonenum', width:200, title: '联系电话'}
                          ,{field:'email',  width:200,title: 'Email'}//width 支持：数字、百分比和不填写
                         ,{field:'orgname', title: '所属单位'}
                         ]],
						limit : 10//每页显示的条数
						,page : {//可自定义分页，以下是我自己的自定义
							curr : 1 //当前页
							,goups : 5 //连续出现的页码个数
							,first : '首页'//自定义首页
							,last : '尾页'//自定义尾页
							,layout : [ 'first', 'prev', 'page', 'next', 'last','count' ]
						//自定义排版分页
						},
						done : function(res, curr, count) {
							//如果是异步请求数据方式，res即为你接口返回的信息。
							//如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
							//加载完数据再开始渲染分页
						}
					});

			//监听折叠
            element.on('collapse(org_collapse)', function(data){
               if(data.show){//得到当前面板的展开状态，true或者false
               var id=orgid;
               //layer.msg(id);
                //配置一个透明的询问框
                /* layer.msg(orgname, {
                 time: 3000 //3s后自动关闭
                 ,offset: ['100px', '150px']
                 ,btn: ['修改', '删除']
                });  */
               //表格数据重载
                table.reload('userid',{
                where: { //设定异步数据接口的额外参数，任意设
                    orgid:id,
                }
                ,limit:10
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }

              });
               
               
               }
           });
			
			//操作反馈
			var r = $("#opResultid").val();
			if (r == '500') {
				layer.alert("操作失败咯~", {
					title : "提示",
					anim : 0,
					icon : 5,
					time : 2000
				});

			} else if (r == '200') {
				layer.alert("操作成功啦~", {
					title : "提示",
					anim : 0,
					icon : 6,
					time : 2000
				});
			}else if (r == '501') {
				layer.alert("当前机构下存在人员</br>不能删除~", {
					title : "提示",
					anim : 0,
					icon : 5,
					time : 2000
				});
			}
			//增加机构，弹框形式
			$("#toadd_org").click(function() {
					layer.open({
						type : 2// 2是iframe层
						,title : '新增机构'//对话框标题
						,area : [ '800px', '520px' ]//对话框高度和宽度
						,shade : 0.4//对话框背景阴影度
						,id : 'orgadd_LAY'//防止点击按钮时同时弹出多个对话框
						,content : "${path}/system/orgmanage/toAdd.htm"//对话框显示内容,装的是页面
					});
			});
			//修改机构，弹框形式
			$("#toedit_org").click(function() {
				if(orgid==''|| null==orgid){
                layer.msg('请选择需要修改的机构！', {
                 btn: [ '知道啦']
                ,btnAlign: 'c' //按钮居中
                ,anim:6//弹出动画，抖动
                });
               }else{
               layer.open({
						type : 2// 2是iframe层
						,title : '修改机构'//对话框标题
						,area : [ '800px', '520px' ]//对话框高度和宽度
						,shade : 0.4//对话框背景阴影度
						,id : 'orgedit_LAY'//防止点击按钮时同时弹出多个对话框
						,content : "${path}/system/orgmanage/toEdit.htm?orgid="+orgid//对话框显示内容,装的是页面
					});
               
               }	
			});

           //删除,
        $("#todelete_org").click(function(){
            if(orgid==''|| null==orgid){
                layer.msg('请选择需要删除的机构！', {
                 btn: [ '知道啦']
                ,btnAlign: 'c' //按钮居中
                ,anim:6//弹出动画，抖动
                });
             }else{
                layer.confirm("确定要删除吗！", {
                    title: "提示"
                   ,icon: 3//图标
                   ,yes:function(index, layero){//成功后跳转至列表
                     location.href = "${path}/system/orgmanage/delete.htm?orgid="+orgid+"";
                     layer.close(index);//需要手动关闭提示框,确定
                     }
                   }); 
            }
       });





		
		}();
		//面板点击事件，普通的方法不能放在layui加载模块中，否则不起作用
		function	ischangeData(id,name){
		  orgid=id;
		  orgname=name;
		
		}
		
		
	</script>

</body>

</html>