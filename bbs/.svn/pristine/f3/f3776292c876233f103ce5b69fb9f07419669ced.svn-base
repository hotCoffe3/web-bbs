package service.impl;

import java.util.List;

import dao.impl.SearchDaoImpl;
import bean.Post;
import service.SearchService;

public class SearchServiceImpl implements SearchService {
	public List<Post> findPostByContent(String content) {
		return new SearchDaoImpl().findPostByContent(content);
	}

	public List<Post> findPostByTitle(String title) {
		
		return new SearchDaoImpl().findPostByTitle(title);
	}

	public List<Post> findPostByNickName(String nickName) {
		return new SearchDaoImpl().findPostByNickName(nickName);
	}

}
