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
			<blockquote class="layui-elem-quote news_search" id="search_quote" >
			  <input id="groupOpResultid"  type="hidden" value="${groupResult}" /> 
			  <!-- 查询操作-->
			  <div class="demoTable">
               <span  style="font:14px Helvetica Neue,Helvetica,PingFang SC,\5FAE\8F6F\96C5\9ED1,Tahoma,Arial,sans-serif"> 用户组：</span>
               <div class="layui-inline">
               <input name="usergpname" class="layui-input" placeholder="请输入">
               </div>
               
               <div class="layui-btn-group">
               <button class="layui-btn layui-btn-warm" id="searchgroup">搜索</button>
               <button class="layui-btn layui-btn-normal" id="bindmenu">绑定菜单</button>
               <button class="layui-btn "  id="addgroup" >增加</button>
               <button class="layui-btn "  id="editgroup" >修改</button>
               <button class="layui-btn "  id="deletegroup">删除</button>
               </div>
              </div>
              </blockquote>
				<!-- table数据展示 -->
				<div class="layui-tab-item layui-field-box layui-show" >
					<table id="group_tableid" class="layui-table table-hover " lay-filter="group_table" lay-even=""  lay-data="{id: 'usergpid'}">
					</table>
				</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="${path }/common/layui/layui2.all.js"></script>
	<script type="text/javascript" src="${path }/js/jquery.js"></script>
	<script type="text/javascript">
;!function(){
	
  var table = layui.table, laypage = layui.laypage,
  layer = layui.layer;
  //表格初始化
    table.render({
     id:'usergpid'//对象主键名称
    ,elem:'#group_tableid'//表格id
    ,height: 'full-120'//高度最大化适应,full为固定参数，数字可随意调整
    ,url:'${path}/system/rolemanage/listfortable.htm'//请求url
    ,cols: [[//列名
       {type:'checkbox'}
      ,{field:'usergpname', width:120, title: '用户组'}
      ,{field:'usergpdesc',  title: '用户组描述'}
      ,{field:'isactive', width:120, title: '可用状态'}
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
       $('#searchgroup').on('click', function(){
            //表格数据重载
              table.reload('usergpid',{
                where: { //设定异步数据接口的额外参数，任意设
                    usergpname:$("input[name='usergpname']").val(),
                }
                ,limit:10
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }

              });
        });	
        //增加
       $("#addgroup").click(function(){
               layer.open({
                type: 2// 2是iframe层
               ,title:'增加用户组'//对话框标题
               ,area:['500px','370px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'addgroup_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/system/rolemanage/toAdd.htm"//对话框显示内容,装的是页面
             });
       });
        //编辑
        $("#editgroup").click(function(){
           var checkStatus = table.checkStatus('usergpid');
           data = checkStatus.data;
           if(data.length==0){
                layer.msg('请选择需要修改的数据！', {
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
            layer.open({
                type: 2// 2是iframe层
               ,title:'修改用户组'//对话框标题
               ,area:['500px','370px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'editgroup_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/system/rolemanage/toEdit.htm?usergpid="+data[0].usergpid+""//对话框显示内容,装的是页面
             });
            }
        });
       //删除,支持多条删除
       $("#deletegroup").click(function(){
           var checkStatus = table.checkStatus('usergpid');
           var str=JSON.stringify(checkStatus.data);
            if(checkStatus.data.length==0){
                layer.msg('请选择需要删除的数据！', {
                btn: [ '知道啦']
                ,btnAlign: 'c' //按钮居中
                ,anim:6//弹出动画，抖动
                });
            }else{
                layer.confirm("确定要删除吗！", {
                    title: "提示"
                   ,icon: 3//图标
                   ,yes:function(index, layero){//成功后跳转至列表
                     layer.close(index);//需要手动关闭提示框,确定
                     location.href = "${path}/system/rolemanage/delete.htm?deleteStr="+str+"";
                     
                     }
                   }); 
            }
       });
       //绑定菜单
        $("#bindmenu").click(function(){
           var checkStatus = table.checkStatus('usergpid');
           data = checkStatus.data;
           if(data.length==0){
                layer.msg('请选择需要绑定的组！', {
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
             var usergpid=data[0].usergpid;
             layer.open({
                type: 2// 2是iframe层
               ,title:'绑定菜单'//对话框标题
               ,area:['850px','550px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'bindrole_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/system/rolemanage/toBindMenu.htm?usergpid="+usergpid+""//对话框显示内容,装的是页面
             });
            }
        });
       //操作反馈
       var r= $("#groupOpResultid").val();
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