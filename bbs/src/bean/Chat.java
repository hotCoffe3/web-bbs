package bean;

public class Chat {

	private int id;
	private int usersId;
	private int loginId;
	private String time;
	private String content;
	private int record;
	public Chat() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUsersId() {
		return usersId;
	}
	public void setUsersId(int usersId) {
		this.usersId = usersId;
	}
	public int getLoginId() {
		return loginId;
	}
	public void setLoginId(int loginId) {
		this.loginId = loginId;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRecord() {
		return record;
	}
	public void setRecord(int record) {
		this.record = record;
	}
	public Chat(int id, int usersId, int loginId, String time, String content,
			int record) {
		super();
		this.id = id;
		this.usersId = usersId;
		this.loginId = loginId;
		this.time = time;
		this.content = content;
		this.record = record;
	}
	
}
