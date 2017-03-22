<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-default navbar-dark bg-inverse inner">
	<a class="logo navbar-brand" href="<%=request.getContextPath()%>/templates/dashboard/dashboard.jsp" style="height:60px; padding: 12px 20px;">
		<img src="../../res/app/css/img/logo.png"> 持续交付平台
	</a>
	<form action="<%=request.getContextPath()%>/templates/search/results.jsp">
		<div class="crp-full-search">
			<div class="input-group">
				<input type="text" class="search-query form-control" name="query" placeholder="请输入关键字..." />
				<span class="input-group-btn">
					<span class="fa fa-search" id="fullSearchBtn"></span>
				</span>
			</div>
		</div>
	</form>
	<div class="login-info">
		<a href="http://api.iflytek.com/login.do" class="login hidden">登录</a>
		<div class="logon hidden">
			<span class="username">赵坤坤</span>
			&nbsp;|&nbsp;
			<a href="http://api.iflytek.com/logout.do">退出</a>
		</div>
	</div>
</nav>