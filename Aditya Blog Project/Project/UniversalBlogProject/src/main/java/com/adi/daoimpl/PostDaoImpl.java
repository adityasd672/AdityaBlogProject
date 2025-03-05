package com.adi.daoimpl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;


import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.adi.dao.PostDao;
import com.adi.pojo.Category;
import com.adi.pojo.Post;
import com.adi.pojo.UserInfo;

@Component
public class PostDaoImpl implements PostDao{

	@Autowired
	private HibernateTemplate hTemplate;

	@Override
	public List<Category> getAllCategories() {
		
		List<Category> lst = new ArrayList<Category>();
		
		try {
			lst = hTemplate.loadAll(Category.class);
			return lst;
		} catch (Exception e) {
			e.printStackTrace();
			lst.clear();
			return lst;
		}
	}

	@Override
	@Transactional
	public boolean savePost(Post p) {
		
		try {
			hTemplate.save(p);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Category getCategoryUsingId(int cid) {
		
		Category c = null;
		try {
			c = hTemplate.get(Category.class, cid);
			return c;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Post> getAllPosts() {
		
		List<Post> lst = new ArrayList<Post>();
		try {
			lst = hTemplate.loadAll(Post.class);
			return lst;
		} catch (Exception e) {
			e.printStackTrace();
			lst.clear();
			return lst;
		}
	}

	@Override
	public List<Post> getPostsByCategoryId(int cid) {
		
		Category c = this.getCategoryUsingId(cid);
		List<Post> lst = new ArrayList<Post>();
		try {
			lst = hTemplate.execute( new HibernateCallback<List<Post>>() {

				@Override
				public List<Post> doInHibernate(Session session) throws HibernateException {
					
					Query q = session.createQuery("from Post where category = :cat");
					q.setParameter("cat", c);
					List<Post> ls = q.list();
					return ls;
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
			lst.clear();
			return lst;
		}
		
		return lst;
	}

	@Override
	public Post getPostById(int pId) {
		
		Post p = null;
		try {
			p = hTemplate.get(Post.class, pId);
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	@Transactional
	public boolean updatePost(Post p) {
		
		try {
			hTemplate.update(p);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	@Transactional
	public boolean deletePost(Post p) {
		
		try {
			hTemplate.delete(p);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Post> getPostByUser(UserInfo u) {
		
		List<Post> lst = new ArrayList<Post>();
		try {
			lst = hTemplate.execute(new HibernateCallback<List<Post>>() {

				@Override
				public List<Post> doInHibernate(Session session) throws HibernateException {
					Query q = session.createQuery("from Post where user = :u");
					q.setParameter("u", u);
					return q.list();
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
			lst.clear();
			return lst;
		}
		return lst;
	}

	@Override
	@Transactional
	public boolean deleteCategoryUsingId(int cid) {
		
		
		try {
			Category cat = hTemplate.get(Category.class, cid);
			hTemplate.delete(cat);
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}

	@Override
	@Transactional
	public boolean saveCategory(Category cat) {
		
		try {
			hTemplate.save(cat);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	
	
	
}
