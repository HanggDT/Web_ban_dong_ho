/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.user.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import mirora.admin.model.AccountModel;
import mirora.admin.model.ProductModel;
import mirora.entity.Favorite;
import mirora.entity.Product;
import mirora.entity.Users;
import mirora.user.model.FavoriteModel;

/**
 *
 * @author Tuan Hoang
 */
@Controller
@RequestMapping(value = "/favoriteController")
public class FavoriteController {

    private FavoriteModel faModel;
    private ProductModel proModel;
    private UserAccountModel usModel;

    public FavoriteController() {
        faModel = new FavoriteModel();
        proModel = new ProductModel();
        usModel = new UserAccountModel();
    }

    @RequestMapping(value = "/addFa")
    public String addFavorite(HttpSession session, HttpServletRequest request) {
        String userId = (String) session.getAttribute("userId");
        
        if (userId == null) {
            return "redirect:../loginUserController/login.htm";
        } else {
            Users us = usModel.getUserById(userId);
            String productId = request.getParameter("productId");
            Product pro = proModel.getProductById(productId);
            Favorite fa = new Favorite();
            fa.setProduct(pro);
            fa.setUsers(us);
            List<Favorite> listFa = new ArrayList<>();
            for (Object obj : us.getFavorites()) {
                Favorite fav = (Favorite) obj;
                listFa.add(fav);
            }
            if (listFa.size() == 0) {
                boolean check = faModel.insertFa(fa);
                if (check) {
                    return "redirect:../favoriteController/getAll.htm";
                } else {
                    return "admin/jsp/error";
                }
            } else {
                for (int i = 0; i < listFa.size(); i++) {
                    if (listFa.get(i).getProduct().getProductId().equals(pro.getProductId())) {
                        break;

                    } else {
                        boolean check = faModel.insertFa(fa);
                        if (check) {
                            return "redirect:../favoriteController/getAll.htm";
                        } else {
                            return "admin/jsp/error";
                        }
                    }

                }
            }
            return "redirect:../favoriteController/getAll.htm";
        }

    }

    @RequestMapping(value = "/getAll")
    public ModelAndView getAll(HttpSession session, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("user/jsp/favorite");
        String userId = (String) session.getAttribute("userId");
        Users user = usModel.getUserById(userId);
        mav.addObject("user", user);
        return mav;
    }

    @RequestMapping(value = "/remove")
    public String removeFa(String favoriteId) {
        boolean check = faModel.deleteFa(favoriteId);
        if (check) {
            return "redirect:../favoriteController/getAll.htm";
        } else {
            return "user/jsp/error";
        }
    }

    public boolean removeFatoCart(String favoriteId) {
        boolean check = faModel.deleteFa(favoriteId);
        return check;
    }

    @RequestMapping(value = "/addCart")
    public String formFavorToCart(String productId, String favoriteId) {
        boolean check = removeFatoCart(favoriteId);
        if (check) {
            return "redirect:../cartController/addCart.htm?productId=" + productId;
        } else {
            return "user/jsp/error";
        }
    }
}
