package com.example.demo.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
	public ShelterDao(@Qualifier("hibernateSessionFactoryBean") SessionFactory sessionFactory){
		setSessionFactory(sessionFactory);
		//setSessionFactory(sessionFactory); // HibernateDaoSupport
	}

	/**
	 * 
	 * [설명] 하이버네이트를 사용해서 해당 구의 대피소들의 주소를 받아옴
	 * @author YoonAh Park
	 * @since 2018. 1. 24.
	 */
	@SuppressWarnings("unchecked")
	public List<Shelter> getList(String guName){
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
