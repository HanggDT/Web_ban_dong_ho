/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.admin.model;

import java.util.List;
import mirora.entity.Colors;
import mirora.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Thanh Nam
 */
public class ColorModel {
    public List<Colors> getAllColor(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Query query = session.createQuery("from Colors");
        List<Colors> listColor = query.list();
        session.getTransaction().commit();
        session.close();
        return listColor;
    }
    
    public boolean insertColor(Colors color){
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(color);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
    public boolean updateColor(Colors color){
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.merge(color);
            trans.commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
    public Colors getColorById(String colorId){
        Session session = null;
        Transaction trans = null;
        Colors cat = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("from Colors where colorId=:colorId");
            query.setString("colorId", colorId);
            cat = (Colors)query.uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
    
    public boolean deleteColor(String colorId){
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Colors color = getColorById(colorId);
            if (color!=null) {
                session.delete(color);
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
