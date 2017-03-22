(function($) {

//	"use strict";

	var methods = {
		init: function(options) {
			return this.each(function() {
				var $this = $(this), arrow = "<span class='crp-schedule-arrow'></span>";
				var settings = $this.data('scheduleFlow');

				if(typeof(settings) == 'undefined') {
					var defaults = {
						state: "default", // danger/highlight/active
						repeatLink: "javascript:;",
						steps: 1,
						/* titles defined step header */
						titles: [{
							text: "无",
							href: "javascript:;",
							action: false
						}],
						stop: function(){},
						refresh: function() {},
						contents: ["-"]
					}
					settings = $.extend({}, defaults, options);

					$this.data('scheduleFlow', settings);
				} else {
					settings = $.extend({}, settings, options);
				}
				var container = $this.addClass("crp-schedule-flow")
						.append("<div class='crp-schedule-container'></div>").children(),
					actionButtonsBox = "<a class='fa fa-stop crp-schedule-action' title='终止运行' href='" + settings.actionLink + "'></a>";
				container.append("<span class='crp-schedule-start active'></span>").append(arrow);
				if (settings.steps && settings.steps > 0) {
					for (var i = 0; i < settings.steps; i++) {
						container.append("<div class='crp-schedule-step crp-schedule-step-"+ (i + 1) +" default'>" +
								"<a class='crp-schedule-step-title' href='"+ settings.titles[i].href+"'>" + settings.titles[i].text + "</a>" +
								"<div class='crp-schedule-step-content'><time>"+ settings.contents[i] + "</time></div>" +
							"</div>").append(arrow);
						container.find(".crp-schedule-step-"+ (i + 1) + " .crp-schedule-step-content")
								.append($(settings.titles[i].action ? actionButtonsBox : actionButtonsBox).data("step", i + 1));
					}
				}
				container.append("<span class='crp-schedule-end'><a class='repeat fa fa-repeat' title='重新运行' id='" + settings.reset.id + "' href='" + settings.reset.link + "'></a></span>");
				container.find(".crp-schedule-action").bind("click", settings.stop);
				container.find(".fa-repeat").bind("click", settings.refresh);
				container.width(settings.steps * 140 + (settings.steps + 1) * 36 + 30 * 2);
			});
		},
		finish: function(content) {
			var $this = $(this);
			if (content) {
				if ($this.data("scheduleFlow")) {
					$this.find(".crp-schedule-end").addClass("active");
				} else {
					$this.closest(".crp-schedule-container").find(".crp-schedule-end").addClass("active");
				}
			}
		},
		refresh: function() {
			var $this = $(this);
			$this.find(".crp-schedule-step").removeClass("default highlight active danger").addClass("default");
			$this.find(".crp-schedule-step-content time").html("-");
			$this.find(".crp-schedule-end").removeClass("active");
		},
		stop: function(content) {
			var $this = $(this), currStep = $this.find(".crp-schedule-action:visible").closest(".crp-schedule-step");
			currStep.removeClass("default highlight active danger").addClass("danger");
			currStep.nextAll(".crp-schedule-step").addClass("danger").find(".crp-schedule-step-content time").html("-");
			currStep.nextAll(".crp-schedule-end").addClass("active");
		},
		setContent: function(content) {
			var $this = this;
			if (content) {
				$this.find(".crp-schedule-step-" + content[0]).find(".crp-schedule-step-content time").html(content[1]);
			}
		},
		getContent: function(content) {
			var $this = this;
			if (content) {
				return $.trim($this.find(".crp-schedule-step-" + content[0]).find(".crp-schedule-step-content time").html());
			} else {
				return 0;
			}
		},
		updateState: function(content) {
			var $this = this;
			$this.find(".crp-schedule-step-" + content[0]).removeClass("default highlight active danger").addClass(content[1]);
		}
	};

	$.fn.scheduleFlow = function() {
		var method = arguments[0];
		if(methods[method]) {
			 return methods[method].call(this, Array.prototype.slice.call(arguments, 1));
		} else if( typeof(method) == 'object' || !method ) {
			return methods.init.apply(this, arguments);
		} else {
			$.error( 'Method ' +  method + ' does not exist on $.scheduleFlow' );
			return this;
		}
	}
})(jQuery);