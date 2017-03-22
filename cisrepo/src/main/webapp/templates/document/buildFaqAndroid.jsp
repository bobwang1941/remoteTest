<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../shared/link.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/app/css/document/document.css">
<jsp:include page="../shared/script.jsp"></jsp:include>
</head>
<body class="crp-document-body">
	<jsp:include page="../shared/nav.jsp"></jsp:include>
	<div class="crp-document">
		<nav class="crp-nav-side">
			<h2>构建FAQ</h2>
			<ol>
				<li><a href="<%=request.getContextPath()%>/templates/document/buildFaq.jsp">权限</a></li>
				<li><a href="<%=request.getContextPath()%>/templates/document/buildFaqBuildFailure.jsp">构建</a></li>
				<li><a class="active" href="<%=request.getContextPath()%>/templates/document/buildFaqAndroid.jsp">项目实施</a></li>
			</ol>
		</nav>
		<div class="crp-document-right limit-android">
			<h2>项目实施</h2>
			<p>主要解决项目在实施过程中遇到的各类问题。</p>
			<h3>Android Gradle项目如何实施？</h3>
			<p class="font-bold">Gradle项目实施前期准备:</p>
			<ol class="document-content">
				<li>统一禁止使用本地包和jcenter包，使用公司maven私服；</li>
				<li>使用持续集成提供的sdk版本；</li>
				<li>如果可以打包，禁止直接引用源码；</li>
			</ol>
			<form class="form-horizontal discuss-no-form">
				<div class="row discuss-box">
					<p>以上内容是否对您有帮助？</p>
					<div>
						<button type="button" id="discuss-yes" class="btn btn-info">是</button>
						<button type="button" id="discuss-no" class="btn btn-default">否</button>
					</div>
				</div>
				<div class="row discuss-no hidden">
					<div class="new-tab">
						<span style="margin-right: 45px;">非常抱歉，您认为以上内容的主要问题是？</span> <br>
						<br>
						<div
							class="col-sm-2 radio3 radio-check radio-inline radio-default">
							<input id="chk_reason1" type="radio" name="reason" value="内容不全面">
							<label for="chk_reason1">内容不全面</label>
						</div>
						<div
							class=" col-sm-2 radio3 radio-check radio-inline radio-default">
							<input id="chk_reason2" type="radio" name="reason"
								value="表述不易理解 "> <label for="chk_reason2">表述不易理解
							</label>
						</div>
						<div class=" col-sm-2 radio3 radio-check radio-inline radio-default">
							<input id="chk_reason3" type="radio" name="reason" value="搜索结果不匹配"> 
							<label for="chk_reason3">搜索结果不匹配</label>
						</div>
						<div class=" col-sm-2 radio3 radio-check radio-inline radio-default">
							<input id="chk_reason4" type="radio" name="reason" value="内容不准确">
							<label for="chk_reason4">内容不准确</label>
						</div>
					</div>
					<textarea name="unusefulContent" placeholder="如何改进以上问题，我们会根据你的建议改进文档，努力为大家提供更好的文档。"></textarea>
					<button type="button" id="unusefulSubmit" class="btn btn-info">提交</button>
					<button type="button" id="unusefulCannel" class="btn btn-default">取消</button>
				</div>
			</form>
		</div>
		<jsp:include page="../shared/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="../shared/contact.jsp"></jsp:include>
	<script type="text/javascript" src="<%=request.getContextPath()%>/res/app/js/document/faq.js"></script>
</body>
</html>
