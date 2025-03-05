package com.adi.controller;

import java.io.File;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.adi.dao.CommentDao;
import com.adi.dao.LikeDao;
import com.adi.dao.PostDao;
import com.adi.dao.UserInfoDao;
import com.adi.daoimpl.UserInfoDaoImpl;
import com.adi.pojo.Category;
import com.adi.pojo.Comment;
import com.adi.pojo.Message;
import com.adi.pojo.Post;
import com.adi.pojo.UserInfo;

@Controller
public class PostController {
	
	@Autowired
	private PostDao daoimpl;
	
	@Autowired
	private LikeDao likeDaoimpl;
	
	@Autowired
	private CommentDao commentDaoimpl;
	
	@Autowired
	private UserInfoDao userDaoimpl;
	
	@PostMapping("/addpost")
	@ResponseBody
	public String registerUser(@RequestParam("category")String cid, @RequestParam("pTitle")String title, @RequestParam("pContent")String content, @RequestParam("pCode")String code, @RequestParam("pic")MultipartFile file, HttpServletRequest request) {
		
		String imageName = file.getOriginalFilename();
		
		HttpSession s = request.getSession();
		UserInfo user = (UserInfo) s.getAttribute("currentUser");
		
		if(imageName == "") {
			imageName = "default_blog_post.png";
		}
		
		LocalDateTime dateTime = LocalDateTime.now();
		int catId = Integer.parseInt(cid);
		Category c = daoimpl.getCategoryUsingId(catId);
		
		Post p = new Post(title, content, code, imageName, dateTime, user, c);
		
		try {
			if(imageName != "default_blog_post.png") {
				String destPath = "D:/Hibernate/UniversalBlogProject/src/main/webapp/resources/images/blog_pics/";
				File serverFile = new File(destPath, imageName);
				file.transferTo(serverFile);
			}
			
			if(daoimpl.savePost(p)) {
				return "done";
			}
			else {
				return "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		
	}
	
	@PostMapping("/addcomment")
	public String addComment(@RequestParam("cContent")String cContent, @RequestParam("postId")String postId, HttpServletRequest request, Model m) {
		
		int pid = Integer.parseInt(postId);
		Post p = daoimpl.getPostById(pid);
		HttpSession s = request.getSession();
		UserInfo user = (UserInfo) s.getAttribute("currentUser");
		
		Comment c = new Comment(cContent, user, p);
		
		if(commentDaoimpl.insertComment(c)) {
			int likeCount = likeDaoimpl.countLikeOnPost(p);
			m.addAttribute("likeCount", likeCount);
			m.addAttribute("post", p);
			
			
			return "redirect:/blogpage?pid="+postId;
		}
		
		return "redirect:/profile";
		
		
	}
	
	@RequestMapping("/loadposts")
	public String loadPost(@RequestParam("cid")String catId, Model m) {
		
		List<Post> lst = new ArrayList<Post>();
		int cid = Integer.parseInt(catId);
		if(cid == 0) {
			lst = daoimpl.getAllPosts();
			
		}
		else {
			lst = daoimpl.getPostsByCategoryId(cid);
		}
		
		
		for(Post post : lst) {
			int likeCount = likeDaoimpl.countLikeOnPost(post);
			List<Comment> comments = commentDaoimpl.getCommentsUsingPost(post);
			m.addAttribute("commentCount_"+post.getPid(), comments.size());
			m.addAttribute("likeCount_" + post.getPid(), likeCount);
		}
		
		m.addAttribute("posts", lst);
		
		return "load_posts";
	}
	
	@RequestMapping("/loadpages")
	public String loadPage(@RequestParam("cid")String catId, Model m, HttpServletRequest request) {
		int cid = Integer.parseInt(catId);
		if(cid == 0) {
			return "show_user_details";
		}
		else if(cid == 1) {
			return "edit_user_details";
		}
		else if(cid == 2 || cid == 3) {
			HttpSession session = request.getSession();
			UserInfo u = (UserInfo) session.getAttribute("currentUser");
			List<Post> lst = new ArrayList<Post>();
			if(cid == 2) {
				lst = daoimpl.getPostByUser(u);
			} else if(cid == 3) {
				lst = daoimpl.getAllPosts();
			}
			for(Post post : lst) {
				int likeCount = likeDaoimpl.countLikeOnPost(post);
				List<Comment> comments = commentDaoimpl.getCommentsUsingPost(post);
				m.addAttribute("commentCount_"+post.getPid(), comments.size());
				m.addAttribute("likeCount_" + post.getPid(), likeCount);
			}
			
			m.addAttribute("posts", lst);
			
			return "load_posts";
		}
		else if(cid == 4) {
			List<UserInfo> lst = userDaoimpl.getAllUsers();
			m.addAttribute("users", lst);
			return "show_all_users";
		}
		else if(cid == 5) {
			return "show_category";
		}
		return "profile";
	}
	
	@RequestMapping("/blockuser")
	public String blockUser(@RequestParam("userId")String userId, HttpServletRequest request) {
		
		int uid = Integer.parseInt(userId);
		UserInfo user = userDaoimpl.getUser(uid);
		user.setBlocked(true);
		HttpSession session = request.getSession();
		Message msg = null;
		if(userDaoimpl.updateUser(user)) {
			msg = new Message("User Blocked", "success", "alert-success");
		}
		else {
			msg = new Message("something went wrong", "error", "alert-danger");
		}
		
		session.setAttribute("msg", msg);
		return "redirect:/admindashboard";
	}
	@RequestMapping("/unblockuser")
	public String unBlockUser(@RequestParam("userId")String userId, HttpServletRequest request) {
		
		int uid = Integer.parseInt(userId);
		UserInfo user = userDaoimpl.getUser(uid);
		user.setBlocked(false);
		HttpSession session = request.getSession();
		Message msg = null;
		if(userDaoimpl.updateUser(user)) {
			msg = new Message("User unBlocked", "success", "alert-success");
		}
		else {
			msg = new Message("something went wrong", "error", "alert-danger");
		}
		
		session.setAttribute("msg", msg);
		return "redirect:/admindashboard";
	}
	
	
	
	@RequestMapping("/admindashboard")
	public String adminDashboard() {
		return "admin_dashboard";
	}
	
	
	@RequestMapping("/loadcomments")
	public String loadComments(@RequestParam("pid")String postId, Model m) {
		
		List<Comment> lst = new ArrayList<Comment>();
		int pid = Integer.parseInt(postId);
		
		Post p = daoimpl.getPostById(pid);
		System.out.println("Post = " + p);
		lst = commentDaoimpl.getCommentsUsingPost(p);
		System.out.println("Comments List = " + lst);
		m.addAttribute("comments", lst);
		
		return "load_comments";
	}
	
	@RequestMapping("/blogpage")
	public String loadBlogPage(@RequestParam("pid")String pid, Model m) {
		
		
		int postId = Integer.parseInt(pid);
		
		Post p = daoimpl.getPostById(postId);
		
		int likeCount = likeDaoimpl.countLikeOnPost(p);
		m.addAttribute("likeCount", likeCount);
		m.addAttribute("post", p);
		
		return "show_blog_page";		
	}
	
	@RequestMapping("/deletecomment")
	public String deleteComment(@RequestParam("comid")String cid, Model m) {
		int comId = Integer.parseInt(cid);
		Comment comment = commentDaoimpl.getCommentUsingId(comId);
		Post p = comment.getPost();
		
		if(commentDaoimpl.deleteComment(comment)) {
			int likeCount = likeDaoimpl.countLikeOnPost(p);
			m.addAttribute("likeCount", likeCount);
			m.addAttribute("post", p);
			
			
			return "redirect:/blogpage?pid="+p.getPid();
		}
		else {
			return "redirect:/profile";
		}
		
	}
	
	@GetMapping("/editpost")
	public String editPage(@RequestParam("pid")String postId, Model m) {
		int pid = Integer.parseInt(postId);
		Post p = daoimpl.getPostById(pid);
		m.addAttribute("post", p);
		return "edit_post";
		
	}
	
	@PostMapping("/editpost")
	public String editPost(@RequestParam("postId")String postId, @RequestParam("pTitle")String pTitle, @RequestParam("pContent")String pContent, @RequestParam("pCode")String pCode ,Model m) {
		int pid = Integer.parseInt(postId);
		Post p = daoimpl.getPostById(pid);
		p.setpTitle(pTitle);
		p.setpContent(pContent);
		p.setpCode(pCode);
		p.setpDate(LocalDateTime.now());
		
		if(daoimpl.updatePost(p)) {
			int likeCount = likeDaoimpl.countLikeOnPost(p);
			m.addAttribute("likeCount", likeCount);
			m.addAttribute("post", p);
			
			
			return "redirect:/blogpage?pid="+p.getPid();
		}
		else {
			return "redirect:/profile";
		}
	}
	
	@GetMapping("/deletepost")
	public String deletePost(@RequestParam("pid")String postId, HttpServletRequest request) {
		int pid = Integer.parseInt(postId);
		Post p = daoimpl.getPostById(pid);
		Message msg = null;
		if(daoimpl.deletePost(p)) {
			msg = new Message("Post deleted.", "success", "alert-success");
		} else {
			msg = new Message("Something went wrong, post did not get deleted.", "error", "alert-danger");
		}
		HttpSession session = request.getSession();
		session.setAttribute("msg", msg);
		UserInfo u = (UserInfo) session.getAttribute("currentUser");
		if(u.getRole().equals("admin")) {
			return "redirect:/admindashboard";
		}
		
		return "redirect:/profile";
	}
	
	@GetMapping("/deletecategory")
	public String deleteCategory(@RequestParam("catId")String catId, HttpServletRequest request) {
		int cid = Integer.parseInt(catId);
		Message msg = null;
		HttpSession session = request.getSession();
		if(daoimpl.deleteCategoryUsingId(cid)) {
			msg = new Message("Category Deleted", "success", "alert-success");
			List<Category> lst = daoimpl.getAllCategories();
			session.setAttribute("categoryList", lst);
		}
		else {
			msg = new Message("Something went wrong, category did not get deleted.", "error", "alert-danger");
		}
		session.setAttribute("msg", msg);
		return "redirect:/admindashboard";
	}
	
	@PostMapping("/addcategory")
	public String addCategory(@RequestParam("catName") String catName, @RequestParam("catDescription") String catDescription, HttpServletRequest request) {
		
		Category cat = new Category();
		cat.setName(catName);
		cat.setDescription(catDescription);
		
		Message msg = null;
		HttpSession session = request.getSession();
		if(daoimpl.saveCategory(cat)) {
			msg = new Message("Category added", "success", "alert-success");
			List<Category> lst = daoimpl.getAllCategories();
			session.setAttribute("categoryList", lst);
		}
		else {
			msg = new Message("Something went wrong, category did not get added.", "error", "alert-danger");
		}
		session.setAttribute("msg", msg);
		return "redirect:/admindashboard";
	}
	
}
