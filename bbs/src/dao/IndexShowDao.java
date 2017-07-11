package dao;

import java.util.List;

import bean.Post;


public interface IndexShowDao {
	public List<Post> getIndexShow(int num);//num为获取的条数，此方法为获取评论数最多的方法
	public List<Post> getIndexNew(int num);//num为获取的条数，此方法为获取最新贴的方法
	
}
