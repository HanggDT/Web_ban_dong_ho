/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.admin.controller;

import java.util.List;
import mirora.admin.model.CategoriesModel;
import mirora.entity.Categories;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Thanh Nam
 */
@Controller
@RequestMapping(value = "/categoriesController")
public class CategoriesController {
    private CategoriesModel catModel;

    public CategoriesController() {
        catModel = new CategoriesModel();
    }
    
    @RequestMapping(value = "/getAll")
    public ModelAndView getAllCategories(){
        ModelAndView mav = new ModelAndView("admin/jsp/catalog");
        List<Categories> listCat = catModel.getAllCat();
        mav.addObject("listCat", listCat);
        return mav;
    }
    
    @RequestMapping(value = "/preInsert")
    public ModelAndView preInsert(){
        ModelAndView mav =  new ModelAndView("admin/jsp/newcatalog");
        Categories cat = new Categories();
        List<Categories> listCat = catModel.getAllCat();
        mav.addObject("catNew", cat);
        mav.addObject("listCat", listCat);
        return mav;
    }
    
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insertCategory(Categories catNew){
        boolean check = catModel.insertCategory(catNew);
        if (check) {
            return "redirect:getAll.htm";
        } else {
            return "admin/jsp/error";
        }
    }
    
    @RequestMapping(value = "/preUpdate")
    public ModelAndView preUpdate(String catalogId){
        ModelAndView mav = new ModelAndView("admin/jsp/updatecatalog");
        Categories cat = catModel.getCategoryById(catalogId);
        List<Categories> listCat = catModel.getAllCat();
        mav.addObject("catUpdate", cat);
        mav.addObject("listCat", listCat);
        return mav;
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Categories catUpdate){
        boolean check = catModel.updateCategory(catUpdate);
        if (check) {
            return "redirect:getAll.htm";
        } else {
            return "admin/jsp/error";
        }
    }
    
    @RequestMapping(value ="/delete")
    public String delete(String catalogId){
        boolean check = catModel.deleteCategory(catalogId);
        if (check) {
            return "redirect:getAll.htm";
        } else {
            return "admin/jsp/error";
        }
    }
}