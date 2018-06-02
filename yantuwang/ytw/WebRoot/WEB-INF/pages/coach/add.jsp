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
<title>研途网</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css"
	href="${path }/common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css" href="${path }/common/global.css"
	media="all">
<link rel="stylesheet" type="text/css" href="${path }/css/personal.css"
	media="all"> 
</head>
<style>
.myform{
 margin-left: 10% ;
 margin-right: 10%; 
 margin-top: 8px; 
 background: url('/yantw/images/formimage.jpg') ;
 -moz-background-size:100% 100%; background-size:100% 100%;
}
  #addgoodsform{
   background: url('/yantw/images/formimage.jpg') ;
  -moz-background-size:100% 100%; background-size:100% 100%;
  padding-top: 20px;
  
  }


</style>
<body class="layui-layout-body" style="background-color: #F7F7FA;overflow-y:auto">
	<div class="layui-layout layui-layout-admin"
		style="margin-left: 8%; margin-right: 8% ;background-color: #fff" >
		<input id="loginstate_id"   type="hidden" value="${loginstate } ">
		<input id="isadmin_id"   type="hidden" value="${isadmin } ">
		<!-- 头部导航 -->
		<div class="layui-header" style="background-color: #259B24">
			<div class="layui-logo">
				<img src="${path }/images/logo.png" height="50px;" />
			</div>
			<ul class="layui-nav layui-layout-left" >
				<li class="layui-nav-item "><a href="${path }/main.htm"><span
						style="  font-size: 20px; font-family: 幼圆; font-weight: bold; ">首页</span></a></li>
				<li class="layui-nav-item"><a href=""><span
						style="  font-size: 15px; font-family: 幼圆; font-weight: bold;">找辅导</span></a></li>
				<li class="layui-nav-item  layui-this"><a href="${path }/pages/coach/toAdd.htm"><span
						style="  font-size: 15px; font-family: 幼圆; font-weight: bold;">我要辅导</span></a>
						</li>
				<li class="layui-nav-item"><a href=""><span
						style="  font-size: 15px; font-family: 幼圆; font-weight: bold;">免费资料</span></a></li>
				<li  class="layui-nav-item"  style="display: none;"><a href=""><span
						style="  font-size: 15px; font-family: 幼圆; font-weight: bold;">管理员入口</span></a></li>		
			</ul>
			<ul class="layui-nav layui-layout-right">
				<!-- <li class="layui-nav-item">
					<div class="demoTable">
						<div class="layui-inline">
							<input name="id" class="layui-input" id="demoReload"
								placeholder="请输入专业或者学校" size="45">
						</div>
					</div>
				</li> -->
				<li class="layui-nav-item" id="loginli"><a href="javascript:;" id="login">登录</a></li>
				<li class="layui-nav-item" id="registli"><a href="javascript:;" id="regist">注册</a></li>
				<li class="layui-nav-item" id="headphoto" style="display: none;"><a href="javascript:;"  > <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> ${username }
				</a>
					<dl class="layui-nav-child">
					    <dd>
							<a href="">我的辅导</a>
						</dd>
						<dd>
							<a href="">完善资料</a>
						</dd>
						<dd>
							<a href="javascript:;" id="changePwd">修改密码</a>
						</dd>
						<dd>
							<a href="${path }/noLongin.htm">安全退出</a>
						</dd>
					</dl></li>
			</ul>
		</div>
		
		<section >
		<div style="margin-top: 20px;margin-left: 15px;">
			<header class="larry-personal-tit" style="margin-left: 4% ;margin-right: 10%;">
				<i class="layui-icon layui-icon-face-smile" style="font-size: 30px; color: #259B24;">&#xe642;</i>  <span>填写资料   (暂时只适用于北京交通大学的学生哦)</span>
			</header>
			<!-- /header -->
			<div class="myform">
				<form      class="layui-form col-lg-6 " action="${path}/pages/coach/Add.htm" method="post">
					<fieldset class="layui-elem-field layui-field-title">
                         <legend><i class="layui-icon" style="font-size: 30px; color: #1E9FFF; ">&#xe606;</i>  基础信息</legend>
                    </fieldset>
					
					<div class="layui-form-item">
					  <div class="layui-inline">
						<label class="layui-form-label">姓名</label>
						<div class="layui-input-inline">
							<input type="text" name="username" placeholder="必填" lay-verify="required"  class="layui-input "
								value="${user.username }">
								<input type="hidden" name="userid" placeholder="必填" lay-verify="required"  class="layui-input "
								value="${user.userid }">
						</div>
						<label class="layui-form-label">年龄</label>
						<div class="layui-input-inline">
							<input type="text" name="age" required placeholder="必填"  lay-verify="required"  class="layui-input "
								value="${user.age }">
						</div>
					  </div>
					</div>
					
					<div class="layui-form-item">
						<label class="layui-form-label">性别</label>
						<div class="layui-input-inline">
							<input type="hidden"   id="sexid" value="${user.sex }">
						    <select name="sex" id="sexselect" lay-verify="required">
								<option value="0"   >男</option>
								<option value="1"  >女</option>
							</select>
						</div>
						<label class="layui-form-label">电话</label>
						<div class="layui-input-inline">
							<input type="text" name="telphone" placeholder="必填" lay-verify="required"
								class="layui-input " value="${user.telphone }">
						</div>
					</div>
					
					<div class="layui-form-item">
						<label class="layui-form-label">QQ</label>
						<div class="layui-input-inline">
							<input type="text" name="qq" placeholder="" 
								class="layui-input " value="${user.qq }">
						</div>
						<label class="layui-form-label">微信</label>
						<div class="layui-input-inline">
							<input type="text" name="wechat" placeholder="" 
								class="layui-input " value="${user.wechat }">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">学号</label>
						<div class="layui-input-inline">
							<input type="text" name="studentcardid" placeholder="请输入你在校期间的学号" lay-verify="required"
								class="layui-input " value="${user.studentcardid }">
						</div>
					</div>
					
					<div class="layui-form-item">
						<label class="layui-form-label">学院</label>
						<div class="layui-input-inline">
							<input type="text" name="college" placeholder="必填" lay-verify="required"
								class="layui-input " value="${user.college }">
						</div>
						<label class="layui-form-label">专业</label>
						<div class="layui-input-inline">
							<input type="text" name="discipline" placeholder="必填" lay-verify="required"
								class="layui-input " value="${user.discipline }">
						</div>
					</div>
					<fieldset class="layui-elem-field layui-field-title">
                         <legend><i class="layui-icon" style="font-size: 30px; color: #1E9FFF; ">&#xe63c;</i>  辅导分类</legend>
                    </fieldset>
					<div class="layui-form-item">
						<label class="layui-form-label">初试辅导</label>
						<div class="layui-input-block">
						    <input type="checkbox" name="coachtype[1]"  value="1" title="初试咨询" >
							<input type="checkbox" name="coachtype[2]"  value="2" title="专业课辅导" >
                            <input type="checkbox" name="coachtype[3]"  value="3" title="数学"> 
                             <input type="checkbox" name="coachtype[4]"  value="4" title="英语"> 
                              <input type="checkbox" name="coachtype[5]"  value="5" title="政治"> 
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">复试辅导</label>
						<div class="layui-input-block">
							<input type="checkbox" name="coachtype[6]"  value="6" title="复试咨询" >
                            <input type="checkbox" name="coachtype[7]"  value="7" title="笔试"> 
                             <input type="checkbox" name="coachtype[8]"  value="8" title="面试"> 
                             <input type="hidden"   value="${coachtype }" id="coachtypeid"> 
						</div>
					</div>
					<div class="layui-form-item">
					  <label class="layui-form-label">身份证号</label>
						<div class="layui-input-inline">
							<input type="text" name="identify" placeholder="必填" lay-verify="required"
								class="layui-input " value="${user.identify }">
						</div>
						<label class="layui-form-label">收费账号</label>
						<div class="layui-input-inline">
							<input type="text" name="alipay" placeholder="请务必输入支付宝账号" lay-verify="required"
								class="layui-input " value="${user.alipay }">
						</div>
					</div>
					
					<div class="layui-form-item">
						<label class="layui-form-label">个人形象</label>
						<div class="layui-input-inline">
							<button type="button" class="layui-btn" id="test1">
                                   <i class="layui-icon">&#xe67c;</i>上传图片
                            </button>
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" id="demo1" src="${user.image }">
                                <p id="demoText"></p>
                            </div>
                            <input type="hidden" name="image" placeholder="照片名称" lay-verify="required"
								class="layui-input " value="${user.image }">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">自我介绍</label>
						<div class="layui-input-block" style="margin-right: 50px;">
							 <textarea class="layui-textarea" name="introduce"  placeholder="请用一段话描述你，来征服大家吧！">${user.introduce }</textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn layui-btn-danger" lay-submit lay-filter="addcoach" >立即提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>	
		
		
			<%-- <jsp:include page="${path }/main_index.htm"></jsp:include> --%>
	</div>
	<!-- 加载js文件-->
	<script type="text/javascript" src="${path }/common/layui/layui.all.js"></script>
	<script type="text/javascript" src="${path }/js/jquery.js"></script>
	<script type="text/javascript">
	
	;!function(){
		var	layer = layui.layer,
		form=layui.form;
		upload = layui.upload;
		
	 var sex=$("#sexid").val();
	 $("#sexselect").find("option[value = '"+sex+"']").attr("selected","selected");
		form.render();
		
    var  image=$("input[name='image']")	.val();
    if(null!=image && ""!=image){
        $('#demo1').attr('width', '150px');
        $('#demo1').attr('height', '150px');
       // $("#test1").css("display","none");
    
    }	
    var coachtype=$("#coachtypeid").val();
    if(coachtype.indexOf(",") > 0){//多个值
         var  arr=coachtype.split(",");
	     for(var j = 0,len = arr.length; j < len; j++){
           $("input[name='coachtype["+arr[j]+"]'][value="+arr[j]+"]").prop("checked","checked");
          }
          form.render();//js自动选中，需要重新渲染
      }else if(coachtype!=''){//一个值
          $("input[name='coachtype["+coachtype+"]'][value="+coachtype+"]").prop("checked","checked");
           form.render();//js自动选中，需要重新渲染
      }
      
		
	  var a=$("#loginstate_id").val();
	  if( a==1){//已登录
	   //隐藏登录和注册、显示用户头像
	   $("#headphoto").css("display","");
	   $("#registli").css("display","none");
	   $("#loginli").css("display","none");
	 }else{//未登录
	   layer.alert("你还没有哦~请先登录！", {
		           title: "提示"
		          ,anim: 0
		          ,icon: 5
		});
	}
	var b =$("#isadmin_id").val();
	if(b==0){
	   $("#isadmin_liid").css("display","");
	}
		
	 //注册
       $("#regist").click(function(){
                layer.open({
                type: 2// 2是iframe层
               ,title:'注册'//对话框标题
               ,skin: 'layer-ext-reigst' //样式类名
               ,area:['370px','370px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'regist_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/system/login/toRegist.htm"//对话框显示内容,装的是页面
             }); 
       });
        //登录
       $("#login").click(function(){
                layer.open({
                type: 2// 2是iframe层
               ,title:'登录'//对话框标题
               ,skin: 'layer-ext-reigst' //样式类名
               ,area:['370px','300px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'login_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"${path}/system/login/toLogin.htm"//对话框显示内容,装的是页面
             }); 
       });
       
       //保存
			 form.on('submit(addcoach)', function(data){
				 if(a!=1){
				     layer.alert("你还没有哦~请先登录！", {
		                title: "提示"
		                ,anim: 0
		                ,icon: 5
		             });
				 
				 }else{
				 //使用ajax提交
		           $.ajax({
				       type:"post",
				       cache:false,
				       data: data.field,
				       dataType:"json",
				       url: "${path}/pages/coach/Add.htm",//填写绝对路径
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
				 }  
			        return false;//禁止layui提交方式 
			 });
			 
    //普通图片上传
  upload.render({
     elem: '#test1'
    ,url: '${path}/pages/coach/fileUpload.htm'
    ,field: 'files',     //设定文件域的字段名
	multiple:true,		//是否允许多文件上传
	number: 0,		//设置同时可上传的文件数量
	auto: true,
	accept: 'file',
	exts:'jpg|png|pdf',
    before: function(obj){
      //预读本地文件示例，不支持ie8
      obj.preview(function(index, file, result){
        $('#demo1').attr('src', result); //图片链接（base64）
        $('#demo1').attr('width', '150px');
        $('#demo1').attr('height', '150px');
        $("#test1").css("display","none");
      });
    }
    ,done: function(data,item){
		if(data.result=200){
            $("input[name='image']").val(data.imageName);
            $("#test1").css("display","none");
         }else{
           return layer.msg('上传失败');
         }
      } 
	,error: function(){
			//请求异常回调
			return layer.msg('请求异常');
	} 
   
  });
    			 	
 }();        
	</script>
</body>

</html>