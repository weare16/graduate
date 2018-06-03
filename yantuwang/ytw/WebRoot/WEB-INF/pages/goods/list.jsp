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
				<input id="opResultid"  type="text" value="${result}" >
			  <!-- 查询操作-->
				<blockquote class="layui-elem-quote news_search" id="search_quote" >
					<div class="layui-inline">
						<button  id="goodssearch_id" class="layui-btn  search_btn" >查询</button >
					</div>
					<div class="layui-inline ">
						<a id="addgoods"  href="${path}/pages/goods/toAdd.htm"   class="layui-btn  layui-btn-warm"  >添加商品</a >
					</div>
					<div class="layui-inline">
						<a  id="editgoods"   class="layui-btn recommend" 
							style="background-color:#5FB878">编辑商品</a>
					</div>
					<div class="layui-inline">
						<a  id="lookgoods" class="layui-btn  layui-btn-normal">查看商品</a>
					</div>
					<div class="layui-inline">
						<a id="auditgood"  class="layui-btn audit_btn" >审核信息</a>
					</div>
					<div class="layui-inline">
						<a id="deletegood" class="layui-btn layui-btn-danger batchDel" >删除商品</a>
					</div>
				</blockquote>
					<!-- table数据展示 -->
					<div class="layui-tab-item layui-field-box layui-show" >
						<table id="goods_tableid" class="layui-table table-hover " lay-filter="goods_table" lay-even=""  lay-data="{id: 'goodsid'}">
						</table>
						<div class="larry-table-page clearfix">
							<div id="goodspage_id" ></div>
						</div>
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
     id:'goodsid'//对象主键名称
    ,elem:'#goods_tableid'//表格id
    ,height: 'full-120'//高度最大化适应,full为固定参数，数字可随意调整
    ,url:'${path}/pages/goods/listfortable.htm'//请求url
    ,cols: [[//列名
      {type:'checkbox'}
      ,{field:'number', width:120, title: '商品编码', sort: true}
      ,{field:'name', width:120, title: '商品名称'}
      ,{field:'barcode', width:120, title: '商品条码'}
      ,{field:'category', width:120, title: '商品类别'}
      ,{field:'producer', title: '生产地/生产商'}//width 支持：数字、百分比和不填写
      ,{field:'stockwarn', width:120,title: '库存预警',templet: '#switchTpl'}
      ,{field:'qualitywarn',width:120, title: '保质期预警'}
      ,{field:'suggestion',width:120, title: '审核状态'}
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
       $('#goodssearch_id').on('click', function(){
          layer.open({
           type: 1
          ,title:'条件筛选'//对话框标题
          ,area:['700px','420px']//对话框高度和宽度
          ,shade:0.4//对话框背景阴影度
          ,id:'goodssearch_LAY'//防止点击按钮时同时弹出多个对话框
          ,btn:['查询','清空']//自定义按钮的名称，
          ,yes: function(index, layero){
             //查询按钮
              layer.closeAll();//关闭当前层
              $("#searchContent").css("display","none");//隐藏查询条件
              //表格数据重载
              table.reload('goodsid',{
                where: { //设定异步数据接口的额外参数，任意设
                    goodsname:$("input[name='goodsname']").val(),
                    number:$("input[name='number']").val(),
                    barcode:$("input[name='barcode']").val()
                }
                ,limit:10
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }

              });
           }
          ,btn2: function(index, layero){
              //重置按钮
              $("#searchContent").css("display","none");//隐藏查询条件
              $("input[name='goodsname']").val("");//清空数据
              $("input[name='number']").val("");//清空数据
              $("input[name='barcode']").val("");//清空数据
              //表格数据重载
              table.reload('goodsid',{
                where: { //设定异步数据接口的额外参数，任意设
                    goodsname:$("input[name='goodsname']").val(),
                    number:$("input[name='number']").val(),
                    barcode:$("input[name='barcode']").val()
                }
                ,limit:10
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
                
              });
           }
          ,content:$('#searchContent')//对话框显示内容,装的是DOM对象
          ,success: function(layero){//对话框成功打开后的回掉函数，显示查询条件
             var  d = layero.find('#searchContent');
               d.attr({
               display: ''
               }); 
            }
          ,cancel: function(index, layero){ //右上角关闭按钮触发的回掉事件
             $("#searchContent").css("display","none");//隐藏查询条件
            }    
          });
        });	
        //编辑商品
        $("#editgoods").click(function(){
           var checkStatus = table.checkStatus('goodsid');
           data = checkStatus.data;
           //alert(data.length);
           if(data.length==0){
                layer.msg('请选择需要修改的商品！', {
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
            var goodsid=data[0].goodsid;
             //alert(goodsid);
             $("#editgoods").attr("href","${path}/pages/goods/toEdit.htm?goodsid="+goodsid+"");
            }
        });
        //查看商品
        $("#lookgoods").click(function(){
           var checkStatus = table.checkStatus('goodsid');
           data = checkStatus.data;
           //alert(data.length);
           if(data.length==0){
                layer.msg('请选择需要查看的商品！', {
                btn: [ '知道啦']
                });
            }else if(checkStatus.data.length > 1){
               layer.msg('只能查看一条哦~', {
                btn: [ '知道啦']
                });

            }else{
             var goodsid=data[0].goodsid;
             $("#lookgoods").attr("href","${path}/pages/goods/look.htm?goodsid="+goodsid+"");
            }
        });
       //删除商品,支持多条删除
       $("#deletegood").click(function(){
           var checkStatus = table.checkStatus('goodsid');
           var str=JSON.stringify(checkStatus.data);
            if(checkStatus.data.length==0){
                layer.msg('请选择需要删除的商品！', {
                btn: [ '知道啦']
                });
            }else{
                layer.confirm("确定要删除吗！", {
                    title: "提示"
                   ,icon: 3//图标
                   ,yes:function(index, layero){//成功后跳转至列表
                     location.href = "${path}/pages/goods/delete.htm?deleteStr="+str+"";
                     layer.close(index);//需要手动关闭提示框,确定
                     }
                   }); 
            }
       });
       //删除反馈
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
     //审核商品,支持多条审核
       $("#auditgood").click(function(){
           var checkStatus = table.checkStatus('goodsid');
           var str=JSON.stringify(checkStatus.data);
            if(checkStatus.data.length==0){
                layer.msg('请选择需要审核的商品！', {
                btn: [ '知道啦']
                });
            }else if(checkStatus.data.length > 1){
               layer.msg('只能选择一条哦~', {
                btn: [ '知道啦']
                });

            }else {
               layer.open({
                type: 2// 2是iframe层
               ,title:'商品审核'//对话框标题
               ,area:['500px','320px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'goodsaudit_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/pages/goods/toAudit.htm?auditStr="+checkStatus.data[0].goodsid//对话框显示内容,装的是页面
             });
           }
       });
     
		
		
}();	
	</script>
	<section class="layui-larry-box " id="searchContent"  style="display: none;">
	<div class="larry-personal">
		<div class="larry-personal-body clearfix">
			<form class="layui-form col-lg-8 " >
				<div class="layui-form-item">
					<label class="layui-form-label">商品名称</label>
					<div class="layui-input-block">  
						<input type="text" name="goodsname"    class="layui-input " value=""   >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品编号</label>
					<div class="layui-input-block">
						<input type="text" name="number"   class="layui-input " value="" >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品条码</label>
					<div class="layui-input-block">
						<input type="text" name="barcode"     class="layui-input" value="">
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
</body>

</html>