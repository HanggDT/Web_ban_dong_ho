/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.admin.controller;

import java.util.List;
import mirora.admin.model.Cmtmodel;
import mirora.entity.Comment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Tuan Hoang
 */
@Controller
@RequestMapping(value = "/cmtController")
public class CmtController {

    private Cmtmodel cmtModel;

    public CmtController() {
        cmtModel = new Cmtmodel();
    }

    @RequestMapping(value = "/getAll")
    public ModelAndView getAllCmt() {
        ModelAndView mav = new ModelAndView("admin/jsp/listcomment");
        List<Comment> listCmt = cmtModel.getAllCmt();
        mav.addObject("listCmt", listCmt);
        return mav;
    }

    

    @RequestMapping(value = "/auth")
    public String auth(String commentId) {
        boolean check = cmtModel.authComment(commentId);
        if (check) {
            return "redirect:getAll.htm";
        } else {
            return "admin/jsp/error";
        }
    }

}
