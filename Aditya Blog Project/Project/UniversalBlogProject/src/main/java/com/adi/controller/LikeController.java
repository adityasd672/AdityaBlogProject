package com.adi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adi.dao.LikeDao;
import com.adi.dao.PostDao;
import com.adi.dao.UserInfoDao;
import com.adi.pojo.Like;
import com.adi.pojo.Post;
import com.adi.pojo.UserInfo;

@Controller
public class LikeController {

	@Autowired
	private LikeDao daoimpl;
	
	@Autowired
	private UserInfoDao userDaoimpl;
	
	@Autowired
	private PostDao postDaoimpl;
	
	
	@RequestMapping("/likeoperation")
	@ResponseBody
	public String likeOperation(@RequestParam("pid")String pid, @RequestParam("uid")String uid, @RequestParam("operation")String operation) {
		int userId = Integer.parseInt(uid);
		int postId = Integer.parseInt(pid);
		
		UserInfo u = userDaoimpl.getUser(userId);
		Post p = postDaoimpl.getPostById(postId);
		Like like = new Like(u, p);
		System.out.println(like);
		if(operation.equals("like") && !daoimpl.isLikedByUser(p, u)) {
			if(daoimpl.insertLike(like)) {
				return "true";
			}else {
				return "error";
			}
		} else {
			if(daoimpl.deleteLike(p, u)) {
				return "deletedLike";
			}
			else {
				return "error";
			}
		}
	}
	
}
