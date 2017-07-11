package service.impl;

import java.util.ArrayList;
import java.util.List;

import bean.Login;
import dao.impl.LoginDaoImpl;

public class ServiceforAccount
{
	public List<String> findAllNickName()
	{
		List<String> list=new ArrayList<String>();
		List<Login> login=new ArrayList<Login>();
		login=new LoginDaoImpl().findAllAccount();
		for(Login l:login)
		{	
			list.add(l.getNickName());
		}
		return list;
	}
}
