package bean;

public class Users {
	private int id;
	private String name;
	private String address;
	private String sex;
	private String phone;
	private int age;
	private String school;
	private String major;
	private UsersType typeId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public UsersType getTypeId() {
		return typeId;
	}
	public void setTypeId(UsersType typeId) {
		this.typeId = typeId;
	}
	public Users(int id, String name, String address, String sex, String phone,
			int age, String school, String major, UsersType typeId) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.sex = sex;
		this.phone = phone;
		this.age = age;
		this.school = school;
		this.major = major;
		this.typeId = typeId;
	}
	public Users() {
		super();
	}
	
}
