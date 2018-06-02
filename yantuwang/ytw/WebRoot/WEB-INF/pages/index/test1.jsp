<section class="larry-wrapper">
      <!-- 轮播 -->
		<div style="padding-top: 8px; padding-left: 8%;padding-right: 8%;background-color: #fff" >
		    
			<div class="layui-carousel" id="test1">
				<div carousel-item>
					<div style=" background-color: #E5E5E5;"><img  src="${path }/images/11.png" width="100%"></div>
					<div style=" background-color: #5FB878;"><img  src="${path }/images/12.png" width="100%"></div>
					<div style=" background-color: #E5E5E5;"><img  src="${path }/images/11.png" width="100%"></div>
					<div style=" background-color: #5FB878;"><img  src="${path }/images/12.png" width="100%"></div>
				</div>
			</div>
			
		</div>
		<div style="padding-top: 8px; background-color: #fff">
		<div class="layui-tab layui-tab-brief " lay-filter="docDemoTabBrief"  >
			<ul class="layui-tab-title" style="text-align: center;">
				<li class="layui-this"><span style="font-size: 16px;  ">热门资料</span></li>
				<li><span style="font-size: 16px;  ">靠谱辅导</span></li>
			</ul>
			<div class="layui-tab-content"  style="padding: 20px 20px;" >
			   <div class="layui-tab-item layui-show  "   >
			      <div class="layui-col-md12" style="background-color: #fff;padding-left: 50px;padding-bottom: 20px;"><span style="font-size: 16px; font-weight: bold; color: #259B24;">初试 </span></div>
			     
			      <div class="layui-col-md12" style="background-color: #fff">
			      <div class="layui-col-md2 layui-col-md-offset1">  <img  src="${path }/images/a.png">北京师范大学-地理与信息</br>李晓敏</div>
			      <div class="layui-col-md2">  <img   src="${path }/images/e.png" ></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/b.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/c.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/d.png"></div>
			      </div>
			      
			      <div class="layui-col-md12" style="background-color: #fff">
			      <div class="layui-col-md2 layui-col-md-offset1">  <img  src="${path }/images/a.png">北京师范大学-地理与信息</br>李晓敏</div>
			      <div class="layui-col-md2">  <img   src="${path }/images/e.png" ></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/b.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/c.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/d.png"></div>
			      </div>
			      
			      <div class="layui-col-md12" style="background-color: #fff;padding-left: 50px;padding-bottom: 20px;padding-top: 20px;"><span style="font-size: 16px; font-weight: bold; color: #259B24">复试 </span></div>
			     
			      <div class="layui-col-md12" style="background-color: #fff">
			      <div class="layui-col-md2 layui-col-md-offset1">  <img  src="${path }/images/a.png">北京师范大学-地理与信息</br>李晓敏</div>
			      <div class="layui-col-md2">  <img   src="${path }/images/e.png" ></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/b.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/c.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/d.png"></div>
			      </div>
			      
			      <div class="layui-col-md12" style="background-color: #fff">
			      <div class="layui-col-md2 layui-col-md-offset1">  <img  src="${path }/images/a.png">北京师范大学-地理与信息</br>李晓敏</div>
			      <div class="layui-col-md2">  <img   src="${path }/images/e.png" ></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/b.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/c.png"></div>
			      <div class="layui-col-md2">  <img  src="${path }/images/d.png"></div>
			      </div>
			      <div style="clear: both;"></div>
			   </div>
               <div class="layui-tab-item">内容2</div>
			
			
			
			</div>
		</div>
		</div>

</section>

<script type="text/javascript" src="${path }/common/layui/layui.all.js"></script>
<script type="text/javascript" src="${path }/js/jquery.js"></script>
<script type="text/javascript">
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
	}();
</script>
</body>
</html>