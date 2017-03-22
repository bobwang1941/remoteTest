<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../shared/link.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/app/css/project/project.css">
<!-- Include SmartWizard CSS -->
<link href="<%=request.getContextPath()%>/res/base/css/smart_wizard.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/res/base/css/smart_wizard_theme_dots.css" rel="stylesheet" type="text/css" />
<jsp:include page="../shared/script.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/base/js/jquery.smartWizard.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/app/js/project/add_project_group.js"></script>
</head>
<body class="layout layout-header-fixed" data-top-flag="true">
	<jsp:include page="../shared/nav_inner.jsp"></jsp:include>
	<div class="crp-project-breadcrumb-box">
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/templates/dashboard/dashboard.jsp">平台首页</a></li>
			<li class="active">创建新项目</li>
		</ol>
	</div>
	<div class="crp-project-container">
		<jsp:include page="./project_list_sidebar.jsp"></jsp:include>
		<div class="right-project-container">
			<div class="crp-project-content">
				<form class="create-project-form from-horizontal">
					<div id="addProjectGroupWizard">
						<ul>
							<li>
								<a href="#projectBaseInfo">第一步<br /> 
									<small>基本信息</small>
								</a>
							</li>
							<li>
								<a href="#projectConfigInfo_rdm">第二步<br /> 
									<small>每日构建配置</small>
								</a>
							</li>
							<li>
								<a href="#projectConfigInfo_data">第二步<br />
									<small>项目信息</small>
								</a>
							</li>
							<li>
								<a href="#projectMailInfo">第三步<br />
									<small>邮箱配置</small>
								</a>
							</li>
						</ul>
						<div>
							<div id="projectBaseInfo">
								<h5>项目基本信息</h5>
								<div class="form-group">
									<label for="groupName" class="control-label required">项目名称 </label>
									<input type="text" name="groupName" class="form-control" maxlength="45" id="groupName" required="required">
								</div>
								<div class="form-group">
									<label class="control-label required">事业群 </label>
									<select name="departmentId" class="form-control selectpicker" required="required">
										<option value="">请选择</option>
										<option value="1" data-name="TC">技术中心</option>
										<option value="2" data-name="TC">教育BG</option>
										<option value="3" data-name="TC">智慧城市BG</option>
										<option value="4" data-name="TC">公共安全BG</option>
									</select>
								</div>
								<div class="form-group">
									<label class="control-label">业务线</label>
									<select name="businessLineId" class="form-control selectpicker">
										<option value="">请选择</option>
										<option value="1">平嵌 - 客服</option>
										<option value="2">移动互联 - 输入法</option>
										<option value="3">教育 - 智学网</option>
										<option value="4">互动娱乐 - 无线音乐</option>
										<option value="5">移动互联 - OSSP</option>
										<option value="6">平嵌 - 车载</option>
									</select>
								</div>
								<div class="form-group">
									<label class="control-label required">项目类型</label>
									<div class="clearfix"></div>
									<div>
										<div class="radio3 radio-info radio-check radio-inline radio-default">
											<input type="radio" id="projectType_1" name="groupType" value="4" checked="checked"> <label for="projectType_1">服务端</label>
										</div>
										<div class="radio3 radio-info radio-check radio-inline radio-default">
											<input type="radio" id="projectType_2" name="groupType" value="1"> <label for="projectType_2">客户端</label>
										</div>
									</div>
								</div>
								<div class="form-group block" data-control="module">
									<label class="control-label">构建环境</label>
									<div class="clearfix"></div>
									<div class="checkbox3 checkbox-primary checkbox-check checkbox-round checkbox-inline checkbox-light">
										<input type="checkbox" name="environment" value="DEV" id="dev">
										<label for="dev">开发联调环境</label>
									</div>
									<div class="checkbox3 checkbox-primary checkbox-check checkbox-round checkbox-inline checkbox-light">
										<input type="checkbox" name="environment" value="PRETEST" id="pretest">
										<label for="pretest">预测试环境</label>
									</div>
									<div class="checkbox3 checkbox-primary checkbox-check checkbox-round checkbox-inline checkbox-light">
										<input type="checkbox" name="environment" value="TEST" id="test">
										<label for="test">测试环境</label>
									</div>
									<div class="checkbox3 checkbox-primary checkbox-check checkbox-round checkbox-inline checkbox-light">
										<input type="checkbox" name="environment" value="PREPRO" id="prepro">
										<label for="prepro">预上线环境</label>
									</div>
									<div class="checkbox3 checkbox-primary checkbox-check checkbox-round checkbox-inline checkbox-light">
										<input type="checkbox" name="environment" value="PRO" id="pro">
										<label for="pro">生产环境</label>
									</div>
								</div>
								<div class="form-group" data-control="branch">
									<label class="control-label">选择需要的类型</label>
									<button type="button" class="ml-1 btn btn-primary btn-xs select-all">全选</button>
									<button type="button" class="btn btn-primary btn-xs unselect-all">全不选</button>
									<button type="button" class="btn btn-primary btn-xs inverse-select">反选</button>
								</div>
								<div class="form-group block" data-control="branch">
									<div class="type-list"></div>
								</div>
							</div>
							<div id="projectConfigInfo_rdm">
								<h5>每日构建信息</h5>
								<div class="form-group">
									<div class="clearfix"></div>
									<div>
										<div class="radio3 radio-info radio-check radio-inline radio-default">
											<input type="radio" id="buildType_1" name="serviceBuildType" value="rdm" checked="checked"> <label for="buildType_1">RDM</label>
										</div>
										<div class="radio3 radio-info radio-check radio-inline radio-default">
											<input type="radio" id="buildType_2" name="serviceBuildType" value="jira"> <label for="buildType_2">JIRA</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="control-label required"> <span class="daily-build-type-text">RDM</span>项目名</label>
									<input type="text" name="rdmProjectAlias" class="form-control" value="" required="required" />
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="control-label required">主版本号</label>
									<input type="text" name="rdmPrimaryVersion" class="form-control" value="" required="required" />
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="control-label required"> 构建前缀</label>
									<input type="text" name="rdmBuildPrefix" class="form-control" value="" required="required" />
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="control-label"> 产品版本 </label>
									<input type="text" name="rdmVersion" class="form-control" value="" />
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="control-label"> 邮件列表 </label>
									<input type="text" name="rdmMailList" class="form-control" placeholder="该项为RDM邮件收件人列表，多条收件人信息请使用（,）隔开！" value="" />
								</div>
							</div>
							<div id="projectConfigInfo_data">
								<h5>默认基础数据</h5>
								<div class="form-group" data-target="systemType">
									<label class="control-label"> 构建机器环境</label>
									<select name="systemType" class="form-control selectpicker" data-options="minimumResultsForSearch" >
										<option value="1">请选择</option>
										<option value="1">centos</option>
										<option value="2">macos</option>
										<option value="3">windows</option>
										<option value="4">php-centos</option>
										<option value="5">suse</option>
									</select>
								</div>
								<div class="form-group">
									<label class="control-label"> 构建脚本地址 </label>
									<input type="text" class="form-control" value="" name="buildScriptSite" placeholder="该项为客户端构建脚本存放svn位置，非必填。">
								</div>
								<div class="form-group" >
									<label class="control-label"> svnTag地址 </label>
									<input type="text" class="form-control" value="" name="svnTagSite" placeholder="Tag地址路径，版本号可以用\${BUILD_SID}代替，组件名称用\${JOB_NAME}代替。" >
								</div>
								<div class="form-group" >
									<label class="control-label"> 普通构建命令 </label>
									<textarea class="form-control" rows="4" name="commonBuildCommand" placeholder="该项为服务端项目或客户端主干/分支项目的构建命令。"></textarea>
								</div>
								<div class="form-group" data-control="branch">
									<label class="control-label"> 渠道构建命令 </label>
									<textarea class="form-control" rows="4" name="channelBuildCommand" placeholder='仅适用于客户端多渠道项目。'></textarea>
								</div>
								<jsp:include page="base_config_jdk.jsp"></jsp:include>
								<h5>每日构建信息</h5>
								<div class="form-group">
									<div class="clearfix"></div>
									<div>
										<div class="radio3 radio-info radio-check radio-inline radio-default">
											<input type="radio" id="buildType_3" name="clientBuildType" value="rdm" checked="checked"> <label for="buildType_3">RDM</label>
										</div>
										<div class="radio3 radio-info radio-check radio-inline radio-default">
											<input type="radio" id="buildType_4" name="clientBuildType" value="jira"> <label for="buildType_4">JIRA</label>
										</div>
									</div>
								</div>
								<div class="form-group" >
									<label class="control-label"> <span class="daily-build-type-text">RDM</span>项目名 </label>
									<input type="text" class="form-control" value="" name="baseRdmProjectAlias" >
								</div>
								<div class="form-group">
									<label class="control-label">主版本号 </label>
									<input type="text" class="form-control" value="" placeholder="" name="baseRdmPrimaryVersion" >
								</div>
								<h5>默认静测信息</h5>
								<div class="form-group">
									<label class="control-label"> 静态检查配置</label>
									<textarea class="form-control" rows="4" name="sonarProperties"></textarea>
								</div>
							</div>
							<div id="projectMailInfo">
								<h5>邮箱配置</h5>
								<div class="form-group">
									<label for="inputEmail3" class="control-label required">邮箱</label>
									<input type="text" name="mailRecipients" class="form-control" placeholder="增加交付收件人邮箱，多条收件人邮箱请使用（,）隔开！" required="required" value="" />
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../shared/contact.jsp"></jsp:include>
</body>
</html>
