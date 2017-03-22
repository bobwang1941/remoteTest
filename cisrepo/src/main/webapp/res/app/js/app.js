/**
 * common use
 * 
 */
(function($) {
	/*
	 * date格式转换
	 */
	Date.prototype.Format = function(fmt) {
		var o = {
			"M+" : this.getMonth() + 1, // 月份
			"d+" : this.getDate(), // 日
			"h+" : this.getHours(), // 小时
			"m+" : this.getMinutes(), // 分
			"s+" : this.getSeconds(), // 秒
			"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
			"S" : this.getMilliseconds()
			// 毫秒
		};
		if (/(y+)/.test(fmt))
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4
							- RegExp.$1.length));
		for (var k in o)
			if (new RegExp("(" + k + ")").test(fmt))
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1)
								? (o[k])
								: (("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;
	};
	/**
	 * 获取cookie值，用来判断环境
	 */
	getCookie = function(value) {
		if (document.cookie.length > 0) { // 先查询cookie是否为空，为空就return ""
			var c_start = document.cookie.indexOf(value + "=") // 通过String对象的indexOf()来检查这个cookie是否存在，不存在就为
			// -1
			if (c_start != -1) {
				var c_start = c_start + value.length + 1; // 最后这个+1其实就是表示"="号啦，这样就获取到了cookie值的开始位置
				var c_end = document.cookie.indexOf(";", c_start); // 其实我刚看见indexOf()第二个参数的时候猛然有点晕，后来想起来表示指定的开始索引的位置...这句是为了得到值的结束位置。因为需要考虑是否是最后一项，所以通过";"号是否存在来判断
				if (c_end == -1)
					c_end = document.cookie.length;
				return unescape(document.cookie.substring(c_start, c_end)) // 通过substring()得到了值。想了解unescape()得先知道escape()是做什么的，都是很重要的基础，想了解的可以搜索下，在文章结尾处也会进行讲解cookie编码细节
			}
		}
		return null;
	};
	/**
	 * 空字符串或者无权限显示转化为“-”
	 */
	convertNullToDefault = function(value) {
		var type = typeof value;
		if (type == "boolean") {
			if (!value) {
				return "-";
			}
		} else if (type == "string" || type == "object") {
			if (!value) {
				return "-";
			}
		} else if (type == "number") {
			if (value == 0) {
				return "-";
			}
		}
	};
	/**
	 * 毫秒数转化为天、时、分、秒
	 */
	convertMsecToTime = function(mills) {
		var ms = mills / 1000, time = parseInt(ms) + "秒";
		if (parseInt(ms) > 60) {
			var second = parseInt(ms) % 60;
			var min = parseInt(ms / 60);
			time = min + "分" + second + "秒";

			if (min > 60) {
				min = parseInt(ms / 60) % 60;
				var hour = parseInt(parseInt(ms / 60) / 60);
				time = hour + "小时" + min + "分" + second + "秒";

				if (hour > 24) {
					hour = parseInt(parseInt(ms / 60) / 60) % 24;
					var day = parseInt(parseInt(parseInt(ms / 60) / 60)
							/ 24);
					time = day + "天" + hour + "小时" + min + "分" + second + "秒";
				}
			}
		}
		return time;
	};
	/**
	 * 全选
	 * 
	 * btn:控制器 parents: 所有被选择元素的父节点 默认：checkbox
	 */
	selectAll = function(btn, parents) {
		var selcetor = ":checkbox:not([data-type=disabled])";
		$(btn).unbind("click").bind("click", function() {
			$(parents).find(selcetor).prop("checked", true);
		});
	}
	/**
	 * 全不选
	 * 
	 * btn:控制器
	 * parents: 所有被选择元素的父节点
	 * 默认：checkbox
	 */
	unselectAll = function(btn, parents) {
		var selcetor = ":checkbox:checked:not([data-type=disabled])";
		$(btn).unbind("click").bind("click", function() {
			$(parents).find(selcetor).prop("checked", false);
		});
	}
	/**
	 * 反选
	 * 
	 * btn:控制器
	 * parents: 所有被选择元素的父节点
	 * 默认：checkbox
	 */
	inverseAll = function(btn, parents) {
		var selcetor = ":checkbox:not([data-type=disabled])";
		$(btn).unbind("click").bind("click", function() {
			var ches = $(parents).find(selcetor),
				selectedChes = ches.filter(":checked");
			ches.prop("checked", true);
			selectedChes.prop("checked", false);
		});
	};
	/**
	 * 
	 * 
	 * btn:控制器
	 * parents: 所有被选择元素的父节点
	 * 默认：checkbox
	 */
	ajax = function(options) {
		var loadingParent = options.loading ? $(options.loading) : null;
		if (loadingParent) {
			loadingParent.prepend("<div class='crp-loading'><div class='bounce1'></div><div class='bounce2'></div><div class='bounce3'></div></div>");
		}
		$.ajax(options).always(function() {
			if (loadingParent) {
				loadingParent.find(".crp-loading").remove();
			}
		});
	};
	$.fn.bootstrapValidator.validators = $.extend({} ,$.fn.bootstrapValidator.validators, {
		commonLengthLimit : {
			/**
			 * @param {BootstrapValidator}
			 *			表单验证实例对象
			 * @param {jQuery} $field jQuery 对象
			 * @param {Object} 表单验证配置项值
			 * @returns {boolean}
			 */
			validate: function(validator, $field, options) {
				// 表单输入的值
				 var value = $field.val();
				// options为<validatorOptions>对象，直接.获取需要的值
				if (value && value.length > 200) {
					return {valid : false, message: '最大输入200字符！'};
				}
				return true;
			}
		},
		svnTagCheck: {
			validate: function(validator, $field, options) {
				// 表单输入的值
				 var value = $field.val();
				if (value) {
					var v = $.trim(value).toLowerCase();
					if (!(!v.endsWith("tags") && !v.endsWith("tags/") && !v.endsWith("@head"))) {
						return {valid : false, message: '不能以tags、tags/或@HEAD结尾！'};
					}
				}
				return true;
			}
		},
		emailListCheck: {
			validate: function(validator, $field, options) {
				// 表单输入的值
				var value = $field.val();
				if(value) {
					var emailList = value.split(","), checked = true;
					for (var i = 0; i < emailList.length; i++) {
						if (!(/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test(emailList[i]))) {
							checked = false;
							break;
						}
						checked = true;
					}
					if (!checked) {
						return {valid : false, message: "邮箱列表格式不正确！"};
					} else if(value.length > 2000) {
						return {valid : false, message: "最大输入长度为2000！"};
					}
				}
				return true;
			}
		},
		// 中文汉字，英文，数字，下划线(_)和-
		cnWordCheck: {
			validate: function(validator, $field, options) {
				// 表单输入的值
				var value = $field.val(), checked = /^[\u4E00-\u9FFF\w\\(\)-\.\_]+$/.test(value);
				if (value) {
					if (!checked) {
						return {valid : false, message: "只能输入中英文字符、数字、_和-"};
					}
				}
				return true;
			}
		}
	});
	/**
	 * type: error/alert/ok
	 */
	window.alert = function(msg, type, callback) {
		var icon = "exclamation";
		if (type == "ok") {
			icon = "check";
		} else if (type == "error") {
			icon = "times";
		}
		var dialogHTML;
		dialogHTML += '<div id="customDialog" class="modal fade modal-default in" data-backdrop="static" tabindex="-1">';
		dialogHTML += '<div class="modal-dialog">';
		dialogHTML += '<div class="modal-content">';
		dialogHTML += '<div class="modal-header">';
		dialogHTML += '<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
		dialogHTML += '<span aria-hidden="true">&times;</span>';
		dialogHTML += '</button>';
		dialogHTML += '<h4 class="modal-title" ></h4>';
		dialogHTML += '</div>';
		dialogHTML += '<div class="modal-body crp-dialog-body">';
		dialogHTML += '<i class="fa fa-' + icon + '"></i>';
		dialogHTML += "<p>" + msg + "</p>";
		dialogHTML += '</div>';
		dialogHTML += '<div class="modal-footer">';
		dialogHTML += '<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>';
		dialogHTML += '</div>';
		dialogHTML += '</div>';
		dialogHTML += '</div>';
		dialogHTML += '</div>';
		if ($('#customDialog').length <= 0) {
			$('body').append(dialogHTML);
		}
		$('#customDialog').on('hidden.bs.modal', function() {
			$('#customDialog').remove();
			if (typeof callback == 'function') {
				callback();
			}
		}).modal('show');
	}
})(jQuery);
