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
		<jsp:include page="../document/interfaceSide.jsp"></jsp:include>
		<div class="crp-document-right crp-api-right">
			<h2>多域账号英文名查找各自对应中文名</h2>
			<h3>接口地址</h3>
			<p>http://api.iflytek.com/retrieveMultiDisplayName.do</p>
			<h3>描述</h3>
			<p>按多域账号英文名称查找各自对应中文名称</p>
			<h3>说明</h3>
			<p>用户名为公司域账号且为必填，且可传入多个域账号，并用逗号（,）隔开</p>
			<h3>HTTP请求方式</h3>
			<p>GET</p>
			<h3>传入值参数列表</h3>
			<table class="table table-bordered">
				<tbody>
					<tr class="tr-first-bg">
						<th>英文名</th>
						<th>描述</th>
						<th class="text-center">必选</th>
						<th>说明</th>
					</tr>
					<tr>
						<td>multiusername</td>
						<td>多个域账号</td>
						<td class="text-center">是</td>
						<td>公司域账号英文名称，多个用逗号（,）隔开</td>
					</tr>
				</tbody>
			</table>
			<h3>传入值参数示例</h3>
			<pre>
<code>{
	multiusername: "jiechen4,jiechen3,jiechen5"
}</code>
</pre>
			<h3>返回值列表</h3>
			<table class="table table-bordered">
				<tbody>
					<tr class="tr-first-bg">
						<th>英文名</th>
						<th>描述</th>
						<th>说明</th>
					</tr>
					<tr>
						<td>success</td>
						<td>是否成功</td>
						<td>true表示成功，false表示失败</td>
					</tr>
					<tr>
						<td>data</td>
						<td>域账号信息</td>
						<td>域账号和对应的中文名称以及RDM用户ID，未查询到中文名称则返回域账号</td>
					</tr>
					<tr>
						<td>errorMessage</td>
						<td>错误信息</td>
						<td>如果成功返回null，失败返回具体失败原因</td>
					</tr>
				</tbody>
			</table>
			<h3>返回值示例</h3>
			<pre>
<code>{
	"success": true,
	"data":
		{
		"userName":"jiechen4",
		"displayName":"陈杰4",
		"rdmUserId":"e00fbd67-c327-4df3-81ce-3c7ff671a4b9"
		},
		{
		"userName":"jiechen3",
		"displayName":"陈杰",
		"rdmUserId":"178f1abd-8ab9-4e7d-95d9-917eb75775b5"
		},
		{
		"userName":"jiechen5",
		"displayName":"jiechen5",
		"rdmUserId":null
		}
	"errorMessage":null
}</code>
</pre>
		</div>
		<jsp:include page="../shared/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="../shared/contact.jsp"></jsp:include>
	<script type="text/javascript" src="<%=request.getContextPath()%>/res/base/js/jquery.metisMenu.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/res/app/js/document/interfaceList.js"></script>
</body>
</html>