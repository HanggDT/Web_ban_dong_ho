/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.user.controller;

import java.util.List;
import mirora.admin.dto.SearchCondition;
import mirora.admin.model.CategoriesModel;
import mirora.admin.model.ColorModel;
import mirora.admin.model.ProductModel;
import mirora.entity.Categories;
import mirora.entity.Colors;
import mirora.entity.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Thanh Nam
 */
@Controller
@RequestMapping(value = "/shopController")
public class ShopController {
    private ColorModel colModel;
    private CategoriesModel catModel;
    private ProductModel proModel;

    public ShopController() {
        colModel = new ColorModel();
        catModel = new CategoriesModel();
        proModel = new ProductModel();
    }
    
    @RequestMapping(value = "/shop")
    public ModelAndView shop(String filter){
        ModelAndView mav = new ModelAndView("user/jsp/shop");
        List<Colors> listColor = colModel.getAllColor();
        List<Categories> listCat = catModel.getAllCat();
        List<Product> listPro = proModel.getAllPro();
        mav.addObject("listColor", listColor);
        mav.addObject("listCat", listCat);
        mav.addObject("listPro", listPro);
        mav.addObject("priceFilter", filter);
        return mav;       
    }
    
    @RequestMapping(value = "/shop-filter",method=RequestMethod.POST)
    public ModelAndView shopFilter(SearchCondition condition){
        ModelAndView mav = new ModelAndView("user/jsp/shop");
        List<Colors> listColor = colModel.getAllColor();
        List<Categories> listCat = catModel.getAllCat();
        List<Product> listPro = proModel.getAllPro();
        mav.addObject("listColor", listColor);
        mav.addObject("listCat", listCat);
        mav.addObject("listPro", listPro);
        return mav;       
    }
    
}
