package com.adi.pojo;


import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="user")
public class UserInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column(nullable = false)
	private String name;
	@Column(name="email",unique = true)
	private String email;
	@Column(nullable = false)
	private String password;
	@Column(nullable = false)
	private String gender;
	private String about;
	@Column(nullable = false)
	private LocalDateTime dateTime;
	private String profile;
	@Column(nullable = false)
	private String role;
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Post> posts;
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Like> likes;
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Comment> comments;
	@Column(nullable = false)
	private boolean isBlocked;
	@Transient
	private boolean agreedTerms;
	
	
	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}



	



	public UserInfo(String name, String email, String password, String gender, String about, LocalDateTime dateTime,
			String profile, String role, List<Post> posts, List<Like> likes, boolean agreedTerms) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.dateTime = dateTime;
		this.profile = profile;
		this.role = role;
		this.posts = posts;
		this.likes = likes;
		this.agreedTerms = agreedTerms;
	}







	public UserInfo(int id, String name, String email, String password, String gender, String about,
			LocalDateTime dateTime, String profile, String role, List<Post> posts, List<Like> likes,
			boolean agreedTerms) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.dateTime = dateTime;
		this.profile = profile;
		this.role = role;
		this.posts = posts;
		this.likes = likes;
		this.agreedTerms = agreedTerms;
	}







	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getAbout() {
		return about;
	}



	public void setAbout(String about) {
		this.about = about;
	}



	public LocalDateTime getDateTime() {
		return dateTime;
	}



	public void setDateTime(LocalDateTime dateTime) {
		this.dateTime = dateTime;
	}



	public String getProfile() {
		return profile;
	}



	public void setProfile(String profile) {
		this.profile = profile;
	}



	public String getRole() {
		return role;
	}



	public void setRole(String role) {
		this.role = role;
	}
	
	
	public boolean isAgreedTerms() {
		return agreedTerms;
	}







	public void setAgreedTerms(boolean agreedTerms) {
		this.agreedTerms = agreedTerms;
	}





  








	public List<Like> getLikes() {
		return likes;
	}







	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}







	public List<Post> getPosts() {
		return posts;
	}



	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}



	public List<Comment> getComments() {
		return comments;
	}







	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}







	






	







	public boolean isBlocked() {
		return isBlocked;
	}







	public void setBlocked(boolean isBlocked) {
		this.isBlocked = isBlocked;
	}







	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", gender="
				+ gender + ", about=" + about + ", dateTime=" + dateTime + ", profile=" + profile + ", role=" + role
				+ ", agreedTerms=" + agreedTerms + "]";
	}

	

}
