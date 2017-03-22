<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../shared/link.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/res/base/css/footable.bootstrap.min.css">
<jsp:include page="../shared/script.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/app/css/schedule/schedule.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/res/base/js/footable.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/app/js/schedule/schedule.js"></script>
</head>
<body class="layout layout-header-fixed" data-top-flag="true">
	<jsp:include page="../shared/nav_inner.jsp"></jsp:include>
	<div class="main">
		<div class="breadcrumb-box">
			<ol class="breadcrumb">
				<li><a href="<%=request.getContextPath()%>/templates/dashboard/dashboard.jsp">平台首页</a></li>
				<li>构建</li>
			</ol>
		</div>
		<div class="crp-panel-menu">
			<ul>
				<li><a href="#waiting" class="cur" data-toggle="tooltip"><i class="fa fa-clock-o"></i></a></li>
				<li><a href="#building"><i class="fa fa-cogs"></i></a></li>
				<li><a href="#history"><i class="fa fa-history"></i></a></li>
			</ul>
		</div>
		<div class="crp-panel" id="waiting">
			<a class="crp-collapse-link"> <i class="fa fa-chevron-up"></i></a>
			<h3 class="crp-panel-title"><i class="fa fa-clock-o"></i>排队中项目</h3>
			<table class="table" id="waitingTable">
				<thead>
					<tr>
						<th class="text-center"></th>
						<th>项目名</th>
						<th>构建者</th>
						<th class="text-center">构建号</th>
						<th>开始时间</th>
						<th>预计等待时间</th>
						<th class="text-center">取消</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="crp-panel" id="building">
			<a class="crp-collapse-link"> <i class="fa fa-chevron-up"></i></a>
			<h3 class="crp-panel-title"><i class="fa fa-cogs fa-spin"></i>构建中项目</h3>
			<table class="table" id="buildingTable">
				<thead>
					<tr>
						<th class="text-center"></th>
						<th>项目名</th>
						<th>构建者</th>
						<th class="text-center">构建号</th>
						<th>开始时间</th>
						<th>持续时间</th>
						<th>预计结束时间</th>
						<th class="text-center">终止</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="crp-panel" id="history">
			<a class="crp-collapse-link"> <i class="fa fa-chevron-up"></i></a>
			<h3 class="crp-panel-title"><i class="fa fa-history"></i>今日构建历史</h3>
			<table class="table" id="builtTable">
				<thead>
					<tr>
						<th class="text-center"></th>
						<th>项目名</th>
						<th>构建者</th>
						<th class="text-center">构建号</th>
						<th>上次构建开始时间</th>
						<th>上次构建结束时间</th>
						<th class="text-center">状态
							<i class="build-state-help crp-help-toogle"></i>
						</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<div id="cancelBuildModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">取消构建</h4>
				</div>
				<div class="modal-body">
					<p>确定要取消构建 <span class="project-name"></span> ？</p>
				</div>
				<div class="modal-footer">
					<button type="button"  class="btn btn-link" id="cancelBuildYes">确定</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">不，再等等</button>
				</div>
			</div>
		</div>
	</div>
	<div id="stopBuildModal" class="modal fade in">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">终止构建</h4>
				</div>
				<div class="modal-body">
					<p>确定要终止构建 <span class="project-name"></span> ？</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-link" id="stopBuildYes">确定</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">不，再等等</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../shared/contact.jsp"></jsp:include>
</body>
</html>