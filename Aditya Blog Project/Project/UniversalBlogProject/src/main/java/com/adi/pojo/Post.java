package com.adi.pojo;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "post")
public class Post {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int pid;

	private String pTitle;
	@Lob
	@Column(columnDefinition = "TEXT")
	private String pContent;
	private String pCode;
	private String pPic;
	private LocalDateTime pDate;

	@ManyToOne
	@JoinColumn(name = "uid", nullable = false, foreignKey = @ForeignKey(name = "FK_USER_POST", value = ConstraintMode.CONSTRAINT))
	private UserInfo user;

	@ManyToOne
	@JoinColumn(name = "cid", nullable = false, foreignKey = @ForeignKey(name = "FK_CATEGORY_POST", value = ConstraintMode.CONSTRAINT))
	private Category category;
	
	@OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Like> likes;
	@OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Comment> comments;

	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Post(String pTitle, String pContent, String pCode, String pPic, LocalDateTime pDate, UserInfo user,
			Category category) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.user = user;
		this.category = category;
	}

	public Post(int pid, String pTitle, String pContent, String pCode, String pPic, LocalDateTime pDate, UserInfo user,
			Category category) {
		super();
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.user = user;
		this.category = category;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpPic() {
		return pPic;
	}

	public void setpPic(String pPic) {
		this.pPic = pPic;
	}

	public LocalDateTime getpDate() {
		return pDate;
	}

	public void setpDate(LocalDateTime pDate) {
		this.pDate = pDate;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	

	public List<Like> getLikes() {
		return likes;
	}

	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}

	@Override
	public String toString() {
		return "Post [pid=" + pid + ", pTitle=" + pTitle + ", pContent=" + pContent + ", pCode=" + pCode + ", pPic="
				+ pPic + ", pDate=" + pDate + ", user=" + user + ", category=" + category + "]";
	}
	
	
}
