package dao;

import java.util.List;

import bean.Discuss;
import bean.Post;

public interface DiscussDao {
	public List<Discuss> getDiscussByPostId(Post post);//根据贴得到该贴的回复
	public boolean doDiscuss(Discuss discuss);		//添加贴回复
	public boolean deleteDiscuss(int id);			//删除贴回复
	
	public int getNumByPostId(int postId);//通过postid拿到评论数；
	
	public List<Discuss> getPostByTypeId(int postId,int num);//通过typeID拿到post对象的集合，num为第几页

	public void deletepost(int postId);
}
