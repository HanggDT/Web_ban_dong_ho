/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.user.controller;

import java.util.List;
import mirora.admin.model.ProductModel;
import mirora.entity.Banner;
import mirora.entity.Product;
import mirora.user.model.UserBannerModel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Tuan Hoang
 */
@Controller
@RequestMapping(value = "/indexController")
public class IndexController {

    private UserBannerModel banusModel;
    private ProductModel proModel;

    public IndexController() { 
        banusModel = new UserBannerModel();
        proModel = new ProductModel();
    }

    @RequestMapping(value = "/getAll")
    public ModelAndView getAllBanner() {
        ModelAndView mav = new ModelAndView("user/jsp/index");
        List<Banner> listBan = banusModel.getAllBanByStatus();
        List<Product> listPro = proModel.topView();
        List<Product> listProArrival = proModel.newArrival();
        List<Product> listOnSale = proModel.onSale();
        mav.addObject("listBan", listBan);
        mav.addObject("listPro", listPro);
        mav.addObject("listProArrival", listProArrival);
        mav.addObject("listOnSale", listOnSale);
        return mav;
    }
}
