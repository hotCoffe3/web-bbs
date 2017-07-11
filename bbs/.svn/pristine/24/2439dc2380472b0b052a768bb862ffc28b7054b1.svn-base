package dao;

import java.util.List;

import bean.Login;
import bean.Users;
import bean.UsersType;

public interface LoginDao
{
	public List<Login> login(String nickname);
	public List<Login> findNickName(String nickName);//和上个方法区别是这个方法区分nickname大小写
	public UsersType findtypeBytypeid(int typeid);
	public List<UsersType> findAll();
	public List<Login> findAllAccount();
	public Login findNickNameByUsersId(int usersId);
	public Login keeploginmessage(String nickname);
	
	public Login findLoginByUserId(int userid);
	
	public boolean updateUsertype(int typeid,Users user);
}
