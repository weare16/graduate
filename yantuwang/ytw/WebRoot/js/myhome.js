//注意：导航 依赖 element 模块，否则无法进行功能性操作
	;!function(){
		var element = layui.element,
		carousel = layui.carousel,
		layer = layui.layer;
		//建造轮播实例
		carousel.render({
			elem : '#test1',
			width : '100%' //设置容器宽度
			,
			arrow : 'always' //始终显示箭头
		//,anim: 'updown' //切换动画方式
		});
		//自定义弹框皮肤
		layer.config({
          extend: '/myskin/style.css' //同样需要加载新皮肤
         });
		 //注册
       $("#regist").click(function(){
                layer.open({
                type: 2// 2是iframe层
               ,title:'注册'//对话框标题
               ,skin: 'layer-ext-reigst' //样式类名
               ,area:['370px','370px']//对话框高度和宽度
               ,shade:0.4//对话框背景阴影度
               ,id:'regist_LAY'//防止点击按钮时同时弹出多个对话框
               ,content:"/yantw/system/login/toRegist.htm"//对话框显示内容,装的是页面
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
               ,content:"/yantw/system/login/toLogin.htm"//对话框显示内容,装的是页面
             }); 
       });
       //修改密码
       $("#changePwd").click(function(){
           layer.open({
               type: 2// 2是iframe层
              ,title:'修改密码'//对话框标题
              ,skin: 'layer-ext-reigst' //样式类名
              ,area:['420px','350px']//对话框高度和宽度
              ,shade:0.4//对话框背景阴影度
              ,id:'login_LAY'//防止点击按钮时同时弹出多个对话框
              ,content:"/yantw/system/login/toChangePwd.htm"//对话框显示内容,装的是页面
            }); 
       });
	}();
	var a=$("#loginstate_id").val();
	if( a==1){
	   //隐藏登录和注册、显示用户头像
	   $("#headphoto").css("display","");
	   $("#registli").css("display","none");
	   $("#loginli").css("display","none");
	}
	var b =$("#isadmin_id").val();
	if(b==0){
	   $("#isadmin_liid").css("display","");
	}



