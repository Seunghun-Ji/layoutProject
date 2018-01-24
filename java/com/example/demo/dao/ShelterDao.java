package com.example.demo.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.Shelter;

@Repository("ShelterDao")
public class ShelterDao extends HibernateDaoSupport {
	
	
	@Autowired
	public ShelterDao(
			@Qualifier("hibernateSessionFactoryBean") SessionFactory sessionFactory){
		setSessionFactory(sessionFactory);
		//setSessionFactory(sessionFactory); // HibernateDaoSupport
	}

	public List<Shelter> getList(String guName){
        int result = 0;
        Session session = null;
        Criteria criteria;
     
        System.out.println("guName : "+ guName);
        List<Shelter> list = null;
        try{
            session = getSessionFactory().openSession();
            criteria =session.createCriteria(Shelter.class);
            criteria.add(Restrictions.like("addr_gu",guName,MatchMode.END));
            list = criteria.list();
            
        }catch (HibernateException e){
        	System.out.println("errror~");
        }finally {
            if(session != null){
                session.close();
            }
        }
       
        return list;
		
	}
	
	
}
