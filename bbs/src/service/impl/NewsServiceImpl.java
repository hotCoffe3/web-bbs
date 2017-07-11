package service.impl;

import java.util.List;

import dao.impl.ChatDaoImpl;
import dao.impl.NewsDaoImpl;
import bean.Chat;
import bean.Post;
import service.NewsService;

public class NewsServiceImpl implements NewsService {

	@Override
	public int isOld(int postId) {
		return new NewsDaoImpl().isOld(postId);
	}

	@Override
	public int isNew(int postId) {
		return new NewsDaoImpl().isNew(postId);
	}

	@Override
	public boolean isNews(int old, int news) {
		return new NewsDaoImpl().isNews(old, news);
	}

	@Override
	public Post doNews(int postId) {
		return new NewsDaoImpl().doNews(postId);
	}

	@Override
	public int isNewChatRecord(int loginId) {
		return new NewsDaoImpl().isNewChatRecord(loginId);
	}

	@Override
	public List<Chat> getChatMes(int loginId) {
		return new NewsDaoImpl().getChatMes(loginId);
	}

	@Override
	public boolean doNewChat(int loginId, int usersId) {
		return new NewsDaoImpl().doNewChat(loginId, usersId);
	}

	

}
