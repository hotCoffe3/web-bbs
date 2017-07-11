package service.impl;

import java.util.List;

import bean.Discuss;
import dao.impl.DiscussDaoImpl;
import service.DiscussService;

public class DiscussServiceImpl implements DiscussService {

	@Override
	public int getNumByPostId(int postId) {
		return new DiscussDaoImpl().getNumByPostId(postId);
	}

	@Override
	public List<Discuss> getPostByTypeId(int postId, int num) {
		return new DiscussDaoImpl().getPostByTypeId(postId, num);
	}

}
