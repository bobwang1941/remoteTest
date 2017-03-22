<%@ page pageEncoding="UTF-8"%>
<div class="crp-nav-side crp-api-nav-side">
	<nav class="navbar" style="margin-top: 0">
		<h2>API</h2>
		<ol class="metismenu">
			<li class="dropdown"><a data-toggle="collapse"
				href="#dropdown-admain"> <span class="title nav-label">权限</span>
			</a>
				<div id="dropdown-admain" class="panel-collapse collapse">
					<div class="panel-body">
						<ul class="nav navbar-nav crp-navbar-nav">
							<li>
								<a title="域账号英文对应中文" href="<%=request.getContextPath()%>/templates/document/interfaceList.jsp">域账号英文对应中文</a>
							</li>
							<li>
								<a title="多域账号英文名查找各自对应中文名" href="<%=request.getContextPath()%>/templates/document/interfaceList-01.jsp">多域账号英文名查找各自对应中文名</a>
							</li>
						</ul>
					</div>
				</div></li>
			<li class="dropdown">
				<a data-toggle="collapse" href="#dropdown-build"> <span class="title nav-label">构建</span>
			</a>
				<div id="dropdown-build" class="panel-collapse collapse">
					<div class="panel-body">
						<ul class="nav navbar-nav crp-navbar-nav">
							<li><a title="查询构建历史" href="javascript:void(0)">查询构建历史</a></li>
							<li><a title="渠道构建" href="javascript:void(0)">渠道构建</a></li>
						</ul>
					</div>
				</div></li>
			<li class="dropdown"><a data-toggle="collapse"
				href="#dropdown-delivery"> <span class="title nav-label">交付</span>
			</a>
				<div id="dropdown-delivery" class="panel-collapse collapse">
					<div class="panel-body">
						<ul class="nav navbar-nav crp-navbar-nav">
							<li><a title="交付包" href="javascript:void(0)">交付包</a></li>
						</ul>
					</div>
				</div></li>
			<li class="dropdown"><a data-toggle="collapse"
				href="#dropdown-deploy"> <span class="title nav-label">发布</span>
			</a>
				<div id="dropdown-deploy" class="panel-collapse collapse">
					<div class="panel-body">
						<ul class="nav navbar-nav crp-navbar-nav">
							<li><a title="项目详情" href="javascript:void(0)">项目详情</a></li>
							<li><a title="组件列表" href="javascript:void(0)">组件列表</a></li>
						</ul>
					</div>
				</div></li>
		</ol>
	</nav>
</div>