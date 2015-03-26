package com.dixin.finance.authentication.vo;

public class UserInfo {
	public int id; 			// 内部唯一ID
	public String userName; // 用户名
	public int userType; 	// 是客户还是后台管理用户
	public int enabled; 	// 是否有效
	public String name; 	// 姓名
	public String mobile; 	// 手机号
	public int authType;	// 认证类别

	public UserInfo(UserVO user){
		id = user.getId();
		userName = user.getUserName();
		userType = user.getUserType();
		enabled = user.getEnabled();
		name = user.getName();
		mobile = user.getMobile();
		authType = user.getAuthType();
	}
}
