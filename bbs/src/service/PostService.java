package service;

import java.util.List;

import bean.Post;

public interface PostService {
	public Post getPostByid(int id);//通过postid得到post对象
	public List<Post> getPostByUsersId(int usersId);//通过usersId获取post对象的集合
	public List<Post> getPostByTypeId(int typeId,int num);//通过typeID拿到post对象的集合，num为第几页

	public boolean doPost(Post post);
}
