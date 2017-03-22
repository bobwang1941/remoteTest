$(function() {
	var windowWidth = window.outerWidth, pageFlag = $("body").data("page-flag");
	$(".right-project-container").css({"padding-right": ((windowWidth - 250 - 980 ) / 2 - 30) + "px"});
	function highlightBadge(params, local) {
		var badges = params || "", badgesArr = ["build", "sonar", "delivery"];
		$.each(badgesArr, function(index, value) {
			if (badges.indexOf(value) >= 0) {
				local.filter(".badge-" + value).addClass("active");
			}
		})
	}
	var projectTpl = $("[data-tpl=project].hidden");
	function initPage(box, url, user, more, category) {
		$(box).html("");
		ajax({
			loading: box,
			url: url,
			dataType: "json",
			success: function(json) {
				var data = json.data, project, bgLen, listLen, list, bgId;
				if (json.success) {
					if (data && (bgLen = data.length)) {
						$.each(data, function(index, value) {
							list = value.list;
							listLen = data[index].list.length || 0;
							if (category) {
								$(box).append("<div class='list-category-title'>" + value.groupName + "</div>");
							}
							for(var i = 0; i < listLen; i++) {
								project = projectTpl.clone().removeClass("hidden").removeData("tpl");
								project.attr({"title": list[i].cnname,
											"href": list[i].detail}).find(".project-delete").data("id", list[i].id);
								project.find(".panel-title").html(list[i].cnname);
								project.find(".action-user").html(user + "：<b>" + list[i].username + "</b>");
								project.find(".action-time").html(list[i].time);
								highlightBadge(list[i].badges, project.find(".crp-badge"));
								$(box).append(project);
							}
							$(box).append($("<div class='list-category bg-" + index + "'></div>").append($(box).children(".project-container")))
							if(more && listLen > 8) {
								$(box).children(".list-category.bg-" + index + "")
										.children(".project-container").slice(7, listLen).addClass("more-project hidden").end().end()
										.append($("[data-tpl='loading-more']").clone().removeClass("hidden").removeAttr("data-tpl"));
							}
							$(box).append("<div class='clearfix'></div>");
						});
						bindLoadingMoreEvent();
						bindDeleteEvent();
					}
				} else {
					alert(json.errorMessage);
				}
			}
		});
	}
	var box1 = ".build-project",
		box2 = ".update-project",
		box3 = ".all-project";
	$("#projectSidebar").children().eq(pageFlag).addClass("active");
	$(".project-mode-switch .mode-handler").click(function() {
		var me = $(this);
		me.siblings(".hidden").removeClass("hidden").end().addClass("hidden");
		me.closest(".project-mode-switch").nextAll(".project-list").toggleClass("grid-mode list-mode");
	});
	switch(pageFlag) {
		case 0:
			initPage(box1, "data/project-info-4.json", "构建者", false, false);
			initPage(box2, "data/project-info-4.json", "更新者", false, false);
			initPage(box3, "data/project-info.json", "创建者", true, true);
			break;
		case 1:
			initPage(box1, "data/project-info-8.json", "构建者", false, true);
			break;
		case 2:
			initPage(box2, "data/project-info-8.json", "更新者", false, true);
			break;
		case 3:
			initPage(box3, "data/project-info.json", "创建者", true, true);
			break;
	}
	function bindLoadingMoreEvent() {
		$(".show-more:visible").click(function(e) {
			var showAll, span = $(this).find("span"), icon = $(this).find("i");
			$(this).closest(".list-category").find(".more-project").toggleClass("hidden");
			showAll = !!icon.hasClass("fa-angle-double-right");
			span.text(showAll ? "收起": "显示全部");
			icon.toggleClass("fa-angle-double-right fa-angle-double-left");
			showAll ? icon.insertBefore(span) : icon.insertAfter(span);
		});
	}
	var deleteProjectModal = $("#deleteProjectModal");
	function bindDeleteEvent() {
		$(".project-delete").click(function(e) {
			e.preventDefault();
			deleteProjectModal.find(".confirm-handler").width("");
			deleteProjectModal.find(".delete-input").addClass("hidden").val("");
			deleteProjectModal.modal("show");
			deleteProjectModal.data("id", $(this).data("id"));
		});
		$(".confirm-handler").click(function() {
			var me = $(this), deleteInput = me.next("input.delete-input"), id;
			if (deleteInput.hasClass("hidden")) {
				me.animate({width: "200px"}, 300, function() {
					deleteInput.removeClass("hidden");
				});
			} else {
				if (deleteInput.val() === "DELETE") {
					deleteProjectModal.modal("hide");
					deleteInput.addClass("hidden").val("");
					me.width("");
					deleteProject(deleteProjectModal.data("id"));
				} else {
					deleteInput.val("").focus();
				}
			}
		});
	}
	// 项目删除
	function deleteProject(id) {
		console.log(id);	
	}
});