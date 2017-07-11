package service.impl;

import dao.impl.RegisterDaoImpl;
import bean.Login;
import bean.Users;
import service.RegisterService;

public class RegisterServiceImpl implements RegisterService {

	public boolean doNewUser(Users user) {
		return new RegisterDaoImpl().doNewUser(user);
	}

	public boolean doNewLogin(Login login) {
		return new RegisterDaoImpl().doNewLogin(login);
	}

}
