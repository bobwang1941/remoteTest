<%@ page pageEncoding="UTF-8" %>
<nav class="navbar navbar-default navbar-dark bg-inverse">
	<a class="logo navbar-brand" href="<%=request.getContextPath()%>/templates/dashboard/dashboard.jsp">
		<img src="../../res/app/css/img/logo.png"> 持续交付平台
	</a>
	<ul class="nav navbar-nav menu">
		<li class="nav-item">
			<a class="nav-link hover" href="<%=request.getContextPath()%>/templates/dashboard/dashboard.jsp">首页</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="javascript:void(0);" data-target="#platform">平台能力</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<%=request.getContextPath()%>/templates/project/index.jsp">我的项目</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="javascript:void(0);" data-target="#solution">解决方案</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="javascript:void(0);" data-target="#report">数据报告</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/templates/document/interfaceList.jsp">API</a></li>
		<li class="nav-item"><a class="nav-link" href="javascript:void(0);" data-target="#help">帮助</a></li>
	</ul>
	<div class="login-info">
		<a href="http://api.iflytek.com/login.do" class="login hidden">登录</a>
		<div class="logon hidden">
			<span class="username">赵坤坤</span>
			&nbsp;|&nbsp;
			<a href="http://api.iflytek.com/logout.do">退出</a>
		</div>
	</div>
	<div class="tabs-menu-box">
		<div id="platform">
			<ul>
				<li><a data-target="#buildPlatformContent">构建</a></li>
				<li><a data-target="#deliveryPlatformContent">发布</a></li>
				<li><a data-target="#qualityPlatformContent">质量</a></li>
				<li><a data-target="#otherPlatformContent">其他</a></li>
			</ul>
			<div id="buildPlatformContent">
				<a href="javascript:void(0);"><h3>日常构建</h3><p>便捷的版本日常构建</p></a>
				<a href="javascript:void(0);"><h3>构建自测</h3><p>快速的构建前自测</p></a>
				<a href="javascript:void(0);"><h3>定时构建</h3><p>可配置的定时任务触发</p></a>
				<a href="javascript:void(0);"><h3>构建依赖</h3><p>灵活的组件关系依赖</p></a>
			</div>
			<div id="deliveryPlatformContent">
				<a href="javascript:void(0);"><h3>项目发布</h3><p>任务一键部署</p></a>
				<a href="javascript:void(0);"><h3>发布自测</h3><p>部署实施预演</p></a>
				<a href="javascript:void(0);"><h3>发布依赖</h3><p>部署顺序可配置</p></a>
				<a href="javascript:void(0);"><h3>配置替换</h3><p>配置文件可管理</p></a>
				<a href="javascript:void(0);"><h3>一键回滚</h3><p>部署失败可回滚</p></a>
			</div>
			<div id="qualityPlatformContent">
				<a href="javascript:void(0);"><h3>静测</h3><p>支持Java等多种语言的静态代码扫描</p></a>
				<a href="javascript:void(0);"><h3>质量门</h3><p>对静测扫描的结果进行把控</p></a>
				<a href="javascript:void(0);"><h3>代码覆盖度</h3><p>衡量测试质量</p></a>
				<a href="javascript:void(0);"><h3>代码安全</h3><p>提供代码混淆、加密等代码安全方案</p></a>
			</div>
			<div id="otherPlatformContent">
				<a href="javascript:void(0);"><h3>每日构建</h3><p>与Jira，RDM打通，为每日构建提供入口</p></a>
				<a href="javascript:void(0);"><h3>版本计划</h3><p>规范的版本上线流程</p></a>
				<a href="javascript:void(0);"><h3>发布包仓库</h3><p>对发布包进行管理</p></a>
				<a href="<%=request.getContextPath()%>/templates/schedule/index.jsp"><h3>调度系统</h3><p>构建静测等任务分发</p></a>
			</div>
		</div>
		<div id="solution">
			<ul>
				<li><a data-target="#continuousSolutionContent">持续交付</a></li>
				<li><a data-target="#operateSolutionContent">运营</a></li>
				<li><a data-target="#otherSolutionContent">其他</a></li>
			</ul>
			<div id="continuousSolutionContent">
				<a href="javascript:void(0);"><h3>环境交付解决方案</h3><p>分版本管理的多环境交付方案</p></a>
				<a href="javascript:void(0);"><h3>异地部署解决方案</h3><p>异地主机远程部署方案</p></a>
				<a href="javascript:void(0);"><h3>客户端项目交付方案</h3><p>高效的渠道构建打包与现网发布</p></a>
			</div>
			<div id="operateSolutionContent">
				<a href="javascript:void(0);"><h3>运营解决方案</h3><p>运营分析，问题反馈机制建立等</p></a>
			</div>
			<div id="otherSolutionContent">
				<a href="javascript:void(0);"><h3>更多解决方案</h3><p>敬请期待！</p></a>
			</div>
		</div>
		<div id="report">
			<ul>
				<li><a data-target="#buildContent">构建</a></li>
				<li><a data-target="#deliveryContent">发布</a></li>
				<li><a data-target="#platformContent">平台</a></li>
				<li><a data-target="#otherContent">其他</a></li>
			</ul>
			<div id="buildContent">
				<a href="http://api.iflytek.com/buildMonitorList.do"><h3>构建监控</h3><p>持续构建情况一览</p></a>
				<a href="http://monitor.iflytek.com/buildReport"><h3>构建报告</h3><p>最近一年持续构建统计报告</p></a>
			</div>
			<div id="deliveryContent">
				<a href="http://api.iflytek.com/deliveryMonitorList.do"><h3>发布监控</h3><p>持续发布情况一览</p></a>
				<a href="http://monitor.iflytek.com/deliveryReport"><h3>发布报告</h3><p>最近一年持续发布统计报告</p></a>
			</div>
			<div id="platformContent">
				<a href="http://monitor.iflytek.com/stability"><h3>稳定性监控</h3><p>平台服务器、以及主要功能稳定性监控</p></a>
				<a href="http://monitor.iflytek.com/diskMonitor"><h3>机器监控</h3><p>机器磁盘、内存进行监控</p></a>
				<a href="http://monitor.iflytek.com/slaveMonitor"><h3>构建机器监控</h3><p>构建机器掉线、邮箱配置等监控</p></a>
				<a href="http://monitor.iflytek.com/dbMonitor"><h3>数据库监控</h3><p>每隔10分钟监控数据库最大连接数</p></a>
			</div>
			<div id="otherContent">
				<a href="http://api.iflytek.com/satisfactionReport.do"><h3>满意度报告</h3><p>月度平台满意度调查结果统计</p></a>
			</div>
		</div>
		<div id="help">
			<ul>
				<li><a data-target="#useHelpContent">帮助</a></li>
				<li><a data-target="#feedbackHelpContent">反馈</a></li>
			</ul>
			<div id="useHelpContent">
				<a href="<%=request.getContextPath()%>/templates/document/buildFaq.jsp"><h3>构建FAQ</h3><p>日常使用构建常见问题等</p></a>
				<a href="<%=request.getContextPath()%>/templates/document/deliveryFaq.jsp""><h3>发布FAQ</h3><p>日常使用构建常见问题等</p></a>
			</div>
			<div id="feedbackHelpContent">
				<a href="http://ci.iflytek.com/portal.do?feedback"><h3>意见反馈</h3><p>提出对平台的疑问或者建议等</p></a>
			</div>
		</div>
	</div>
</nav>
<script>
	$(function() {
		$(".nav-link").tabsMenu();
	});
</script>
