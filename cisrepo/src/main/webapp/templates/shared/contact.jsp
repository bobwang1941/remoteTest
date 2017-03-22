<%@ page pageEncoding="UTF-8"%>
<div class="floating_ck">
	<dl>
		<dd class="phone">
			<img src="<%=request.getContextPath()%>/res/app/css/img/right_01.png" class="rightImg" data-toggle="tooltip" data-container=".phone" title="<div class='floating_right'>
					<div style='margin-bottom: -10px;'>13721099718</div>
					<div>（工作日8:30～17:30）</div>
				</div>">
		</dd>
		<dd class="qq">
			<a href="javascript:void(0);">
				<img src="<%=request.getContextPath()%>/res/app/css/img/right_02.png" class="rightImg" data-toggle="tooltip" title="<div class='floating_right'>服务保障群：313365068</div>">
			</a>
		</dd>
		<dd class="weixin">
			<img src="<%=request.getContextPath()%>/res/app/css/img/right_03.png" class="rightImg" data-toggle="tooltip" title="<div class='floating_right'>
				<img src='<%=request.getContextPath()%>/res/app/css/img/weixin.jpg'>
			</div>">
		</dd>
	</dl>
</div>
<script>
	$(function () {
		$('[data-toggle="tooltip"]').tooltip({
			placement: "left",
			html: true
		})
	})
</script>