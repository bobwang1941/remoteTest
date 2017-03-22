<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../shared/link.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/base/css/flipclock.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/base/css/jquery.fullpage.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/base/css/jquery.cxscroll.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/app/css/dashboard/dashboard.css">
<jsp:include page="../shared/script.jsp"></jsp:include>
</head>
<body class="layout layout-header-fixed">
	<jsp:include page="../shared/nav.jsp"></jsp:include>
	<div id="fullPage">
		<div class="dashboard-abstract section" data-anchor="page1">
			<div id="carousel-abstract" class="carousel slide">
				<div class="carousel-inner">
					<div class="item active">
						<img src="<%=request.getContextPath()%>/res/app/css/img/banner-ms.png">
						<div class="carousel-caption detail">
							<h2>容器服务</h2>
							<p class="mt-2">以应用为中心，简化应用管理，提升运维效率，支持负载均衡、弹性伸缩、高可靠等。</p>
						</div>
					</div>
					<div class="item">
						<img src="<%=request.getContextPath()%>/res/app/css/img/banner-cd.png">
						<div class="carousel-caption detail release">
							<img src="<%=request.getContextPath()%>/res/app/css/img/bgs.png" height="150px" width="150px">
							<div class="release-right">
								<h2>持续交付</h2>
								<p class="mt-2">摒除环境异构的问题，实现一次构建，随处运行，并可以独立管理应用交付每个环节。</p>
							</div>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#carousel-abstract" data-slide="prev">
					<span class="icon-prev" aria-hidden="true"></span>
				</a>
				<a class="right carousel-control" href="#carousel-abstract" data-slide="next">
					<span class="icon-next" aria-hidden="true"></span>
				</a>
			</div>
			<a class="godown" href="#page2"><span></span></a>
		</div>
		<div class="dashboard-project section" data-anchor="page2">
			<div class="col-lg-offset-1 my-3">
				<div class="col-lg-7">
					<h3 class="mb-2">实时服务</h3>
					<h4 class="mb-1"><i class="fa fa-clock-o"></i>今日</h4>
					<div class="counter-box">
						<label class="counter-label">活跃用户</label>
						<span class="online-num"></span>
						<label class="counter-label right">活跃项目</label>
						<span class="day-project-num"></span>
					</div>
					<div class="counter-box">
						<label class="counter-label">构建项目</label>
						<span class="day-build-num"></span>
						<label class="counter-label right">发布项目</label>
						<span class="day-delivery-num"></span>
					</div>
					<h4 class="mb-1"><i class="fa fa-calendar"></i>本周</h4>
					<div class="counter-box">
						<label class="counter-label">构建项目</label>
						<span class="week-build-num"></span>
						<label class="counter-label right">构建成功率</label>
						<span class="week-build-rate"></span>
						<span class="counter-label">%</span>
					</div>
					<div class="counter-box">
						<label class="counter-label">发布项目</label>
						<span class="week-delivery-num"></span>
						<label class="counter-label right">发布成功率</label>
						<span class="week-delivery-rate"></span>
						<span class="counter-label">%</span>
					</div>
					<h4 class="mb-1"><i class="fa fa-signal"></i>稳定性</h4>
					<div class="counter-box">
						<label class="counter-label">平台稳定性</label>
						<span class="stability"></span>
						<span class="counter-label">%</span>
					</div>
				</div>
				<div class="col-lg-5">
					<h3 class="mb-3"></h3>
					<hr class="vertical">
					<span class="description">平台自<b class="highlight-num">2015年8月</b>成立以来</span>
					<span class="description"><i class="fa fa-list-alt"></i>历史支持项目<b class="highlight-num">3万</b>余个</span>
					<span class="description"><i class="fa fa-group"></i>同时支撑服务项目组高达212个</span>
					<span class="description"><i class="fa fa-user"></i>服务构建人员 575 位</span>
					<span class="description"><i class="fa fa-th-large"></i>构建组件<b class="highlight-num">2000+</b></span>
					<span class="description"><i class="fa fa-th"></i>构建分支渠道1500+</span>
					<span class="description"><i class="fa fa-cogs"></i>完成1057个组件内自动部署</span>
				</div>
			</div>
			<a class="godown" href="#page3"><span></span></a>
		</div>
		<div class="dashboard-platform section" data-anchor="page3">
			<div>
				<div class="col-lg-offset-1 no-px col-lg-11">
					<h3 class="mt-3">第三方平台集成方案</h3>
					<div class="other-platform">
						<a class="platform" href="javascript:void(0);">
							<img alt="RDM" src="<%=request.getContextPath()%>/res/app/css/img/rdm.png">RDM平台
						</a>
						<span class="description">打通每日构建，缺陷管理，版本计划等</span>
						<a href="javascript:void(0);" class="btn btn-outline-primary">查看详情</a>
					</div>
					<div class="other-platform">
						<a class="platform" href="javascript:void(0);">
							<img alt="JIRA" src="<%=request.getContextPath()%>/res/app/css/img/jira.png">JIRA平台
						</a>
						<span class="description">打通每日构建，缺陷管理，版本计划等</span>
						<a href="javascript:void(0);" class="btn btn-outline-primary">查看详情</a>
					</div>
					<div class="other-platform">
						<a class="platform" href="javascript:void(0);">
							<img alt="自动化测试平台" src="<%=request.getContextPath()%>/res/app/css/img/auto_test.png">
							自动化测试平台
						</a>
						<span class="description">部署完成一键触发自动化测试</span>
						<a href="javascript:void(0);" class="btn btn-outline-primary">查看详情</a>
					</div>
					<div class="other-platform">
						<a class="platform" href="javascript:void(0);">
							<img alt="版本包管理平台" src="<%=request.getContextPath()%>/res/app/css/img/package.png">
							版本包管理平台
						</a>
						<span class="description">版本包自动上传，规范管理</span>
						<a href="javascript:void(0);" class="btn btn-outline-primary">查看详情</a>
					</div>
				</div>
				<div class="col-lg-offset-1 no-px col-lg-10">
					<h3>服务项目<span class="description">排名不分先后</span></h3>
					<div class="cooperation-scroll scroll_horizontal">
						<div class="box">
							<ul class="list">
								<li><img src="<%=request.getContextPath()%>/res/app/css/img/logo/shurufa.png" title="讯飞输入法"/></li>
								<li><img src="<%=request.getContextPath()%>/res/app/css/img/logo/lingxi.jpg"  title="灵犀"/></li>
								<li class="double-width"><img src="<%=request.getContextPath()%>/res/app/css/img/logo/changyan.jpg" title="畅言" /></li>
								<li class="double-width"><img src="<%=request.getContextPath()%>/res/app/css/img/logo/chezai.png" title="车载"/></li>
								<li><img src="<%=request.getContextPath()%>/res/app/css/img/logo/tingjian.png" title="听见科技"/></li>
								<li><img src="<%=request.getContextPath()%>/res/app/css/img/logo/zhixuewang.png" title="智学网"/></li>
								<li><img src="<%=request.getContextPath()%>/res/app/css/img/logo/kuyinlingsheng.png" title="酷音铃声"/></li>
								<li><img src="<%=request.getContextPath()%>/res/app/css/img/logo/ktv.png" title="欢乐KTV"/></li>
								<li><img src="<%=request.getContextPath()%>/res/app/css/img/logo/zhihuichengshi.png" title="智慧城市"/></li>
								<li><img src="<%=request.getContextPath()%>/res/app/css/img/logo/zhinengkefu.png" title="智能客服"/></li>
							</ul> 
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<jsp:include page="../shared/footer.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="../shared/contact.jsp"></jsp:include>
	<script type="text/javascript" src="<%=request.getContextPath()%>/res/base/js/jquery.cxscroll.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/res/base/js/flipclock.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/res/base/js/jquery.fullpage.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/res/app/js/dashboard/dashboard.js"></script>
</body>
</html>
