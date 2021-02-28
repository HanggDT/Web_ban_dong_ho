/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.admin.model;

import mirora.entity.Users;
import mirora.util.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Thanh Nam
 */
public class AccountModel {
    public String checkAccountLogin(String uname, String psw){
        Session session = null;
        Transaction trans = null;
        String email = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("from Users where userName=:uname and userPassword =:psw and permission = 1");
            query.setString("uname", uname);
            query.setString("psw", psw);
            Users user = (Users)query.uniqueResult();
            if (user!=null) {
                email = user.getMail();
            }
            trans.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return email;
    }
}
