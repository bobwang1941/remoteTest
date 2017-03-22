<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../shared/link.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/app/css/document/document.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/app/css/search/results.css">
<jsp:include page="../shared/script.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/base/js/bootstrap-paginator.min.js"></script>
</head>
<body class="crp-document-body inner">
	<jsp:include page="../shared/nav_inner.jsp"></jsp:include>
	<div class="crp-document crp-full-search-result">
		<div class="crp-center-content">
			<div class="form-group col-lg-7 col-lg-offset-2">
				<input type="text" name="query" class="form-control lg" value="构建" placeholder="请输入关键词，比如：构建">
			</div>
			<div class="form-group col-lg-1">
				<button type="button" class="btn btn-primary" id="innerFullSearch">搜索</button>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="search-results">
			<div class="search-results-mark">搜索到相关结果 <span class="total-count">0</span> 个</div>
			<div class="search-results-category">
			</div>
			<div class="search-results-list">
			</div>
			<div class="text-right">
				<ul class="search-results-pagenavigator"></ul>
			</div>
		</div>
		<jsp:include page="../shared/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="../shared/contact.jsp"></jsp:include>
	<script type="text/javascript" src="<%=request.getContextPath()%>/res/app/js/search/results.js"></script>
</body>
</html>