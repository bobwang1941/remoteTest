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
			<h2>发布FAQ</h2>
			<ol>
				<li><a href="<%=request.getContextPath()%>/templates/document/deliveryFaq.jsp">权限</a></li>
				<li><a class="active" href="<%=request.getContextPath()%>/templates/document/delivey.jsp">发布</a></li>
			</ol>
		</nav>
			<div class="crp-document-right">
				<h2>发布</h2>
				<p>主要解决项目开发、测试人员在是发布过程中遇到的问题</p>
				<h3>1.我的发布失败了，如何排查？</h3>
				<ul>
					<li class="font-bold">方式①</li>
				</ul>
				<p>
					a.平台在发布结束后会发送发布邮件，邮件中会给出发布失败组件列表，并在交付邮件控制台地址里面提供项目组发布详情的跳转地址。。</p>
				<img src="data/deliveryFaq/delivery2.png" >
				<p>b.平台在发布结束后会发送发布邮件，邮件中会给出发布失败组件列表，并在交付邮件控制台地址里面提供项目组发布详情的跳转地址。</p>
				<img src="data/deliveryFaq/delivery3.png">
				<img src="data/deliveryFaq/delivery4.png">
				<img src="data/deliveryFaq/delivery5.png"> 
				<img src="data/deliveryFaq/delivery6.png">
				<ul>
					<li class="font-bold">方式②</li>
				</ul>
				<p>在项目组发布历史记录中，可以进入组件发布详情页面，查看组件发布失败原因。</p>
				<img src="data/deliveryFaq/delivery7.png" >
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
							<div class="col-sm-2 radio3 radio-check radio-inline radio-default">
								<input id="chk_reason1" type="radio" name="reason" value="内容不全面">
								<label for="chk_reason1">内容不全面</label>
							</div>
							<div class=" col-sm-2 radio3 radio-check radio-inline radio-default">
								<input id="chk_reason2" type="radio" name="reason" value="表述不易理解 ">
								<label for="chk_reason2">表述不易理解 </label>
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
