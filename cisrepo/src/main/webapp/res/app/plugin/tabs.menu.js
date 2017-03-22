(function() {

	"use strict";

	$.fn.tabsMenu = function(option) {
		var el = this, opts = $.extend({}, {
				direction: "vertical",
				box: $(".tabs-menu-box")
			}, option),
			menu = opts.box.children("div"),
			header = menu.find("ul").addClass("tabs-menu-header " + opts.direction),
			links = header.find("li > a").addClass("tabs-menu-link");
		menu.addClass("tabs-menu");
		opts.box.children("div").addClass("hidden");
		menu.children("div").addClass("tabs-menu-content hidden").find("a").addClass("tabs-menu-target");
		el.on({
			"mouseenter": function(e) {
				var me = $(this).addClass("hover"),
					thisMenu = opts.box.find(me.data("target"));
				if (thisMenu.length) {
					thisMenu.siblings("div").addClass("hidden");
					thisMenu.removeClass("hidden");
					if (!thisMenu.find(".tabs-menu-link.hover").length) {
						thisMenu.find(".tabs-menu-link").first().addClass("hover");
					}
					thisMenu.find(".tabs-menu-content").first().removeClass("hidden");
					opts.box.addClass("show");
				} else {
					opts.box.removeClass("show");
				}
			},
			"mouseleave": function(e) {
				$(this).removeClass("hover");
				menu.find(".tabs-menu:visible").addClass("hidden");
				opts.box.removeClass("show");
				el.filter(".hover").removeClass("hover");
				el.first().addClass("hover");
			}
		});
		opts.box.on({
			"mouseenter": function(e) {
				opts.box.addClass("show");
				el.filter(function(){
					return $(this).data("target") == "#" + menu.filter(":visible").attr("id");
				}).addClass("hover");
			},
			"mouseleave": function(e) {
				el.removeClass("hover").first().addClass("hover");
				menu.find(".tabs-menu-link:visible").removeClass("hover").end()
						.addClass("hidden").children("div").addClass("hidden");
				opts.box.removeClass("show");
				opts.box.children("div")
			}
		});
		links.on({
			"mouseenter": function(e) {
				var me = $(this), thisMenu = menu.filter(":visible"),
					target = thisMenu.find(me.data("target"));
				links.removeClass("hover");
				thisMenu.find(".tabs-menu-content").addClass("hidden");
				me.addClass("hover");
				target.removeClass("hidden");
			},
			"mouseleave": function(e) {
				var me = $(this), target = menu.find($(this).data("target"));
				me.removeClass("hover");
				if (!me.siblings(".hover").length && opts.box.is(":visible")) {
					me.parent().children().first().addClass("hover");
				} else {
					target.addClass("hidden");
				}
			}
		});
		opts.box.find(".tabs-menu-content").on({
			"mouseenter": function(e) {
				$(this).removeClass("hidden");
			}
		});
	}
})(jQuery);