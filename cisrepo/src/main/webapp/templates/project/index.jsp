<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../shared/link.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/app/css/project/project.css">
<jsp:include page="../shared/script.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/app/js/project/index.js"></script>
</head>
<body class="layout layout-header-fixed" data-top-flag="true" data-page-flag="0">
	<jsp:include page="../shared/nav_inner.jsp"></jsp:include>
	<div class="crp-project-breadcrumb-box">
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/templates/dashboard/dashboard.jsp">平台首页</a></li>
			<li class="active">我的项目</li>
		</ol>
	</div>
	<div class="crp-project-container">
		<jsp:include page="./project_list_sidebar.jsp"></jsp:include>
		<div class="right-project-container">
			<div class="project-mode-switch">
				<span class="mode-handler grid-mode-icon icon-fa-grid active" data-title="网格模式"></span>
				<span class="mode-handler list-mode-icon icon-fa-list active hidden" data-title="列表模式"></span>
			</div>
			<div class="project-list-title" id="newBuildProject">
				<p>最新构建</p><hr>
			</div>
			<div class="build-project grid-mode project-list"></div>
			<div class="clearfix"></div>
			<div class="project-list-title" id="newUpdateProject">
				<p>最新更新</p><hr>
			</div>
			<div class="update-project grid-mode project-list"></div>
			<div class="clearfix"></div>
			<div class="project-list-title" id="allProject">
				<p>所有项目</p><hr>
			</div>
			<div class="all-project grid-mode project-list"></div>
		</div>
	</div>
	<jsp:include page="project_list_common.jsp"></jsp:include>
	<jsp:include page="../shared/contact.jsp"></jsp:include>
</body>
</html>