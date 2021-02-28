/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.admin.model;

import java.util.List;
import mirora.entity.Product;
import mirora.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Thanh Nam
 */
public class ProductModel {
    public List<Product> getAllPro(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Query query = session.createQuery("from Product");
        List<Product> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
    
    public boolean insertProduct(Product pro){
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();     
            
            session.save(pro);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
    public boolean updateProduct(Product pro){
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.merge(pro);
            trans.commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
    public Product getProductById(String proId){
        Session session = null;
        Transaction trans = null;
        Product pro = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("from Product where productId=:proId");
            query.setString("proId", proId);
            pro = (Product)query.uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pro;
    }
    
    public List<Product> topView(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Query query = session.createQuery("from Product ORDER BY productView DESC").setMaxResults(5);
        List<Product> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
    
    public List<Product> newArrival(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Query query = session.createQuery("from Product ORDER BY createdDate DESC").setMaxResults(10);
        List<Product> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
    
    public List<Product> onSale(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Query query = session.createQuery("from Product where discount > 0");
        List<Product> listPro = query.list();
        session.getTransaction().commit();
        session.close();
        return listPro;
    }
    
    public Product counterView(String proId){
        Session session = null;
        Transaction trans = null;
        Product pro = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin(); 
            Query query = session.createQuery("from Product where productId=:proId");
            query.setString("proId", proId);
            pro = (Product)query.uniqueResult();
            int view = pro.getProductView();
            view = view +1;
            Query query1 = session.createQuery("UPDATE Product set productView = :view where productId=:proId");
            query1.setString("proId", proId);
            query1.setInteger("view", view);
            query1.executeUpdate();
            
            
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return pro;
    }
    
    public boolean deleteProduct(String proId){
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Product pro = getProductById(proId);
            if (pro!=null) {
                session.delete(pro);
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
