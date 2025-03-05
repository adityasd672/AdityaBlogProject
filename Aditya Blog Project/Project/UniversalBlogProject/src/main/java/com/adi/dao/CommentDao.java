package com.adi.dao;

import java.util.List;

import com.adi.pojo.Comment;
import com.adi.pojo.Post;
import com.adi.pojo.UserInfo;

public interface CommentDao {

	boolean insertComment(Comment c);
	List<Comment> getCommentsUsingPost(Post p);
	List<Comment> getCommentsUsingUser(UserInfo u);
	boolean deleteComment(Comment c);
	Comment getCommentUsingId(int comId);
}
