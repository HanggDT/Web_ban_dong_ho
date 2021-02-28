/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.admin.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import mirora.admin.model.BannerModel;
import mirora.entity.Banner;
import mirora.util.MyUploadFile;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Tuan Hoang
 */
@Controller
@RequestMapping(value = "/bannerController")
public class BannerController {

    private BannerModel banModel;

    public BannerController() {
        banModel = new BannerModel();
    }

    @RequestMapping(value = "/getAll")
    public ModelAndView getAllBanner() {
        ModelAndView mav = new ModelAndView("admin/jsp/banner");
        List<Banner> listBan = banModel.getAllBan();
        mav.addObject("listBan", listBan);
        return mav;
    }

    @RequestMapping(value = "/preInsert")
    public ModelAndView preInsert() {
        ModelAndView mav = new ModelAndView("admin/jsp/newbanner");
        Banner ban = new Banner();
        mav.addObject("newBan", ban);
        return mav;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insertBanner(Banner newBan, HttpServletRequest request, @RequestParam(value = "imageBanner")MultipartFile imagelink) {
        newBan.setImagelink(new MyUploadFile().saveImageToFolder(request, imagelink));
        boolean check = banModel.insertBanner(newBan);
        if (check) {
            return "redirect:../bannerController/getAll.htm";
        } else {
            return "admin/jsp/error";
        }
    }

    @RequestMapping(value = "/preUpdate", method = RequestMethod.GET)
    public ModelAndView preUpdate(String bannerId) {
        ModelAndView mav = new ModelAndView("admin/jsp/updateBanner");
        Banner banUp = banModel.getBannerById(bannerId);
        mav.addObject("banUp", banUp);
        return mav;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Banner banUp) {
        boolean check = banModel.updateBanner(banUp);
        if (check) {
            return "redirect:getAll.htm";
        } else {
            return "admin/jsp/error";
        }
    }

    @RequestMapping(value = "/delete")
    public String delete(String bannerId) {
        boolean check = banModel.deleteBanner(bannerId);
        if (check) {
            return "redirect:getAll.htm";
        } else {
            return "admin/jsp/error";
        }
    }
}
