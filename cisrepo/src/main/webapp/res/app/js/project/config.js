$(function() {
	$('.build-state-help').tooltip({
		"html": true,
		"container": $('.build-state-help').parent(),
		'placement' : 'bottom',
		'title' : "<div class='tooltip-help'>\
						<div class='queuing'><i class='fa fa-minus-circle'></i>：排队中</div>\
						<div class='building'><i class='fa fa-spinner'></i>：构建中</div>\
						<div class='success'><i class='fa fa-check'></i>：构建成功</div>\
						<div class='failure'><i class='fa fa-times'></i>：构建失败</div>\
					</div>"
	});
	var scheduleFlow = $("#buildWorkFlow").scheduleFlow({
		steps: 3,
		titles: [{
			text: "构建",
			href: "#"
		}, {
			text: "静测",
			href: "#"
		}, {
			text: "发布",
			href: "#"
		}],
		reset: {
			link: "#",
			id: "rebuild"
		},
		actionLink: "#",
		contents: [
			"-",
			"-",
			"-"
		],
		stop: function() {
			scheduleFlow.scheduleFlow("stop");
			clearInterval(timer);
		},
		refresh: function() {
			scheduleFlow.scheduleFlow("refresh");
			startTimer();
		}
	});
	startTimer();
	var timer;
	function startTimer() {
		var t = 1;
		timer = setInterval(function() {
		var time = parseInt(scheduleFlow.scheduleFlow("getContent", t));
		if (isNaN(time)) {
			time = 0;
		}
		if (time > 10) {
			if (time < 20) {
				scheduleFlow.scheduleFlow("updateState", "1", "highlight");
				scheduleFlow.scheduleFlow("setContent", "1", (time + 1) + "秒");
				scheduleFlow.scheduleFlow("setContent", "2", (time + 1) + "秒");
				scheduleFlow.scheduleFlow("setContent", "3", (time + 1) + "秒");
			} else if (time == 20) {
				scheduleFlow.scheduleFlow("updateState", "1", "active");
				scheduleFlow.scheduleFlow("setContent", "1", new Date().Format("yyyy-MM-dd hh:mm:ss") + "<br>"+ time +"秒");
				scheduleFlow.scheduleFlow("updateState", "2", "highlight");
				scheduleFlow.scheduleFlow("setContent", "2", (time + 1) + "秒");
				scheduleFlow.scheduleFlow("setContent", "3", (time + 1) + "秒");
				t++;
			} else if (time < 30) {
				scheduleFlow.scheduleFlow("setContent", "2", (time + 1) + "秒");
				scheduleFlow.scheduleFlow("setContent", "3", (time + 1) + "秒");
			} else if (time == 30) {
				scheduleFlow.scheduleFlow("updateState", "2", "active");
				scheduleFlow.scheduleFlow("setContent", "2", new Date().Format("yyyy-MM-dd hh:mm:ss") + "<br>"+ time +"秒");
				scheduleFlow.scheduleFlow("updateState", "3", "highlight");
				scheduleFlow.scheduleFlow("setContent", "3", (time + 1) + "秒");
				t++;
			} else if (time < 40) {
				scheduleFlow.scheduleFlow("setContent", "3", (time + 1) + "秒");
			} else if (time == 40) {
				scheduleFlow.scheduleFlow("updateState", "3", "danger");
				scheduleFlow.scheduleFlow("setContent", "3", new Date().Format("yyyy-MM-dd hh:mm:ss") + "<br>"+ time +"秒");
				scheduleFlow.scheduleFlow("finish", true);
				clearInterval(timer);
			}
		} else {
			scheduleFlow.scheduleFlow("setContent", "1", (time + 1) + "秒");
			scheduleFlow.scheduleFlow("setContent", "2", (time + 1) + "秒");
			scheduleFlow.scheduleFlow("setContent", "3", (time + 1) + "秒");
		}
	}, 1000);
	}
});