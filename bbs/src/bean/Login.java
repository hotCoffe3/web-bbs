package bean;

public class Login {
	private int id;
	private String nickName;
	private UsersType typeid;
	private String password;
	private int usersId;
	
	public int getUsersId() {
		return usersId;
	}
	public void setUsersId(int usersId) {
		this.usersId = usersId;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getNickName()
	{
		if(this.nickName==null){
			this.nickName="佚名";
		}
		return nickName;
	}
	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}
	public UsersType getTypeid()
	{
		return typeid;
	}
	public void setTypeid(UsersType typeid)
	{
		this.typeid = typeid;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public Login(int id, String nickName, UsersType typeid, String password,int usersId)
	{
		super();
		this.id = id;
		this.nickName = nickName;
		this.typeid = typeid;
		this.password = password;
		this.usersId=usersId;
	}
	public Login()
	{
		super();
	}
	
	
}
