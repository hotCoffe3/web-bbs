package service.impl;

import java.util.List;

import dao.impl.LoginDaoImpl;
import bean.Login;
import bean.UsersType;
import service.LoginService;

public class LoginServiceImpl implements LoginService {

	public List<Login> login(String nickname) {
		
		return new LoginDaoImpl().login(nickname);
	}

	public UsersType findtypeBytypeid(int typeid) {
		return new LoginDaoImpl().findtypeBytypeid(typeid);
	}

	public List<UsersType> findAll() {
		return new LoginDaoImpl().findAll();
	}

	public List<Login> findAllAccount() {
		return new LoginDaoImpl().findAllAccount();
	}

	public Login findNickNameByUsersId(int usersId) {
		
		return new LoginDaoImpl().findNickNameByUsersId(usersId);
	}

}
