$(function() {
	var counterOption = {
		clockFace : "Counter",
		autoStart : false,
		minimumDigits : 4
	};
	var projectNum = new FlipClock($('.day-project-num'), counterOption),
		onlineNum = new FlipClock($('.online-num'), counterOption),
		dayBuildNum = new FlipClock($('.day-build-num'), counterOption),
		dayDeliveryNum = new FlipClock($('.day-delivery-num'), counterOption),
		buildNum = new FlipClock($('.week-build-num'), counterOption),
		buildRate = new FlipClock($('.week-build-rate'), $.extend({}, counterOption,{
			minimumDigits : 5
		})),
		deliveryNum = new FlipClock($('.week-delivery-num'), counterOption),
		deliveryRate = new FlipClock($('.week-delivery-rate'),  $.extend({}, counterOption,{
			minimumDigits : 5
		})),
		stabilityRate = new FlipClock($('.stability'),  $.extend({}, counterOption,{
			minimumDigits : 5
		}));
	stabilityRate.setValue(99.99);
	setInterval(function() {
		projectNum.setValue(parseInt(Math.random()*1000 + 500));
		onlineNum.setValue(parseInt(Math.random()*1000 + 500));
		dayBuildNum.setValue(parseInt(Math.random()*1000 + 500));
		dayDeliveryNum.setValue(parseInt(Math.random()*1000 + 500));
		buildNum.setValue(parseInt(Math.random()*1000 + 500));
		deliveryNum.setValue(parseInt(Math.random()*1000 + 500));
		buildRate.setValue((Math.random()*100).toFixed(2));
		deliveryRate.setValue((Math.random()*100).toFixed(2));
	}, 2000);
	$("[data-anchor=page1]").find(".godown").addClass("first-show");
	$("#fullPage").fullpage({
		navigation: true,
		slideSelector: "fp-sliders",
		anchors: ["page1", "page2", "page3"],
		onLeave: function(currIndex, nextIndex, element) {
			var godown = $("[data-anchor=page"+ currIndex +"]").find(".godown");
			if (currIndex == 1 && godown && godown.hasClass("first-show")) {
				godown.removeClass("first-show");
			}
		}
	});
	$(".cooperation-scroll").cxScroll({
		step: 3
	});

})
