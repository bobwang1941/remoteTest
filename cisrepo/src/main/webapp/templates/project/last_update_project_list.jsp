<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../shared/link.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/app/css/project/project.css">
<jsp:include page="../shared/script.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/app/js/project/index.js"></script>
</head>
<body class="layout layout-header-fixed" data-top-flag="true" data-page-flag="2">
	<jsp:include page="../shared/nav_inner.jsp"></jsp:include>
	<div class="crp-project-breadcrumb-box">
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/templates/dashboard/dashboard.jsp">平台首页</a></li>
			<li class="active">最新更新</li>
		</ol>
	</div>
	<div class="crp-project-container">
		<jsp:include page="./project_list_sidebar.jsp"></jsp:include>
		<div class="right-project-container">
			<!-- <div class="project-list-title" id="newUpdateProject">
				<p>最新更新</p><hr>
			</div> -->
			<div class="project-mode-switch">
				<span class="mode-handler grid-mode-icon active icon-fa-grid" data-title="网格模式"></span>
				<span class="mode-handler list-mode-icon icon-fa-list hidden" data-title="列表模式"></span>
			</div>
			<div class="update-project project-list grid-mode"></div>
		</div>
	</div>
	<jsp:include page="project_list_common.jsp"></jsp:include>
	<jsp:include page="../shared/contact.jsp"></jsp:include>
</body>
</html>