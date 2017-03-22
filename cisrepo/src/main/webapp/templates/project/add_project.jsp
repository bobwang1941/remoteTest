<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../shared/link.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/app/css/project/project.css">
<jsp:include page="../shared/script.jsp"></jsp:include>
</head>
<body class="layout layout-header-fixed" data-top-flag="true">
	<jsp:include page="../shared/nav_inner.jsp"></jsp:include>
	<div class="crp-project-breadcrumb-box">
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/templates/dashboard/dashboard.jsp">平台首页</a></li>
			<li><a href="<%=request.getContextPath()%>/templates/project/index.jsp">我的项目</a></li>
			<li><a href="<%=request.getContextPath()%>/templates/project/config.jsp">持续集成1.0</a></li>
			<li>新增组件</li>
		</ol>
	</div>
	<div class="crp-project-container">
		<jsp:include page="./project_config_sidebar.jsp"></jsp:include>
		<div class="right-project-container">
		</div>
	</div>
	<jsp:include page="../shared/contact.jsp"></jsp:include>
</body>
</html>