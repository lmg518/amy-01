<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="navbar navbar-inverse" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> 
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><img src="images/logo.png"height="100%" /></a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a class="icon-bar" href="#">Amy艾美叶后台管理系统</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">房源管理 <span class="caret"></span></a>
					<ul class="dropdown-menu">
					
						<li role="separator" class="divider"></li>
						<li><a id="add-house-id">添加房源信息</a></li>
						
						
						<li role="separator" class="divider"></li>
						<li><a id="house-price-id">房源价格管理</a></li>
						
						
						<li role="separator" class="divider"></li>
						<li><a id="load-type-id">产品分类</a></li>
						
						
						<li role="separator" class="divider"></li>
						<li><a id="load-products-id">产品信息</a></li>
						
						
						
					</ul></li>
				<li><a href="#">分销管理</a></li>
				
				
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">系统管理 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li role="separator" class="divider"></li>
						<li><a id="load-org-id">组织管理</a></li>
						<li role="separator" class="divider"></li>
						<li><a id="load-menu-id">菜单管理</a></li>
						<li role="separator" class="divider"></li>
						<li><a id="load-role-id">角色管理</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">用户管理</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a>欢迎您,admin</a></li>
				<li><a href="#">安全退出</a></li>
			</ul>
		</div>
	</div>
</div>


<script type="text/javascript">


/* 触发 添加房源信息 按钮连接 */
$('#add-house-id').click(function(){
	var url="house/listUI.do?t="+Math.random(1000);
	$("#container").load(url);
})



/* 触发 房源价格管理  连接 */
$('#house-price-id').click(function(){
	var url="calendar/listUI.do?t="+Math.random(1000);
	$("#container").load(url);
})




/* 触发产品分类事件 */
$('#load-type-id').click(function(){
	
	//var url="product/listUI.do?t="+Math.random(1000);
	var url="product/type/listUI.do?t="+Math.random(1000);
	
	$("#container").load(url);  //跳转到首页
})



/* 触发产品按钮 */
$('#load-products-id').click(function(){
	var url = 'products/listUI.do?t='+Math.random(1000);
	$("#container").load(url);
})





</script>
