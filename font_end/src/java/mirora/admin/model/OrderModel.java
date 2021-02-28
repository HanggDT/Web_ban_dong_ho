/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.admin.model;

import java.util.List;
import mirora.entity.Orders;
import mirora.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Tuan Hoang
 */
public class OrderModel {

    public List<Orders> getAllOrders() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Query query = session.createQuery("from Orders");
        List<Orders> listOrd = query.list();
        session.getTransaction().commit();
        session.close();
        return listOrd;
    }

    public List<Orders> getOrdersByStatus() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Query query = session.createQuery("from Orders where orderStatus= 0");
        List<Orders> listOrd = query.list();
        session.getTransaction().commit();
        session.close();
        return listOrd;
    }

    public boolean authOrders(int orderId) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("UPDATE Orders set orderStatus= 1 where orderId=:orderId");
            query.setInteger("orderId", orderId);
            query.executeUpdate();
            trans.commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }

    public boolean insertOrder(Orders ord) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(ord);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }
    
    public Orders getOrderById(String orderId){
        Session session = null;
        Transaction trans = null;
        Orders od = null;
        int oId = Integer.parseInt(orderId);
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("from Orders where orderId=:oId");
            query.setInteger("oId", oId);
            od = (Orders) query.uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return od;
    }
}
