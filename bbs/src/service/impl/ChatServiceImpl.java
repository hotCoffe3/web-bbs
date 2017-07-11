package service.impl;

import java.util.List;

import dao.impl.ChatDaoImpl;
import bean.Chat;
import service.ChatService;

public class ChatServiceImpl implements ChatService {

	@Override
	public boolean sendMessage(Chat chat) {
		return new ChatDaoImpl().sendMessage(chat);
	}

	@Override
	public List<Chat> getMessage(int loginId, int usersId) {
		return new ChatDaoImpl().getMessage(loginId, usersId);
	}

}
