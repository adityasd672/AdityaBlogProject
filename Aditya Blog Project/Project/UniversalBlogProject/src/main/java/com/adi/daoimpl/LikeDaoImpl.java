package com.adi.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.adi.dao.LikeDao;
import com.adi.pojo.Like;
import com.adi.pojo.Post;
import com.adi.pojo.UserInfo;

@Component
public class LikeDaoImpl implements LikeDao{
	
	@Autowired
	private HibernateTemplate hTemplate;

	@Override
	@Transactional
	public boolean insertLike(Like like) {
		
		try {
			hTemplate.save(like);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public int countLikeOnPost(Post p) {
		
		int count = 0;
		try {
			count = hTemplate.execute(new HibernateCallback<Integer>() {

				@Override
				public Integer doInHibernate(Session session) throws HibernateException {
					Query q = session.createQuery("from Like where post = :p");
					q.setParameter("p", p);
					List<Like> lst = q.list();
					
					return lst.size();
				}
				
			});
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return count;
	}

	@Override
	public boolean isLikedByUser(Post p, UserInfo u) {
		
		boolean b = false;
		try {
			b = hTemplate.execute(new HibernateCallback<Boolean>() {

				@Override
				public Boolean doInHibernate(Session session) throws HibernateException {
					
					Query q = session.createQuery("from Like where post = :p and user = :u");
					q.setParameter("p", p);
					q.setParameter("u", u);
					List<Like> lst = q.list();
					
					return !lst.isEmpty();
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		System.out.println("isLikedByUser = " + b);
		
		return b;
	}

	@Override
	@Transactional
	public boolean deleteLike(Post p, UserInfo u) {
		
		boolean b = false;
		try {
			b = hTemplate.execute(new HibernateCallback<Boolean>() {

				@Override
				public Boolean doInHibernate(Session session) throws HibernateException {
					Query q = session.createQuery("Delete from Like where post = :p and user = :u");
					q.setParameter("p", p);
					q.setParameter("u", u);
					int result = q.executeUpdate();
					return result>0;
				}
				
			});
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return b;
	}
}
