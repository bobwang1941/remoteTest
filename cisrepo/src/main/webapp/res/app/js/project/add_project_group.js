$(function() {
	$(".crp-side-list-menu").find("ul > li")
			.filter(".active").removeClass("active").end()
			.filter(".info").addClass("active");
	var groupForm = $(".create-project-form"),
		username = getCookie("_nk_"),isLocal = !username,
		createProjectWizard = $("#addProjectGroupWizard"),
		groupType = groupForm.find("[name=groupType]"),
		submitBtn = $("#createProjectYes");
	// form 验证
	groupForm.bootstrapValidator({
		feedbackIcons : {// input状态样式图片 
			valid: 'glyphicon glyphicon-ok', 
			invalid: 'glyphicon glyphicon-remove', 
			validating: 'glyphicon glyphicon-refresh' 
		},
		fields : {
			departmentId : {
				validators : {
					notEmpty : {
						message : '请选择一个事业部！'
					}
				}
			},
			buildScriptSite: {
				validators : {
					commonLengthLimit: true
				}
			},
			svnTagSite: {
				validators : {
					commonLengthLimit: true,
					svnTagCheck: true
				}
			},
			baseRdmPrimaryVersion: {
				validators : {
					commonLengthLimit: true
				}
			},
			baseRdmProjectAlias: {
				validators : {
					commonLengthLimit: true
				}
			},
			rdmMailList: {
				validators : {
					emailListCheck: true
				}
			},
			rdmProjectAlias: {
				validators : {
					commonLengthLimit: true
				}
			},
			rdmPrimaryVersion: {
				validators : {
					commonLengthLimit: true
				}
			},
			rdmBuildPrefix: {
				validators : {
					cnWordCheck: true,
					commonLengthLimit: true
				}
			},
			rdmVersion: {
				validators : {
					commonLengthLimit: true
				}
			},
			mailRecipients: {
				validators : {
					emailListCheck: true
				}
			}
		}
	});
	var btnFinish = $('<button type="button" id="submitGroupInfo">提交</button>').addClass('btn btn-default sw-btn-finish');
	function bindSubmitEvent() {
		$("#submitGroupInfo").on("click", function() {
			var bootstrapValidator = groupForm.data('bootstrapValidator');
			bootstrapValidator.validate();
			if(bootstrapValidator.isValid()) {
				var type = groupType.val();
				ajax({
					url: isLocal ? "data/addProjectGroup.json" : "addProjectGroup.do",
					type: "POST",
					data: groupForm.serialize(),
					dataType: "json",
					success: function(json) {
						if (json.success) {
							var aa = alert("创建成功<br >跳转 <a href='add_project.jsp' id='recreateGroup1'>新建项目 >> </a>", "ok", function() {
								window.location.href = json.data;
							});
//							resetForm();
						} else {
							alert(json.errorMessage);
						}
					}
				});
			}
		});
	}
	
	// 渲染group wizard
	createProjectWizard.smartWizard({
		theme: "dots",
		transitionEffect : 'fade',
		useURLhash: false,
		keyNavigation: false,
		showStepURLhash: false,
		autoAdjustHeight: false,
		lang : {
			next : '下一步',
			previous : '上一步'
		},
		contentCache: false,
		hiddenSteps: [2],
		toolbarSettings : {
			toolbarPosition : 'bottom',
			toolbarButtonPosition: "left"
		},
		contentCache: false,
		anchorSettings : {
			anchorClickable : false
		}
	});
	createProjectWizard.on("leaveStep", function(e, anchorObject, stepNumber, stepDirection) {
		var res = true, bootstrapValidator = groupForm.data('bootstrapValidator'),
			nextBtn = $(e.target).find(".sw-btn-next");
		if (stepDirection === "backward") {
			nextBtn.removeClass("hidden").next(btnFinish).remove();
		}
		if (stepDirection === "forward") {
			bootstrapValidator.validate();
			res = bootstrapValidator.isValid();
			if (res && (stepNumber == 1 || stepNumber == 2)) {
				nextBtn.addClass("hidden").after(btnFinish);
				bindSubmitEvent();
			}
		}
		return res;
	});
	groupForm.find("[name $=BuildType]").change(function() {
		var parents = $(this).closest(".form-group").nextAll(".form-group");
		parents.find(".daily-build-type-text").text($(this)[0].labels[0].textContent);
	});
//	function resetForm() {
//		groupForm[0].reset();
//		groupForm.find(".selectpicker").trigger('change');
//		groupForm.find(".type-list").html("");
//		createProjectWizard.find(".step-content").show();
//		groupForm.bootstrapValidator("resetForm", true);
//		createProjectWizard.smartWizard("reset");
//		groupType.change();
//	}
	/**
	 * 启用或禁用不需要提交的数据
	 * flag=true: 禁用多组件输入框
	 * flag=false: 禁用多分支输入框
	 * @param flag
	 */
	function toggleUnusedData(flag) {
		var modulesData = $("[data-control=module], .add-rdm-info").find("select, input, textarea"),
			branchesData = $("[data-control=branch], .add-defalut-data").find("select, input, textarea");
		if (flag) {
			modulesData.attr("disabled", "disabled");
			branchesData.removeAttr("disabled");
		} else {
			branchesData.attr("disabled", "disabled");
			modulesData.removeAttr("disabled");
		}
	}
	var buildTypeTpl = $("<div class='col-sm-6 checkbox3 checkbox-primary checkbox-check checkbox-round checkbox-light'>\
							<input type='checkbox' name='buildType' required>\
							<label></label>\
						</div>");
	groupType.change(function() {
		var me = $(this);
		if (me.is(":checked")) {
			toggleUnusedData(me.val() != 4);
			if (me.val() == "4") {
				createProjectWizard.smartWizard("stepState", 2, "hide");
				createProjectWizard.smartWizard("stepState", 1, "show");
				$("[data-control=module]").removeClass("hidden");
				$("[data-control=branch]").addClass("hidden");
				submitBtn.removeAttr("disabled");
			} else {
				createProjectWizard.smartWizard("stepState", 1, "hide");
				createProjectWizard.smartWizard("stepState", 2, "show");
				$(".type-list").html("");
				submitBtn.attr("disabled", "disabled");
				ajax({
					url: isLocal ? "data/buildType.json" : "queryAllBuildType.do",
					dataType: "json", 
					loading: ".type-list",
					success: function(obj) {
						var che;
						if (isLocal) {
							setTimeout(function() {
								if (obj.success) {
									if (obj.data && obj.data.length) {
										for (var i = 0; i < obj.data.length; i++) {
											che = buildTypeTpl.clone();
											if (obj.data[i].buildType == "Normal") {
												che.find("input").attr({
													"data-type": "disabled",
													"onclick": "return false;",
													"checked": "checked"
												});
											}
											che.find("input").attr("id", "type" + i).val(obj.data[i].buildType).end()
												.find("label").attr({
													"for": "type" + i,
													"title": obj.data[i].buildType + "|" + obj.data[i].buildTypeDesc
												}).html(obj.data[i].buildType + " | " + obj.data[i].buildTypeDesc).end().appendTo($(".type-list"));
										}
										submitBtn.removeAttr("disabled");
										selectAll(".select-all", ".type-list");
										unselectAll(".unselect-all", ".type-list");
										inverseAll(".inverse-select", ".type-list");
									} else {
										submitBtn.attr("disabled", "disabled");
									}
								} else {
									submitBtn.attr("disabled", "disabled");
									alert(obj.errorMessage);
								}
							}, 0);
						} else {
							if (obj.success) {
								if (obj.data && obj.data.length) {
									for (var i = 0; i < obj.data.length; i++) {
										che = buildTypeTpl.clone();
										if (obj.data[i].buildType == "Normal") {
											che.find("input").attr({
												"data-type": "disabled",
												"onclick": "return false;",
												"checked": "checked"
											});
										}
										che.find("input").attr("id", "type" + i).val(obj.data[i].buildType).end()
											.find("label").attr({
												"for": "type" + i,
												"title": obj.data[i].buildType + "|" + obj.data[i].buildTypeDesc
											}).html(obj.data[i].buildType + " | " + obj.data[i].buildTypeDesc).end().appendTo($(".type-list"));
									}
									submitBtn.removeAttr("disabled");
									selectAll(".select-all", ".type-list");
									unselectAll(".unselect-all", ".type-list");
									inverseAll(".inverse-select", ".type-list");
								} else {
									submitBtn.attr("disabled", "disabled");
								}
							} else {
								submitBtn.attr("disabled", "disabled");
								alert(obj.errorMessage);
							}
						}
					}
				});
				$("[data-control=module]").addClass("hidden");
				$("[data-control=branch]").removeClass("hidden");
			}
		}
	}).change();
});