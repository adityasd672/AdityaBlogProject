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

import com.adi.dao.CommentDao;
import com.adi.pojo.Comment;
import com.adi.pojo.Post;
import com.adi.pojo.UserInfo;

@Component
public class CommentDaoImpl implements CommentDao{
	
	@Autowired
	private HibernateTemplate hTemplate;

	@Override
	@Transactional
	public boolean insertComment(Comment c) {
		
		try {
			hTemplate.save(c);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Comment> getCommentsUsingPost(Post p) {
		
		List<Comment> lst = new ArrayList<Comment>();
		try {
			lst = hTemplate.execute(new HibernateCallback<List<Comment>>() {

				@Override
				public List<Comment> doInHibernate(Session session) throws HibernateException {
					
					Query q = session.createQuery("from Comment where post = :p");
					q.setParameter("p", p);
					
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
	public List<Comment> getCommentsUsingUser(UserInfo u) {
		List<Comment> lst = new ArrayList<Comment>();
		try {
			lst = hTemplate.execute(new HibernateCallback<List<Comment>>() {

				@Override
				public List<Comment> doInHibernate(Session session) throws HibernateException {
					
					Query q = session.createQuery("from Comment where user = :u");
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
	public boolean deleteComment(Comment c) {
		try {
			hTemplate.delete(c);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Comment getCommentUsingId(int comId) {
		Comment c = null;
		try {
			c = hTemplate.get(Comment.class, comId);
			return c;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
}
