/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.user.controller;

import mirora.entity.Users;
import mirora.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Thanh Nam
 */
public class UserAccountModel {
    public String checkAccountLogin(String uname, String psw){
        Session session = null;
        Transaction trans = null;
        String userId = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("from Users where userName=:uname and userPassword =:psw and permission = 0");
            query.setString("uname", uname);
            query.setString("psw", psw);
            Users user = (Users)query.uniqueResult();
            if (user!=null) {
                userId = String.valueOf(user.getUserId());
                
            }
            trans.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userId;
    }
    public boolean register(Users newUser) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(newUser);
            session.getTransaction().commit();
            session.close();
            return true;
            
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    public Users getUserById(String userId){
        Session session = null;
        Transaction trans = null;
        Users user = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("from Users where userId=:uId");
            int uId = Integer.parseInt(userId);
            query.setInteger("uId", uId);
            user = (Users)query.uniqueResult();
            session.getTransaction().commit();
            session.close();     
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    };
    
    public boolean update(Users user){
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.merge(user);
            session.getTransaction().commit();
            session.close();
            return true;
            
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
}
