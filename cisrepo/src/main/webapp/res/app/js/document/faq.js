$(function () {
	$(".menu").find("a").each(function(){
		if ($(this).hasClass("hover") && $(this).attr("data-target") != "#help") {
			$(this).removeClass("hover");
		}
	})
	$("[data-target='#help']").addClass("hover");
	
	$(".nav-side a").click(function(){
		$(".nav-side a").each(function(){
			$(this).find("div").removeClass("nav-side-active");
		})
		$(this).find("div").addClass("nav-side-active");
	})
	var form = $(".discuss-no-form");
	$("#discuss-yes").click(function(){
		submitDiscuss(true);
		$(this).attr("disabled", "disabled");
	});
	$("#discuss-no").click(function(){
		submitDiscuss(false);
	});
	var user = getCookie("_nk_"),
		functionalId = $("[name=id]").val(),
		discussBox = $(".discuss-box");
	function submitDiscussInfo() {
		discussBox.addClass("hidden");
		$(".discuss-no").removeClass("hidden");
		$("#unusefulSubmit").click(function() {
			var reason = $("[name=reason]:checked").val(),
				content = $("[name=unusefulContent]").val();
			$(this).attr("disabled", "disabled");
			$.ajax({
				url: user? "data/discuss.json" : "data/discuss.json",
				method: "POST",
				data: {
					"user": user,
					"id": functionalId,
					"useful": false,
					"reason": reason,
					"content": content
				},
				dataType: "json",
				success: function(json) {
					if (json.success) {
						$(".discuss-no").addClass("hidden");
						discussBox.html("<i class='fa fa-check-circle'></i>谢谢反馈，我们会继续努力！").removeClass("hidden");
						if(discussBox.height() < 80) {
							$(".limit").css("margin-bottom", "124px");
							$(".limit-android").css("margin-bottom", "36px");
						}
					} else {
						alert(json.errorMessage);
					}
				}
			});
		})
	}
	$("#unusefulCannel").click(function(){
		$(".discuss-no").addClass("hidden");
		$(".discuss-box").removeClass("hidden");
	})
	function submitDiscuss(isUseful) {
		if (isUseful) {
			$.ajax({
				url: user? "data/discuss.json" : "data/discuss.json",
				method: "POST",
				data: {
					name: user,
					id: functionalId,
					useful: true
				},
				dataType: "json",
				success: function(json) {
					if (json.success) {
						discussBox.html("<i class='fa fa-check-circle'></i>谢谢反馈，我们会继续努力！");
						if(discussBox.height() < 80) {
							$(".limit").css("margin-bottom", "124px");
							$(".limit-android").css("margin-bottom", "36px");
						}
					} else {
						alert(json.errorMessage);
					}
				}
			})
		} else {
			submitDiscussInfo();
		}
	}
});
