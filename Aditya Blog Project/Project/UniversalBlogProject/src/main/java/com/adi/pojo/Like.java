package com.adi.pojo;

import javax.persistence.ConstraintMode;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "likes")
public class Like {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int lid;
	
	@ManyToOne
	@JoinColumn(name = "uid", nullable = false, foreignKey = @ForeignKey(name = "FK_USER_LIKE", value = ConstraintMode.CONSTRAINT))
	private UserInfo user;
	
	@ManyToOne
	@JoinColumn(name = "pid", nullable = false, foreignKey = @ForeignKey(name = "FK_POST_LIKE", value = ConstraintMode.CONSTRAINT))
	private Post post;

	public Like(UserInfo user, Post post) {
		super();
		this.user = user;
		this.post = post;
	}

	public Like(int lid, UserInfo user, Post post) {
		super();
		this.lid = lid;
		this.user = user;
		this.post = post;
	}

	public Like() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	@Override
	public String toString() {
		return "Like [lid=" + lid + ", user=" + user + ", post=" + post + "]";
	}
	
	
}
