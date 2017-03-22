$(function() {
	$(".metismenu .panel-body li a").each(function() {
		var me = $(this), href = me.attr("href"), path = window.location.href;
		if (href.charAt(0) != "#"
				&& href != "javascript:void(0)"
				&& path.indexOf(href) > -1) {
			me.closest(".dropdown").addClass("active");
			me.closest(".dropdown").find(".panel-collapse")
					.addClass("in");
			me.addClass('selected-color');
		}
	});
	$(".metismenu").metisMenu();
	$(".metismenu .dropdown").on('show.bs.collapse', function() {
		return $(".metismenu .dropdown .collapse").collapse('hide');
	});
});
