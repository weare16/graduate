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
                    <span  style="font:14px Helvetica Neue,Helvetica,PingFang SC,\5FAE\8F6F\96C5\9ED1,Tahoma,Arial,sans-serif"> 菜单名称：</span>
                    <div class="layui-inline">
                     <input name="menuname" class="layui-input" placeholder="请输入">
                    </div>
                     <span  style="font:14px Helvetica Neue,Helvetica,PingFang SC,\5FAE\8F6F\96C5\9ED1,Tahoma,Arial,sans-serif"> 菜单类型：</span>
                     <div class="layui-inline ">
                        <div class="layui-form">
                         <div class="layui-inline ">
							<select name="menulv" id="select_menulv"    >
							 <option value="" >请选择</option>
							 <option value="1" >一级菜单</option>
							 <option value="2" >二级菜单</option>
							 <option value="3" >三级菜单</option>
							 <option value="4" >按钮</option>
							</select>
						</div> 
					    </div> 
                    </div> 
                     <span  style="font:14px Helvetica Neue,Helvetica,PingFang SC,\5FAE\8F6F\96C5\9ED1,Tahoma,Arial,sans-serif"> 可用状态：</span>
                     <div class="layui-inline ">
                        <div class="layui-form">
                         <div class="layui-inline ">
							<select name="isactive" id="select_isactive"    >
							 <option value="" >请选择</option>
							 <option value="0" >可用</option>
							 <option value="1" >禁用</option>
							</select>
						</div> 
					    </div> 
                    </div> 
                     <div class="layui-btn-group">
                     <button class="layui-btn layui-btn-warm" id="menusearch_id">搜索</button>
                     <button class="layui-btn layui-btn-danger" id="menusearchempty_id">重置</button>
                     <button class="layui-btn "  id="addmenu" >增加</button>
                     <button class="layui-btn "  id="editmenu" >修改</button>
                     <button class="layui-btn "  id="deletemenu">删除</button>
                    </div>
				</blockquote>
				 <!-- 查询操作-->
					<!-- table数据展示 -->
					<div class="layui-tab-item layui-field-box layui-show" >
						<table id="menu_tableid" class="layui-table table-hover " lay-filter="menu_table" lay-even=""  lay-data="{id: 'menuid'}">
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
     id:'menuid'//对象主键名称
    ,elem:'#menu_tableid'//表格id
    ,height: 'full-120'//高度最大化适应,full为固定参数，数字可随意调整
    ,url:'${path}/system/menumanage/listfortable.htm'//请求url
    ,cols: [[//列名
      {type:'checkbox'}
      ,{field:'menuname', width:120, title: '菜单名称'}
      ,{field:'pmenu', width:120, title: '父菜单'}
      ,{field:'menuurl',  title: '菜单链接'}
      ,{field:'menulv',  width:200,title: '菜单类型'}//width 支持：数字、百分比和不填写
      ,{field:'isactive',width:200, title: '可用状态'}
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
       $('#menusearch_id').on('click', function(){
            //alert($("select[name='orgid']").val());
              //表格数据重载
              table.reload('menuid',{
                where: { //传输查询条件参数
                    menuname:$("input[name='menuname']").val(),
                    menulv:$("select[name='menulv']").val(),
                    isactive:$("select[name='isactive']").val()
                }
                ,limit:10
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }

              });
          });
         //重置
       $('#menusearchempty_id').on('click', function(){
            $("input[name='menuname']").val("");
            $("#select_menulv").find("option[value = '']").attr("selected","selected");
            $("#select_isactive").find("option[value = '']").attr("selected","selected");
            form.render();//select下拉框需要重新渲染
              //表格数据重载
              table.reload('menuid',{
                where: { //传输查询条件参数
                    menuname:$("input[name='menuname']").val(),
                    menulv:$("select[name='menulv']").val(),
                    isactive:$("select[name='isactive']").val()
                }
                ,limit:10
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }

              });
          });
        
       //增加
       $("#addmenu").click(function(){
               layer.open({
                type: 2// 2是iframe层
               ,title:'增加菜单'//对话框标题
               ,area:['850px','520px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'menuadd_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/system/menumanage/toAdd.htm"//对话框显示内容,装的是页面
             });
       });
        //修改
        $("#editmenu").click(function(){
           var checkStatus = table.checkStatus('menuid');
           data = checkStatus.data;
           //alert(data.length);
           if(data.length==0){
                layer.msg('请选择需要修改的菜单！', {
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
             var menuid=data[0].menuid;
             layer.open({
                type: 2// 2是iframe层
               ,title:'修改菜单'//对话框标题
               ,area:['850px','520px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'menuedit_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/system/menumanage/toEdit.htm?menuid="+menuid+""//对话框显示内容,装的是页面
             });
            }
        });
       //删除,支持多条删除
       $("#deletemenu").click(function(){
           var checkStatus = table.checkStatus('menuid');
           var str=JSON.stringify(checkStatus.data);
            if(checkStatus.data.length==0){
                layer.msg('请选择需要删除的菜单！', {
                btn: [ '知道啦']
                ,btnAlign: 'c' //按钮居中
                ,anim:6//弹出动画，抖动
                });
            }else{
                layer.confirm("确定要删除吗！", {
                    title: "提示"
                   ,icon: 3//图标
                   ,yes:function(index, layero){//成功后跳转至列表
                     location.href = "${path}/system/menumanage/delete.htm?deleteStr="+str+"";
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