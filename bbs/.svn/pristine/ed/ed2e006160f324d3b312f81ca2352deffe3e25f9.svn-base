package service;

import java.util.List;

import bean.Login;
import bean.Register;
import bean.Users;

public interface UsersService {
	public Users getUsersById(int id);
	public List<Users> findAll();
	public boolean checkphone(String str);
	public int getUsersByPhone(String phone);
	public Register getRegisterBy(Login login);
	
	public Users getUsers(Register register);//通过传入register获得users对象
	
	public boolean fixUsersMessage(int usersid, String address );//用于修改个人信息,目前只支持修改地址和密码
	public boolean fixUsersPassword( int usersid,String password);//用于修改个人信息,目前只支持修改地址和密码
}
