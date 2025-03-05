package com.adi.dao;

import java.util.List;

import com.adi.pojo.Category;
import com.adi.pojo.Post;
import com.adi.pojo.UserInfo;

public interface PostDao {

	List<Category> getAllCategories();
	boolean savePost(Post p);
	Category getCategoryUsingId(int cid);
	List<Post> getAllPosts();
	List<Post> getPostsByCategoryId(int cid);
	Post getPostById(int pId);
	boolean updatePost(Post p);
	boolean deletePost(Post p);
	List<Post> getPostByUser(UserInfo u);
	boolean deleteCategoryUsingId(int cid);
	boolean saveCategory(Category cat);
}
