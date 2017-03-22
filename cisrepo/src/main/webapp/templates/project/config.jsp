<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../shared/link.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/app/css/project/project.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/app/plugin/schedule.flow.css">
<jsp:include page="../shared/script.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/app/plugin/schedule.flow.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/app/js/project/config.js"></script>
</head>
<body class="layout layout-header-fixed" data-top-flag="true">
	<jsp:include page="../shared/nav_inner.jsp"></jsp:include>
	<div class="crp-project-breadcrumb-box">
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/templates/dashboard/dashboard.jsp">平台首页</a></li>
			<li><a href="<%=request.getContextPath()%>/templates/project/index.jsp">我的项目</a></li>
			<li>持续集成测试环境</li>
		</ol>
	</div>
	<div class="crp-project-container">
		<jsp:include page="./project_config_sidebar.jsp"></jsp:include>
		<div class="right-project-container">
			<div class="build-status-box">
				<div class="build-status">
					<a href="#" class="title">持续集成测试环境</a>
					<div class="pull-right"><b class="crp-default">5</b>分钟前由<b class="crp-default">赵坤坤</b>触发</div>
					<div class="build-flow-section">
						<div id="buildWorkFlow"></div>
					</div>
				</div>
				<div class="build-links">
					<div class="title">信息导航</div>
					<a href="#" target="_parent">Change Log</a>
					<a href="#" target="_parent">控制台日志</a>
					<a href="#" target="_parent">静态检查详情</a>
					<a href="#" target="_parent">发布部署详情</a>
					<a href="#" target="_parent">构建包下载</a>
				</div>
			</div>
			<div class="clear-fix"></div>
			<div class="build-info-box">
				<div class="crp-statictext-box">
					<div>
						<label>版本号</label>
						<span>1.1.0</span>
					</div>
					<div>
						<label>构建号</label>
						<span>8174</span>
					</div>
				</div>
				<div class="crp-statictext-box">
					<label>构建开始时间</label>
					<span>2017-02-23 14:21:36</span>
				</div>
			</div>
			<div class="build-module-box">
				<div class="crp-link-list">
					<div class="title">构建组件<i class="build-state-help crp-help-toogle"></i></div>
					<a class="failure" href="javascript:;" title="报告系统-测试环境"><i class="fa fa-times"></i>报告系统-测试环境<time>45秒</time></a>
					<a class="failure" href="javascript:;" title="CI插件"><i class="fa fa-times"></i>CI插件<time>23秒</time></a>
					<a class="building" href="javascript:;" title="统计系统-测试环境"><i  class="fa fa-spinner fa-spin"></i>统计系统-测试环境<time>1分钟</time></a>
					<a class="queuing" href="javascript:;" title="稳定性-测试环境"><i class="fa fa-minus-circle"></i>稳定性-测试环境<time>1分钟23秒</time></a>
					<a class="success" href="javascript:;" title="静测系统-测试环境静测系统-测试环境"><i class="fa fa-check"></i>静测系统-测试环境静测系统-测试环境<time>23秒</time></a>
					<a class="success" href="javascript:;" title="缺陷系统-测试环境"><i class="fa fa-check"></i>缺陷系统-测试环境<time>23秒</time></a>
					<a class="success" href="javascript:;" title="Portal-测试环境"><i class="fa fa-check"></i>Portal-测试环境<time>23秒</time></a>
					<a class="success" href="javascript:;" title="缺陷系统-测试环境"><i class="fa fa-check"></i>缺陷系统-测试环境<time>23秒</time></a>
					<a class="success" href="javascript:;" title="稳定性-测试环境"><i class="fa fa-check"></i>稳定性-测试环境<time>23秒</time></a>
					<a class="success" href="javascript:;" title="统计系统-测试环境"><i class="fa fa-check"></i>统计系统-测试环境<time>23秒</time></a>
					<a class="success" href="javascript:;" title="报告系统-测试环境"><i class="fa fa-check"></i>报告系统-测试环境<time>23秒</time></a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../shared/contact.jsp"></jsp:include>
</body>
</html>