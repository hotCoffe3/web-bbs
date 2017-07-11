package dao;

import java.util.List;

import bean.Chat;
import bean.Post;

public interface NewsDao {
	
	
	public int isOld(int postId);//传入postid得到数据库的存储条数。查post表
	
	public int isNew(int postId);//传入postid得到数据库的评论条数查discuss表
	
	public boolean isNews(int old,int news);//对比得到是否有新消息
	
	public Post doNews(int postId);//处理有点击新消息
	
	
	public int isNewChatRecord(int loginId);
	public List<Chat> getChatMes(int loginId);
	public boolean doNewChat(int loginId,int usersId);
}
