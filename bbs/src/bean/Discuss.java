package bean;

public class Discuss {
	private int id;
	private Post postId;
	private String content;
	private String time;
	private Users userid;
	
	public Users getUserid() {
		return userid;
	}
	public void setUserid(Users userid) {
		this.userid = userid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Post getPostId() {
		return postId;
	}
	public void setPostId(Post postId) {
		this.postId = postId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Discuss() {
		super();
	}
	public Discuss(int id, Post postId, String content, String time,
			Users userid) {
		super();
		this.id = id;
		this.postId = postId;
		this.content = content;
		this.time = time;
		this.userid = userid;
	}
	
}
