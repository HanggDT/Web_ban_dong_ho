/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.admin.model;

import java.util.List;
import mirora.entity.Banner;
import mirora.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Tuan Hoang
 */
public class BannerModel {

    public List<Banner> getAllBan() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Query query = session.createQuery("from Banner");
        List<Banner> listBan = query.list();
        session.getTransaction().commit();
        session.close();
        return listBan;
    }

    public boolean insertBanner(Banner ban) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.save(ban);
            session.getTransaction().commit();
            session.close();
            return true;
            
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }

    public boolean updateBanner(Banner ban) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            session.merge(ban);
            trans.commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        }
        return false;
    }

    public Banner getBannerById(String bannerId) {
        Session session = null;
        Transaction trans = null;
        Banner ban = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Query query = session.createQuery("from Banner where bannerId=:banId");
            query.setString("banId", bannerId);
            ban = (Banner) query.uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ban;
    }

    public boolean deleteBanner(String banId) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.getTransaction();
            trans.begin();
            Banner ban = getBannerById(banId);
            if (ban != null) {
                session.delete(ban);
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
