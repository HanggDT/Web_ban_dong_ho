/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.user.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import mirora.admin.model.Cmtmodel;
import mirora.admin.model.ProductModel;
import mirora.entity.Comment;
import mirora.entity.Product;
import mirora.entity.ProductDetail;
import mirora.entity.Users;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Thanh Nam
 */
@Controller
@RequestMapping(value = "/prodetailController")
public class ProductDetailController {
    private ProductModel proModel;
    private UserAccountModel usModel;
    private Cmtmodel cmtModel;

    public ProductDetailController() {
        proModel = new ProductModel();    
        usModel = new UserAccountModel();
        cmtModel = new Cmtmodel();
    }
    
    @RequestMapping(value = "/getpro")
    public ModelAndView getProdetail(String proId){
        ModelAndView mav = new ModelAndView("user/jsp/productDetail");
        Product pro = proModel.counterView(proId);
        //String path = request.getRequestURI().substring(request.getContextPath().length());
        int availability = 0;
        for (Object ob : pro.getProductDetails()) {
            ProductDetail proDetail = (ProductDetail)ob;
            availability = availability + proDetail.getQuantity();
        }
        List<Comment> listCmt = new ArrayList<>();
        for (Object obj : pro.getComments()) {
            Comment cmt = (Comment) obj;
            if(cmt.getCommentStatus() == true){
                listCmt.add(cmt);
            }
        }
        mav.addObject("pro", pro);
        mav.addObject("availability", availability);
        mav.addObject("listCmt", listCmt);
        return mav;
    }
    
    @RequestMapping(value = "/addComment", method = RequestMethod.POST)
    public String addComment(HttpSession session, HttpServletRequest request, String review, String productId){
        session = request.getSession();
        String userId = (String)session.getAttribute("userId");
       
        Users us = usModel.getUserById(userId);
        Comment cmt = new Comment();
        
        Product pro = proModel.getProductById(productId);
        cmt.setProduct(pro);
        cmt.setCommentContent(review);
        cmt.setUsers(us);
        cmt.setCommentStatus(false);
        boolean check = cmtModel.insertComment(cmt);
        if (check) {
            return "redirect:../prodetailController/getpro.htm?proId="+productId;
        } else {
            
            return "user/jsp/error";
        }
    }
    
}
