function resizeFooter() {
	$(".crp-full-search-result").find(".search-results").animate({
		"min-height": (window.outerHeight - 60 -2 * 78 + 12  - $(".crp-full-search-result .crp-center-content").outerHeight(true)) + "px"
	});
}

$(function() {
	var parents = $(".crp-full-search-result"),
		categoryParent = parents.find(".search-results-category"),
		itemsParent = parents.find(".search-results-list"),
		pagenavigator = parents.find(".search-results-pagenavigator"),
		normalBtn = $("<button class='btn -btn-default'></button>"),
		normalItem = $("<div class='search-results-item'><a class='item-content'></a></div>"),
		totalCount = 0, numberOfPages = 10,
		pageOption = {
				bootstrapMajorVersion : 3,
				numberOfPages : numberOfPages,
				totalPages : 1,
				pageUrl: "javascript:void(0);",
				onPageClicked: function (event, originalEvent, type, page) {
					itemsParent.children().addClass("hidden").slice((page - 1) * 10, page * 10).removeClass("hidden");
				}
			};
	$(window).resize(function() {
		resizeFooter();
	});
	var queryInput = parents.find("[name=query]");
	function bindCategoryToggle() {
		$(".search-results-category").find("button").click(function() {
			var me = $(this), category = me.data("query");
			itemsParent.html("");
			ajax({
				loading: ".search-results-list",
				url: "data/result-" + category +".json",
				dataType: "json",
				success: function(obj) {
					var itemsList, item, itemText;
					if (obj.success) {
						if (obj.data) {
							totalCount = obj.data.totalCount;
							if (totalCount > 0) {
								itemsList = obj.data.items;
								if (itemsList && itemsList.length) {
									for(var j = 0; j < itemsList.length; j++) {
										itemText = itemsList[j].text.split(queryInput.val()).join("<span class='highlight-matcher'>"+ queryInput.val() +"</span>");
										item = normalItem.clone().find("a").html(itemText).attr("href", itemsList[j].target).end();
										if (j >= 10) {
											item.addClass("hidden");
										}
										itemsParent.append(item)
									}
								}
								if (totalCount > 10) {
									if(pagenavigator.data("bootstrapPaginator")) {
										pagenavigator.bootstrapPaginator("destroy");
									}
									pagenavigator.bootstrapPaginator($.extend({}, pageOption, {
										totalPages: Math.ceil(totalCount / numberOfPages)
									}));
								} else {
									pagenavigator.html("");
								}
							}
						}
					} else {
						alert(obj.errorMessage)
					}
					me.siblings("button").removeClass("active").end().addClass("active");
				}
			})
		});
	}
	if (queryInput.val()) {
		loadSearchResult(queryInput.val());
	}
	$("#innerFullSearch").click(function() {
		loadSearchResult(queryInput.val());
	})
	function loadSearchResult(queryStr) {
		ajax({
			loading: ".search-results-category",
			url: "data/result" + (queryStr != "构建" ? "-null" : "") + ".json?query" + queryStr,
			dataType: "json",
			success: function(obj) {
				var categoryList, category, itemsList, item, itemText;
				categoryParent.html("");
				itemsParent.html("");
				if (obj.success) {
					if (obj.data) {
						totalCount = obj.data.totalCount;
						parents.find(".total-count").html(obj.data.totalCount);
						if (totalCount > 0) {
							categoryList = obj.data.category;
							itemsList = obj.data.items;
							if (categoryList && categoryList.length) {
								for(var i = 0; i < categoryList.length; i++) {
									category = normalBtn.clone().text(categoryList[i].title + "（" + categoryList[i].count + "）")
											.data("query", categoryList[i].query);
									if (i == 0) {
										category.addClass("active");
									}
									categoryParent.append(category);
								}
							}
							bindCategoryToggle();
							if (itemsList && itemsList.length) {
								for(var j = 0; j < itemsList.length; j++) {
									itemText = itemsList[j].text.split(queryStr).join("<span class='highlight-matcher'>"+ queryStr +"</span>");
									item = normalItem.clone().find("a").html(itemText).attr("href", itemsList[j].target).end();
									if (j >= 10) {
										item.addClass("hidden");
									}
									itemsParent.append(item)
								}
							}
							if (totalCount > 10) {
								if(pagenavigator.data("bootstrapPaginator")) {
									pagenavigator.bootstrapPaginator("destroy");
								}
								pagenavigator.bootstrapPaginator($.extend({}, pageOption, {
										totalPages: Math.ceil(totalCount / numberOfPages)
									}));
							} else {
								pagenavigator.html("");
							}
						} else {
							pagenavigator.html("");
							categoryParent.append("<div class='text-center'>没有找到 \"" + queryStr + "\" 的相关的结果！</div>");
						}
					}
				} else {
					alert(obj.errorMessage)
				}
			}
		})
	}
});