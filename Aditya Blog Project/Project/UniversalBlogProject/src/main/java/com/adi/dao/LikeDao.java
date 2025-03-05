package com.adi.dao;

import com.adi.pojo.Like;
import com.adi.pojo.Post;
import com.adi.pojo.UserInfo;

public interface LikeDao {
	
	boolean insertLike(Like like);
	int countLikeOnPost(Post p);
	boolean isLikedByUser(Post p, UserInfo u);
	boolean deleteLike(Post p, UserInfo u);
}
