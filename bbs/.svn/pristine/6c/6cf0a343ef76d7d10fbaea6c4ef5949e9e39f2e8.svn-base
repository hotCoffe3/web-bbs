package service;

import java.util.List;

import bean.Chat;
import bean.Post;

public interface NewsService {

	public int isOld(int postId);
	public int isNew(int postId);
	public boolean isNews(int old,int news);
	public Post doNews(int postId);
	
	public int isNewChatRecord(int loginId);
	public List<Chat> getChatMes(int loginId);
	public boolean doNewChat(int loginId,int usersId);
}
