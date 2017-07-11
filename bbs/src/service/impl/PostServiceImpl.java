package service.impl;

import java.util.List;

import dao.impl.PostDaoImpl;
import bean.Post;
import service.PostService;

public class PostServiceImpl implements PostService {

	public Post getPostByid(int id) {
		return new PostDaoImpl().getPostByid(id);
	}
	public List<Post> getPostByUsersId(int usersId) {
		return new PostDaoImpl().getPostByUsersId(usersId);
	}
	@Override
	public List<Post> getPostByTypeId(int typeId, int num) {
		return new PostDaoImpl().getPostByTypeId(typeId, num);
	}
	@Override
	public boolean doPost(Post post) {
		return new PostDaoImpl().doPost(post);
	}
	
}
