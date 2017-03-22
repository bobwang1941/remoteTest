$(function() {
	var waitingTable = $("#waitingTable"),
		buildingTable = $("#buildingTable"),
		builtTable = $("#builtTable"),
		cancelBuildModal = $("#cancelBuildModal"),
		stopBuildModal = $("#stopBuildModal"),
		isAjax = getCookie("_nk_"),
		tableOpts = {
			"paging":{
				"enabled": true,
				"position": "right"
			}
		}, dateFormat = "yyyy-MM-dd hh:mm:ss";
	$(".crp-collapse-link").click(function() {
		var me = $(this), box = me.parent();
		$(box).toggleClass("collapsed");
		me.children("i").toggleClass("fa-chevron-up fa-chevron-down");
	});
	function getStatus(status) {
		switch(status) {
			case -1:
				return "<i class='fa fa-times'></i>";
				break;
			case 1:
				return "<i class='fa fa-check'></i>";
				break;
			case 2:
				return "<i class='fa fa-ban'></i>";
				break;
			case 4:
				return "<i class='glyphicon glyphicon-exclamation-sign'></i>";
				break;
		}
	}
	function initBuildTable(box, url, flag) {
		ajax({
			loading: box.parent(),
			url: url,
			dataType: "json",
			success: function(json) {
				var tbody = box.find("tbody"), list, status;
				tbody.html("");
				if (json.success) {
					list = json.data;
					if (list && list.length) {
						$.each(list, function(index, obj) {
							status = obj.status;
							tbody.append("<tr></tr>");
							tbody.children("tr").append("<td>" + (index + 1) + "</td>");
							tbody.children("tr").append("<td><a href='" + obj.projectHref + "' title='" + obj.name +"'>" + obj.name + "</a></td>");
							tbody.children("tr").append("<td>" + obj.builder + "</td>");
							tbody.children("tr").append("<td class='text-center'>" + obj.buildId + "</td>");
							tbody.children("tr").append("<td>" + new Date(obj.startTime).Format(dateFormat)+ "</td>");
							if (flag == 1) {
								tbody.children("tr").append("<td><strong>" + convertMsecToTime(obj.waitTime) + "</strong></td>");
								tbody.children("tr").append(json.admin ? 
										"<td class='text-center'>" +
											"<a class='cancel-build' title='取消构建' href='javascript:void(0)' data-project='" + obj.name + "' data-groupid='" + obj.groupId + "'>" +
												"<i class='fa fa-times-circle'></i>" +
											"</a>" +
										"</td>" : "-");
							} else if (flag == 2) {
								tbody.children("tr").append("<td><i class='fa fa-spinner fa-spin'></i> <strong>" + convertMsecToTime(obj.waitTime) + "</strong></td>");
								tbody.children("tr").append("<td><strong>" + convertMsecToTime(obj.expectedEndTime) + "</strong></td>");
								tbody.children("tr").append(json.admin ? 
										"<td class='text-center'>" +
											"<a class='stop-build' title='终止构建' href='javascript:void(0)' data-project='" + obj.name + "' data-groupid='" + obj.groupId + "'>" +
												"<i class='fa fa-stop'></i>" +
											"</a>" +
										"</td>" : "-");
							} else if (flag == 3) {
								tbody.children("tr").append("<td>" + new Date(obj.endTime).Format(dateFormat)+ "</td>");
								tbody.children("tr").append("<td class='text-center'>" + getStatus(status) + "</td>");
							}
						});
						box.footable(tableOpts);
						initTooltip();
						bindCancelEvent(tbody, flag);
					}
				}
			}
		});
	}
	function initTooltip() {
		$('.build-state-help').tooltip('destroy').tooltip({
			"html": true,
			"container": $('.build-state-help').parent(),
			'placement' : 'bottom',
			'title' : "<div class='tooltip-help'>\
							<div><i class='fa fa-check'></i>：构建成功</div>\
							<div><i class='glyphicon glyphicon-exclamation-sign'></i>：被终止</div>\
							<div><i class='fa fa-times'></i>：构建失败</div>\
							<div><i class='fa fa-ban'></i>：被取消</div>\
						</div>"
		});
	}
	function initAllBuildTable() {
		initBuildTable(waitingTable, isAjax ? "queueing.do" : "data/queueing.json", 1);
		initBuildTable(buildingTable, isAjax ? "building.do" : "data/building.json", 2);
		initBuildTable(builtTable, isAjax ? "buildHistory.do" : "data/build_history.json", 3);
	}
	function bindCancelEvent(parent, flag) {
		if (flag == 1) {
			parent.find(".cancel-build").click(function() {
				var projectName = $(this).data("project"), groupId = $(this).data("groupid");
				cancelBuildModal.find(".project-name").html(projectName);
				cancelBuildModal.find(".modal-footer #cancelBuildYes").data("groupid", groupId)
				cancelBuildModal.modal("show"); 
			});
		} else if(flag == 2) {
			parent.find(".stop-build").click(function(){
				var projectName = $(this).data("project"), groupId = $(this).data("groupid");
				stopBuildModal.find(".project-name").html(projectName);
				stopBuildModal.find(".modal-footer #stopBuildYes").data("groupid", groupId);
				stopBuildModal.modal("show");
			});
		}
	}
	$("#cancelBuildYes").click(function() {
		var me = $(this);
		cancelBuildModal.modal("hide");
		ajax({
			loading: ".main",
			url: isAjax ? "cancelBuild.do?groupId=" + me.data("groupid") : "data/result.json",
			dataType: "json",
			success: function(json) {
				if (json.success) {
					if (json.data)
						initAllBuildTable();
				} else {
					alert(json.errorMessage);
				}
			}
		})
	})
	$("#stopBuildYes").click(function() {
		var me = $(this);
		stopBuildModal.modal("hide");
		ajax({
			loading: ".main",
			url: isAjax ? "stopBuild.do?groupId=" + me.data("groupid") : "data/result.json",
			dataType: "json",
			success: function(json) {
				if (json.success) {
					if (json.data)
						initAllBuildTable();
				} else {
					alert(json.errorMessage);
				}
			}
		});
	});
	initAllBuildTable();
	setInterval(function() {
		initAllBuildTable();
	}, 10000)
	$(".main").scroll(function() {
		var top = $(document).scrollTop(); // 定义变量，获取滚动条的高度
		var menu = $(".crp-panel-menu"); // 定义变量，抓取#menu
		var items = $(".crp-panel"); // 定义变量，查找.item

		var curId = ""; // 定义变量，当前所在的楼层item #id
		items.each(function() {
			var m = $(this); // 定义变量，获取当前类
			var itemsTop = m.offset().top; // 定义变量，获取当前类的top偏移量
			if (top > itemsTop - 160) {
				curId = "#" + m.attr("id");
			} else {
				return false;
			}
		});

		// 给相应的楼层设置cur,取消其他楼层的cur
		var curLink = menu.find(".cur");
		if (curId && curLink.attr("href") != curId) {
			curLink.removeClass("cur");
			menu.find("[href=" + curId + "]").addClass("cur");
		}
	});
});