package bean;

public class search {
	private String name;//文章作者
	private String content;//文章内容
	private String title;//文章作者
	public String getName() {
		if(name==null)
		{
			name="";
		}else
		{
			name="%"+name+"%";
		}
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		if(content==null)
		{
			content="";
		}else
		{
			content="%"+content+"%";
		}
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		if(title==null)
		{
			title="";
		}else
		{
			title="%"+title+"%";
		}
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public search(String name, String content, String title) {
		super();
		this.name = name;
		this.content = content;
		this.title = title;
	}
	public search() {
		super();
	}
	
	
}
