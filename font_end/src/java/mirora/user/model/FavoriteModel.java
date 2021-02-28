/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.user.model;

import java.util.List;
import mirora.entity.Favorite;
import mirora.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Tuan Hoang
 */
public class FavoriteModel {
public List<Favorite> getAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("from Favorite");
        List<Favorite> listFa = query.list();
        trans.commit();
        session.close();
        return listFa;
    }
public boolean insertFa(Favorite fa){
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();     
            
            session.save(fa);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
public Favorite getFaById(String FaId){
        Session session = null;
        Transaction trans = null;
        Favorite fa = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("from Favorite where FavoriteId=:FaId");
            query.setString("FaId", FaId);
            fa = (Favorite)query.uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fa;
    }
 public boolean deleteFa(String FaId){
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Favorite fa = getFaById(FaId);
            if (fa!=null) {
                session.delete(fa);
            }
            trans.commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
}
