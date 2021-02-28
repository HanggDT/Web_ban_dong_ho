/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.admin.model;

import java.util.List;
import mirora.entity.Categories;
import mirora.util.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Thanh Nam
 */
public class CategoriesModel {
    public List<Categories> getAllCat(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Query query = session.createQuery("from Categories");
        List<Categories> listCat = query.list();
        session.getTransaction().commit();
        session.close();
        return listCat;
    }
    
    public boolean insertCategory(Categories cat){
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(cat);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
    public boolean updateCategory(Categories cat){
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.merge(cat);
            trans.commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
    public Categories getCategoryById(String catId){
        Session session = null;
        Transaction trans = null;
        Categories cat = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("from Categories where catalogId=:catId");
            query.setString("catId", catId);
            cat = (Categories)query.uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
    
    public boolean deleteCategory(String catId){
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Categories cat = getCategoryById(catId);
            if (cat!=null) {
                session.delete(cat);
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
