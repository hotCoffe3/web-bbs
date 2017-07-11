package service.impl;

import java.util.List;

import dao.impl.UsersDaoImpl;
import bean.Login;
import bean.Register;
import bean.Users;
import service.UsersService;

public class UsersServiceImpl implements UsersService {

	public Users getUsersById(int id) {
		return new UsersDaoImpl().getUsersById(id);
	}

	public List<Users> findAll() {
		return new UsersDaoImpl().findAll();
	}

	@Override
	public boolean checkphone(String str)
	{
		boolean isFlag=false;
		String phone=new UsersDaoImpl().checkPhoneexist(str);
		if(phone.isEmpty())
		{
			isFlag=true;
		}
		else
		{
			isFlag=false;
		}
		return isFlag;
	}
//	public static void main(String[] args)
//	{
//		if(new UsersServiceImpl().checkphone("12345678910"))
//		{
//			System.out.println("可以注册");
//		}
//		else
//		{
//			System.out.println("不可注册");
//		}
//	}

	@Override
	public int getUsersByPhone(String phone)
	{
		// TODO Auto-generated method stub
		return new UsersDaoImpl().getUsersByPhone(phone).getId();
	}

	@Override
	public Register getRegisterBy(Login login)
	{
		Users users=new UsersDaoImpl().getUsersById(login.getUsersId());
		Register register=new Register("undefine", login.getNickName(), login.getPassword(), users.getName(), users.getPhone(), users.getAddress(), users.getSchool(), users.getMajor(), users.getSex(), "undefine",users.getAge()+"");
		return register;
	}

	@Override
	public Users getUsers(Register register) {
		return new UsersDaoImpl().getUsers(register);
	}

	@Override
	public boolean fixUsersMessage(int usersid, String address) {
		return new UsersDaoImpl().fixUsersMessage(usersid, address);
	}

	@Override
	public boolean fixUsersPassword(int usersid, String password) {
		return new UsersDaoImpl().fixUsersPassword(usersid, password);
	}

}
