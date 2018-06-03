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
			 <blockquote class="layui-elem-quote news_search"  >
			  <%--   <input id="groupOpResultid"  type="hidden" value="${result}" />  --%>
			    <!-- 查询操作-->
			     <div class="demoTable">
                 <span  style="font:14px Helvetica Neue,Helvetica,PingFang SC,\5FAE\8F6F\96C5\9ED1,Tahoma,Arial,sans-serif"> 业务字典：</span>
                 <div class="layui-inline">
                 <input name="busintypename" class="layui-input" placeholder="请输入">
                  </div>
                  <div class="layui-btn-group">
                  <button class="layui-btn layui-btn-warm" id="searchdic">搜索</button>
                  <button class="layui-btn" id="adddic">
                    <i class="layui-icon">&#xe608;</i> 新增业务字典
                   </button>
                  </div>
                  </div>
              </blockquote>
				<div class="layui-row">
				    <div class="layui-col-xs3" >
					<table id="dic_tableid" class="layui-table table-hover "   lay-filter="dic_table" lay-even=""  lay-data="{id: 'busintypeid'}">
					</table>
				     </div>
				     
				    <div class="layui-col-xs8" style="margin-top:10px;margin-left:15px;padding-top:8px; border: 1px solid #e6e6e6;">
				    <form    class="layui-form " action="${path}/system/dicmanage/Add.htm" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">业务字典名称</label>
						<div class="layui-input-inline">
							<input type="text" name="busintypename"   lay-verify="required"  class="layui-input " value="">
						</div>
						<label class="layui-form-label">业务字典编码</label>
						<div class="layui-input-inline">
							<input type="text" name="busintypeid"   lay-verify="required"  class="layui-input " value="">
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
                         <tr id="addbtn_tbody_tr_id0">
                              <td style="width: 150px;"><input type="text" name="BUSINID"    lay-verify="required"  class="layui-input " value=""></td>
                              <td style="width: 150px;"><input type="text" name="BUSINNAME"    lay-verify="required"  class="layui-input " value=""></td>
                              <td style="width: 120px;"><input type="checkbox" name="status"   lay-verify="required" lay-skin="switch" lay-text="ON|OFF"  checked value="0"></td>
                              <td style="width: 160px;"> 
                              <button class="layui-btn layui-btn-sm  layui-btn-radius" lay-submit="" lay-filter="addrowfilter"> <i class="layui-icon">&#xe608;</i></button>
                              <button class="layui-btn layui-btn-sm layui-btn-danger layui-btn-radius"  lay-submit="" lay-filter="deleterowfilter"> <i class="layui-icon">&#xe640;</i></button></td>
                        </tr>
                        </tbody>
                    </table>
                    </div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit lay-filter="editdic">立即提交</button>
						</div>
					</div>
				    </form>
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
	
  var table = layui.table, 
  layer = layui.layer,
  form = layui.form;
  //表格初始化
    table.render({
     id:'busintypeid'//对象主键名称
    ,elem:'#dic_tableid'//表格id
    ,height: 'full-120'//高度最大化适应,full为固定参数，数字可随意调整
    ,url:'${path}/system/dicmanage/listfortable.htm'//请求url
    ,cols: [[//列名
      {field:'busintypename',event: 'setConfig',  title: '业务字典名称'}
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
       $('#searchdic').on('click', function(){
            //表格数据重载
              table.reload('busintypeid',{
                where: { //查询条件
                    busintypename:$("input[name='busintypename']").val(),
                }
                ,limit:10
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }

              });
        });	
        //增加
       $("#adddic").click(function(){
           $("input[name='busintypename']").val("");
           $("input[name='busintypeid']").val(""); 
           $("#add_configuration_tbodyid").empty();//移除子行 
            var tr = "";
              tr = "<tr >"
		             +"<td style='width: 150px;'><input type='text' name='BUSINID'   lay-verify='required'  class='layui-input ' value=''></td>"
		             +"<td style='width: 150px;'><input type='text' name='BUSINNAME'   lay-verify='required'  class='layui-input ' value=''></td>"
		             +"<td style='width: 120px;'><input type='checkbox' name='status'   lay-verify='required'  lay-skin='switch'  checked value='0' lay-text='ON|OFF' ></td>"
		             +" <td style='width: 160px;'> "
                     +"<button class='layui-btn layui-btn-sm  layui-btn-radius' lay-submit='' lay-filter='addrowfilter'> <i class='layui-icon'>&#xe608;</i></button>"               
                     +" <button class='layui-btn layui-btn-sm layui-btn-danger layui-btn-radius' lay-submit='' lay-filter='deleterowfilter'> <i class='layui-icon'>&#xe640;</i></button>"
                     +"</td>"  
                     + "</tr>"; 
           $("#add_configuration_tbodyid").append(tr);//获取最后一行
           form.render();//渲染开关           
       });
  //监听单元格事件
  table.on('tool(dic_table)', function(obj){
  var data = obj.data;
  if(obj.event === 'setConfig'){
       // alert(data.busintypeid);
       $("input[name='busintypename']").val(data.busintypename);
       $("input[name='busintypeid']").val(data.busintypeid);
       //使用ajax获取配置信息
             $.ajax({
		       type:"post",
		       cache:false,
		       data: data.field,
		       dataType:"json",
		       url: "${path}/system/dicmanage/toEdit.htm?busintypeid="+data.busintypeid,
		       success: function(fielddata){
		           $("#add_configuration_tbodyid").empty();//移除子元素
		           $.each(fielddata,function(i,item){
                     //alert(item.dicid);
                     var tr = "";
                     if(item.status=='0'){
                       tr = "<tr >"
		             +"<td style='width: 150px;'><input type='text' name='BUSINID'   lay-verify='required'  class='layui-input ' value='"+item.BUSINID+"'></td>"
		             +"<td style='width: 150px;'><input type='text' name='BUSINNAME'   lay-verify='required'  class='layui-input ' value='"+item.BUSINNAME+"'></td>"
		             +"<td style='width: 120px;'><input type='checkbox' name='status'   lay-verify='required'  lay-skin='switch'  checked value='0' lay-text='ON|OFF' ></td>"
		             +" <td style='width: 160px;'> "
                     +"<button class='layui-btn layui-btn-sm  layui-btn-radius' lay-submit='' lay-filter='addrowfilter'> <i class='layui-icon'>&#xe608;</i></button>"               
                     +" <button class='layui-btn layui-btn-sm layui-btn-danger layui-btn-radius' lay-submit='' lay-filter='deleterowfilter'> <i class='layui-icon'>&#xe640;</i></button>"
                     +"</td>"  
                     + "</tr>"; 
                     }else{
                      tr = "<tr >"
		             +"<td style='width: 150px;'><input type='text' name='BUSINID'   lay-verify='required'  class='layui-input ' value='"+item.BUSINID+"'></td>"
		             +"<td style='width: 150px;'><input type='text' name='BUSINNAME'   lay-verify='required'  class='layui-input ' value='"+item.BUSINNAME+"'></td>"
		             +"<td style='width: 120px;'><input type='checkbox' name='status'   lay-verify='required'  lay-skin='switch'  value='0' lay-text='ON|OFF' ></td>"
		             +" <td style='width: 160px;'> "
                     +"<button class='layui-btn layui-btn-sm  layui-btn-radius' lay-submit='' lay-filter='addrowfilter'> <i class='layui-icon'>&#xe608;</i></button>"               
                     +" <button class='layui-btn layui-btn-sm layui-btn-danger layui-btn-radius' lay-submit='' lay-filter='deleterowfilter'> <i class='layui-icon'>&#xe640;</i></button>"
                     +"</td>"  
                     + "</tr>"; 
                     }
                     $("#add_configuration_tbodyid").append(tr);//获取最后一行
                     form.render();//渲染开关
                   });
		     },
		     error : function(){
		 	 alertMsg.error("数据加载异常！");
		      }  
	      });  
       form.render();//渲染输入框
  }
  
  });
       
   //增加一行
		form.on('submit(addrowfilter)', function(data){
             var tr = "";
            tr = "<tr >"
		      +"<td style='width: 150px;'><input type='text' name='BUSINID'   lay-verify='required'  class='layui-input ' value=''></td>"
		      +"<td style='width: 150px;'><input type='text' name='BUSINNAME'   lay-verify='required'  class='layui-input ' value=''></td>"
		      +"<td style='width: 120px;'><input type='checkbox' name='status'   lay-verify='required'  lay-skin='switch'  checked value='0' lay-text='ON|OFF' ></td>"
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
                   layer.alert("保存成功！", {
                    title: "提示"
                    ,anim: 0
                    ,icon: 6
                    ,time: 2000
                   });
                   //表格数据重载
                  table.reload('busintypeid',{
                   limit:10
                  ,page: {
                    curr: 1 //重新从第 1 页开始
                  }

              });
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
     
       /* //操作反馈
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
     } */
     
     
		
		
}();	
	</script>
	
</body>

</html>