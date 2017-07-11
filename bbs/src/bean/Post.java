package bean;

public class Post {
	private int id;
	private String content;
	private ContentType typeId;
	private String title;
	private String date;
	private Users usersId;
	private int count;//用于存储评论条数，但此属性不存在数据库
	
	
	public Post(int id, String content, ContentType typeId, String title,
			String date, Users usersId,int count) {
		super();
		this.id = id;
		this.content = content;
		this.typeId = typeId;
		this.title = title;
		this.date = date;
		this.usersId = usersId;
		this.count=count;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public ContentType getTypeId() {
		return typeId;
	}


	public void setTypeId(ContentType typeId) {
		this.typeId = typeId;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public Users getUsersId() {
		return usersId;
	}


	public void setUsersId(Users usersId) {
		this.usersId = usersId;
	}


	public Post() {
		super();
	}
	
}
