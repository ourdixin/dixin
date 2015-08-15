$(document).ready(
		function() {

			function success(data) {
				if(data.result) {
					alert("修改成功!");
				} else {
					alert(data.msg);
				}
			}
			;

			$('.bnt_ok').click(
					function() {
						var phone = $("input[name='mobile']").val();
						var regex = /^1[3,4,5,7,8]\d{9}$/;
						if (!regex.exec(phone)) {
							alert("手机号输入不正确");
							return;
						}

						var password = $("input[name='password']").val();
						var regex = /^(\w){6,20}$/;
						if (!regex.exec(password)) {
							alert("密码输入不合法");
							return;
						}

						var rpassword = $("input[name='rpassword']").val();
						if (password != rpassword) {
							alert("两次密码输入不一致");
							return;
						}

						$.post(HOST_PATH + "/authentication/forgetpassword", $(
								"#forgetpasswordForm").serialize(), success);
					});

			function smssuccess(data) {
				if (data.success) {
					alert("短信发送成功，请注意查收！")
				} else {
					alert(data.msg)
				}
			}
			;

			function randcodesuccess(data) {
				if (data.success) {
					// $("#getVerifyCode").removeClass("dis_getcode");
				} else {
					// $("#getVerifyCode").addClass("dis_getcode");
					alert(data.msg)
				}

			}
			;

			// 生成图形验证码
			$('#randCodeImg').click(
					function() {
						var mydate = new Date();
						$("#randCodeImg").attr(
								"src",
								HOST_PATH + "/authentication/getPic?time="
										+ mydate.toLocaleString());
					});

			// 检查图形验证码
			$('#randCode').blur(
					function() {
						$.post(HOST_PATH + "/authentication/randcode", $(
								"#forgetpasswordForm").serialize(),
								randcodesuccess);
					});

			// 发送验证码
			$('#getVerifyCode')
					.click(
							function() {
								var phone = $("input[name='mobile']").val();
								var regex = /^1[3,4,5,7,8]\d{9}$/;
								if (!regex.exec(phone)) {
									alert("手机号输入不正确");
									return;
								}

								$.post(HOST_PATH + "/authentication/sendsms",
										$("#forgetpasswordForm").serialize(),
										smssuccess);
							});
		});