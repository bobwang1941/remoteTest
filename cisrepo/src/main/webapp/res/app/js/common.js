$(function() {
	var um = getCookie("_nk_"), cn = getCookie("_cn_");
	cn = cn ? unescape(cn.replace(/"/g, "").replace(/\\(u[0-9a-fA-F]{4})/gm, '%$1')) : um;
	if (um && um != "\"\"") {
		$(".login-info > a").remove();
		$(".login-info > .logon").find(".username").text(cn).end().removeClass("hidden");
	} else {
		$(".login-info > a").removeClass("hidden");
		$(".login-info > .logon").remove();
	}
	var fullSearchBtn = $("#fullSearchBtn");
	if (fullSearchBtn) {
		fullSearchBtn.click(function() {
			if ($("nav .crp-full-search").find("input").val()) {
				$(this).closest("form").submit();
			}
		});
	}
})