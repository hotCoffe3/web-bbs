package service;

import bean.Login;
import bean.Users;

public interface RegisterService {
	public boolean doNewUser(Users user);
	public boolean doNewLogin(Login login);
}
