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
import mirora.entity.Orders;
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
@RequestMapping(value = "/myAccountController")
public class myAccountController {

    private UserAccountModel uModel;

    public myAccountController() {
        uModel = new UserAccountModel();
    }

    @RequestMapping(value = "/myAccount")
    public ModelAndView myAccount(HttpSession session, HttpServletRequest request) {
        session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        ModelAndView mav = new ModelAndView("user/jsp/myaccount");
        Users user = uModel.getUserById(userId);
        List<Orders> listOrder = new ArrayList<>();
        for (Object orderse : user.getOrderses()) {
            Orders od = (Orders) orderse;
            listOrder.add(od);
        }
        mav.addObject("user", user);
        mav.addObject("listOrder", listOrder);
        return mav;
    }
    
    @RequestMapping(value = "/changePass" , method = RequestMethod.POST)
    public String changePassword(Users user, HttpServletRequest request) {
        String curren_pass = request.getParameter("cur_password");
        String new_pass = request.getParameter("new_password");
        String confirm_pass = request.getParameter("confirm_password");
        if ((curren_pass.length()==0)||(new_pass.length()==0)||(confirm_pass.length()==0)) {
        
            boolean check = uModel.update(user);
            if (check) {
                return "redirect:../myAccountController/myAccount.htm";
            } else {
                return "user/jsp/error";
            }
        } else {
            if (user.getUserPassword().equals(curren_pass)) {
                if (new_pass.equals(confirm_pass)) {
                    user.setUserPassword(new_pass);
                    boolean check = uModel.update(user);
                    if (check) {
                        return "redirect:../myAccountController/myAccount.htm";
                    } else {
                        return "user/jsp/error";
                    }
                } else {
                    return "user/jsp/error";
                }
            } else {
                return "user/jsp/error";
            }

        }
    }
}
