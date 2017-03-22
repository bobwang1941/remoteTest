<%@ page pageEncoding="UTF-8"%>
<div class="crp-side-list-menu">
	<div class="">
		<div class="menu-list">
			<ul id="menu-content" class="menu-content">
				<li class="active">
					<a href="config.jsp">
						<i class="icon-fa-status fa-lg"></i>项目状态
					</a>
				</li>
				<!-- <li>
					<a href="javascript:void(0);">
						<i class="icon-fa-flow fa-lg"></i>工作流
					</a>
				</li> -->
				<li>
					<a href="javascript:void(0);">
						<i class="fa fa-plus fa-lg"></i>新建组件/分支/渠道
					</a>
				</li>
				<li>
					<a href="javascript:void(0);">
						<i class="icon-fa-project fa-lg"></i>配置管理
					</a>
				</li>
				<li>
					<a href="javascript:void(0);">
						<i class="icon-fa-version fa-lg"></i>版本计划
					</a>
				</li>
				<li>
					<a href="javascript:void(0);">
						<i class="fa fa-history fa-lg"></i>历史记录
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/app/css/project/sidebar.css">
<!-- <script>
	$(function() {
		$(".sub-menu li").click(function() {
			$(this).closest(".sub-menu").find(".active").removeClass("active");
			$(this).addClass("active");
		});
	});
</script> -->