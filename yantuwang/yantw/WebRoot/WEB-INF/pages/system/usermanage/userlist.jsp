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
			  <!-- 查询操作-->
				<blockquote class="layui-elem-quote news_search" id="search_quote" >
                    <span  style="font:14px Helvetica Neue,Helvetica,PingFang SC,\5FAE\8F6F\96C5\9ED1,Tahoma,Arial,sans-serif"> 登录名：</span>
                    <div class="layui-inline">
                     <input name="logname" class="layui-input" placeholder="请输入">
                    </div>
                     <span  style="font:14px Helvetica Neue,Helvetica,PingFang SC,\5FAE\8F6F\96C5\9ED1,Tahoma,Arial,sans-serif"> 用户姓名：</span>
                     <div class="layui-inline">
                     <input name="username" class="layui-input" placeholder="请输入">
                     </div>
                     <span  style="font:14px Helvetica Neue,Helvetica,PingFang SC,\5FAE\8F6F\96C5\9ED1,Tahoma,Arial,sans-serif"> 所属单位：</span>
                     <div class="layui-inline ">
                        <div class="layui-form">
                         <div class="layui-inline ">
							<select name="orgid" id="select_orgid"  lay-search  >
							<option value="" >请输入搜索</option>
							 <c:forEach items="${orgList }" var="org">
							<option value="${org.orgid }">${org.orgname }</option>
							</c:forEach> 
							</select>
						</div> 
					    </div> 
                    </div> 
                     <div class="layui-btn-group">
                     <button class="layui-btn layui-btn-warm" id="usersearch_id">搜索</button>
                     <button class="layui-btn layui-btn-danger" id="usersearchempty_id">重置</button>
                     <button class="layui-btn layui-btn-normal" id="bindrole">绑定用户组</button>
                     <button class="layui-btn "  id="adduser" >增加</button>
                     <button class="layui-btn "  id="edituser" >修改</button>
                     <button class="layui-btn "  id="deleteuser">删除</button>
                    </div>
				</blockquote>
				 <!-- 查询操作-->
					<!-- table数据展示 -->
					<div class="layui-tab-item layui-field-box layui-show" >
						<table id="users_tableid" class="layui-table table-hover " lay-filter="users_table" lay-even=""  lay-data="{id: 'userid'}">
						</table>
					</div>
				
			</div>
		</div>
	</section>
	<script type="text/javascript" src="${path }/common/layui/layui2.all.js"></script>
	<script type="text/javascript" src="${path }/js/jquery.js"></script>
	<script type="text/javascript">
;!function(){
	
  var table = layui.table, laypage = layui.laypage,
  layer = layui.layer, form = layui.form;
  //表格初始化
    table.render({
     id:'userid'//对象主键名称
    ,elem:'#users_tableid'//表格id
    ,height: 'full-120'//高度最大化适应,full为固定参数，数字可随意调整
    ,url:'${path}/system/usermanage/listfortable.htm'//请求url
    ,cols: [[//列名
      {type:'checkbox'}
      ,{field:'logname', width:120, title: '登录名'}
      ,{field:'username', width:120, title: '用户姓名'}
      ,{field:'phonenum', width:200, title: '联系电话'}
      ,{field:'email',  width:200,title: 'Email'}//width 支持：数字、百分比和不填写
      ,{field:'orgname', title: '所属单位'}
    ]]
    ,limit:10//每页显示的条数
    ,page:{//可自定义分页，以下是我自己的自定义
        curr:1  //当前页
       ,goups:5  //连续出现的页码个数
       ,first:'首页'//自定义首页
       ,last:'尾页'//自定义尾页
       ,layout: ['first', 'prev', 'page', 'next' ,'last','count']//自定义排版分页
    }
    ,done: function(res, curr, count){
    //如果是异步请求数据方式，res即为你接口返回的信息。
    //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
    //加载完数据再开始渲染分页
     }
  });
  
	  //查询
       $('#usersearch_id').on('click', function(){
            //alert($("select[name='orgid']").val());
              //表格数据重载
              table.reload('userid',{
                where: { //传输查询条件参数
                    username:$("input[name='username']").val(),
                    logname:$("input[name='logname']").val(),
                    orgid:$("select[name='orgid']").val()
                }
                ,limit:10
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }

              });
          });
         //重置
       $('#usersearchempty_id').on('click', function(){
            $("input[name='username']").val("");
            $("input[name='logname']").val("");
            $("#select_orgid").find("option[value = '']").attr("selected","selected");
            form.render();//select下拉框需要重新渲染
              //表格数据重载
              table.reload('userid',{
                where: { //传输查询条件参数
                    username:$("input[name='username']").val(),
                    logname:$("input[name='logname']").val(),
                    orgid:$("select[name='orgid']").val()
                }
                ,limit:10
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }

              });
          });
        
       //增加
       $("#adduser").click(function(){
               layer.open({
                type: 2// 2是iframe层
               ,title:'增加用户'//对话框标题
               ,area:['850px','520px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'useradd_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/system/usermanage/toAdd.htm"//对话框显示内容,装的是页面
             });
       });
        //修改
        $("#edituser").click(function(){
           var checkStatus = table.checkStatus('userid');
           data = checkStatus.data;
           //alert(data.length);
           if(data.length==0){
                layer.msg('请选择需要修改的用户！', {
                 btn: [ '知道啦']
                ,btnAlign: 'c' //按钮居中
                ,anim:6//弹出动画，抖动
                });
            }else if(checkStatus.data.length > 1){
               layer.msg('只能选择一条进行修改哦~', {
                 btn: [ '知道啦']
                ,btnAlign: 'c' //按钮居中
                ,anim:6//弹出动画，抖动
                });

            }else{
             var userid=data[0].userid;
             layer.open({
                type: 2// 2是iframe层
               ,title:'修改用户'//对话框标题
               ,area:['850px','520px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'useredit_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/system/usermanage/toEdit.htm?userid="+userid+""//对话框显示内容,装的是页面
             });
            }
        });
        //绑定用户组，支持多选
        $("#bindrole").click(function(){
           var checkStatus = table.checkStatus('userid');
           data = checkStatus.data;
           if(data.length==0){
                layer.msg('请选择需要绑定的用户！', {
                btn: [ '知道啦']
                ,btnAlign: 'c' //按钮居中
                ,anim:6//弹出动画，抖动
                });
            }else if(checkStatus.data.length > 1){
               layer.msg('只能选择一条进行绑定哦~', {
                 btn: [ '知道啦']
                ,btnAlign: 'c' //按钮居中
                ,anim:6//弹出动画，抖动
                });

            }else{
             var userid=data[0].userid;
             layer.open({
                type: 2// 2是iframe层
               ,title:'绑定用户组'//对话框标题
               ,area:['650px','350px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'bindrole_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/system/usermanage/toBindRole.htm?userid="+userid+""//对话框显示内容,装的是页面
             });
            }
        });
       //删除,支持多条删除
       $("#deleteuser").click(function(){
           var checkStatus = table.checkStatus('userid');
           var str=JSON.stringify(checkStatus.data);
            if(checkStatus.data.length==0){
                layer.msg('请选择需要删除的用户！', {
                btn: [ '知道啦']
                ,btnAlign: 'c' //按钮居中
                ,anim:6//弹出动画，抖动
                });
            }else{
                layer.confirm("确定要删除吗！", {
                    title: "提示"
                   ,icon: 3//图标
                   ,yes:function(index, layero){//成功后跳转至列表
                     location.href = "${path}/system/usermanage/delete.htm?deleteStr="+str+"";
                     layer.close(index);//需要手动关闭提示框,确定
                     }
                   }); 
            }
       });
       //操作反馈
       var r= $("#opResultid").val();
       if(r=='500'){
        layer.alert("操作失败咯~", {
                    title: "提示"
                    ,anim: 0
                    ,icon: 5
                    ,time: 2000
                   });
   
       }else if(r=='200'){
       layer.alert("操作成功啦~", {
                    title: "提示"
                    ,anim: 0
                    ,icon: 6
                    ,time: 2000
                   });
     }
     
     
		
		
}();	
	</script>
	
</body>

</html>