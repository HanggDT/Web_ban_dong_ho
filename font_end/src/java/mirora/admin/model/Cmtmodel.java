/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.admin.model;

import java.util.List;
import mirora.entity.Comment;
import mirora.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Tuan Hoang
 */
public class Cmtmodel {

    public List<Comment> getAllCmt() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Query query = session.createQuery("from Comment");
        List<Comment> listCmt = query.list();
        session.getTransaction().commit();
        session.close();
        return listCmt;
    }

    public boolean authComment(String commentId) {
        Session session = null;
        Transaction trans = null;
        int cmtId = Integer.parseInt(commentId);
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("UPDATE Comment set commentStatus= 1 where commentId=:commentId");
            query.setInteger("commentId", cmtId);
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

    public boolean insertComment(Comment cmt) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();     
            
            session.save(cmt);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }

    public Comment getCmtById(String cmtId) {
        Session session = null;
        Transaction trans = null;
        Comment cmt = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("from Comment where commentId=:cmtId");
            query.setString("cmtId", cmtId);
            cmt = (Comment) query.uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cmt;
    }
//    public List<Comment> getCommentProduct(String productId){
//        Session session = HibernateUtil.getSessionFactory().openSession();
//        session.getTransaction().begin();
//        Query query = session.createQuery("from Comment where ");
//        List<Comment> listCmt = query.list();
//        session.getTransaction().commit();
//        session.close();
//        return listCmt;
//    }
}
