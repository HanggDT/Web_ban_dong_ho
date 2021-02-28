/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.user.model;

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
public class UserBannerModel {

    public List<Banner> getAllBanByStatus() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = session.getTransaction();
        trans.begin();
        Query query = session.createQuery("from Banner");
        List<Banner> listBan = query.list();
        trans.commit();
        session.close();
        return listBan;
    }
}
