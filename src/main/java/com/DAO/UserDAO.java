package com.DAO;

import com.entity.User;

public interface UserDAO {
	
	public boolean userRegister(User user);
	
	public User login(String email, String password);
	public boolean checkExistingEmail(String email);
	public boolean checkExistingLoginName(String loginName);
	public boolean checkExistingPhone(String phone);


}
