<%@ page pageEncoding="UTF-8"%>
<div class="crp-side-list-menu">
	<div class="">
		<div class="menu-list">
			<ul id="menu-content" class="menu-content">
				<li data-toggle="collapse" data-target="#projectSidebar" aria-expanded="true"><a href="#">项目管理<span class="arrow"></span></a></li>
				<ul class="sub-menu collapse in" id="projectSidebar">
					<li><a href="index.jsp">我的项目</a></li>
					<li><a href="last_build_project_list.jsp">最新构建</a></li>
					<li><a href="last_update_project_list.jsp">最新更新</a></li>
					<li><a href="all_project_list.jsp">所有项目</a></li>
				</ul>
				<li class="info"><a href="<%=request.getContextPath()%>/templates/project/add_project_group.jsp"> 新建项目组</a></li>
			</ul>
		</div>
	</div>
</div>
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/app/css/project/sidebar.css">
