package com.adi.daoimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.adi.dao.UserInfoDao;
import com.adi.pojo.UserInfo;

@Component
public class UserInfoDaoImpl implements UserInfoDao{

	@Autowired
	private HibernateTemplate hTemplate;

	@Override
	@Transactional
	public boolean addNewUser(UserInfo u) {
		
		try {
			hTemplate.save(u);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public UserInfo getUserByEmailAndPassword(String email, String password) {
		
		UserInfo u = null;
		try {
			u = hTemplate.execute(new HibernateCallback<UserInfo>() {

				@Override
				public UserInfo doInHibernate(Session session) throws HibernateException {
					Query q = session.createQuery("from UserInfo where email = :email and password = :pass");
					q.setParameter("email", email);
					q.setParameter("pass", password);
					List<UserInfo> lst = q.list();
					
					if(!lst.isEmpty()) {
						return lst.get(0);
					}
					else {
						return null;
					}
				}
				
			});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return u;
	}

	@Override
	@Transactional
	public boolean updateUser(UserInfo u) {
		
		try {
			hTemplate.update(u);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public UserInfo getUser(int id) {
		
		UserInfo u = null;
		try {
			u = hTemplate.get(UserInfo.class, id);
			return u;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<UserInfo> getAllUsers() {
		List<UserInfo> lst = new ArrayList<UserInfo>();
		try {
			lst = hTemplate.loadAll(UserInfo.class);
			return lst;
		} catch (Exception e) {
			e.printStackTrace();
			lst.clear();
			return lst;
		}
	}

	@Override
	public boolean doesUserAlreadyExist(String email) {
		
		boolean b = false;
		try {
			b = hTemplate.execute(new HibernateCallback<Boolean>() {

				@Override
				public Boolean doInHibernate(Session session) throws HibernateException {
					Query q = session.createQuery("from UserInfo where email = :em");
					q.setParameter("em", email);
					List<UserInfo> lst = q.list();
					if(lst.isEmpty()) {
						return false;
					}else {
						return true;
					}
				}
				
			});
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return b;
	}

	@Override
	@Transactional
	public boolean deleteUserById(int id) {
		
		UserInfo u = hTemplate.get(UserInfo.class, id);
		try {
			hTemplate.delete(u);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	
	
	
}
