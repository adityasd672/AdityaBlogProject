package com.adi.pojo;

import javax.persistence.Column;
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
@Table(name = "comments")
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int comId;
	
	@Column(length=200)
	private String cContent;
	
	@ManyToOne
	@JoinColumn(name = "uid", nullable = false, foreignKey = @ForeignKey(name = "FK_USER_COMMENT", value = ConstraintMode.CONSTRAINT))
	private UserInfo user;
	
	@ManyToOne
	@JoinColumn(name = "pid", nullable = false, foreignKey = @ForeignKey(name = "FK_POST_COMMENT", value = ConstraintMode.CONSTRAINT))
	private Post post;

	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(int comId, String cContent, UserInfo user, Post post) {
		super();
		this.comId = comId;
		this.cContent = cContent;
		this.user = user;
		this.post = post;
	}

	public Comment(String cContent, UserInfo user, Post post) {
		super();
		this.cContent = cContent;
		this.user = user;
		this.post = post;
	}

	public int getComId() {
		return comId;
	}

	public void setComId(int comId) {
		this.comId = comId;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
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
		return "Comment [comId=" + comId + ", cContent=" + cContent + ", user=" + user + ", post=" + post + "]";
	}
	
}
