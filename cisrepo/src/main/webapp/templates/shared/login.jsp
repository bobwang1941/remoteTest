<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../shared/link.jsp"></jsp:include>
	<jsp:include page="../shared/script.jsp"></jsp:include>
	<style>
		.ci_login_box {
			display: table;
			font-size: 1rem;
			position: absolute;
			left: 50%;
			top: 38%;
			width: 300px;
			padding: 25px 25px 0;
			background: linear-gradient(#5187c4, #48596d, #5187c4);
			color: #f2f2f2;
			border-radius: 5px;
			margin-left: 275px;
			margin-top: -110px;
			box-shadow: 0 0 15px rgba(0, 0, 0, .1);
		}
		.has-success .form-control {
			border: none;
		}
		.ci_login_fill {
			position: relative;
			padding-top: 30px;
		}
		
		.ci_login_fill>input, .verified_name>input {
			width: 225px;
			height: 28px;
			line-height: 28px;
			padding: 5px 10px 5px 10px;
			font-size: 14px;
			border: 1px solid #EDEDED;
			border-radius: 3px;
			box-sizing: content-box;
		}
		
		.ci_login_fill>input.u_pwd {
			margin-top: 15px;
		}
		
		.ci_login_head a.float-lg-right {
			color: rgba(3, 23, 11, 0.7);
			font-size: 13px;
		}
		
		.ci_login_box button {
			color: #ffffff;
			background: #999;
			border: none;
			outline: none;
			margin-top: 25px;
			margin-bottom: 25px;
		}
		
		.ci_login_box button:disabled {
			background: #5a5252;
		}
		
		.ci_login_box button:hover {
			background: #c2c2c2;
		}
		
		.ci_login_box button:disabled:hover {
			background: #5a5252;
		}
	</style>
</head>
<body class="layout layout-header-fixed bg-faded">
	<div class="col-lg-4 offset-lg-4 bg-info" style="margin-top: 100px;">
		<h3 class="text-lg-center mt-2">持续交付平台</h3>
		<div class="ci_login_head mx-1 mt-2">
			<span>用户登录</span>
			<span class="quick_reg"><a class="float-lg-right" href="#">游客登录</a></span>
		</div>
		<form id="loginForm" class="mx-1 form-horizontal" action="../dashboard/dashboard.jsp">
			<div class="ci_login_fill">
				<div class="form-group">
					<input class="u_name form-control" placeholder="域账号" type="text" name="username" spellcheck="false" autocomplete="off" required>
				</div>
				<div class="form-group">
					<input autocomplete="off" class="u_pwd form-control" placeholder="请输入密码" type="password"  name="password" required>
				</div>
			</div>
			<button class="btn btn-primary btn-block mb-2" type="submit">登陆</button>
		</form>
	</div>
	<script>
		$(function() {
			$('#loginForm').bootstrapValidator({
				fields: {
					username: {
						validators: {
							notEmpty: {
								message: '* 域账号不能为空'
							}/* ,
							remote: {
								url: 'isExsit.do',
								message: '域账号不存在！'
							} */
						}
					},
					password: {
						validators: {
							notEmpty: {
								message: '* 密码不能为空'
							}
						}
					}
				}
			});
		});
	</script>
</body>
</html>
