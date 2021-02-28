/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mirora.admin.model.AccountModel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Thanh Nam
 */
@Controller
@RequestMapping (value = "/loginController")
public class LoginController {
    private AccountModel accModel;

    public LoginController() {
        accModel = new AccountModel();
    }
    
    @RequestMapping(value = "/login")
    public ModelAndView diplayLogin(){
        ModelAndView mav = new ModelAndView("admin/jsp/login");
        return mav;
    }
    
    @RequestMapping(value = "/checklogin", method = RequestMethod.POST)
    public String checkLogin(HttpServletRequest request, HttpServletResponse response){
        String username = request.getParameter("uname");
        String password = request.getParameter("psw");
        String email = accModel.checkAccountLogin(username, password);
        if (email!=null) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            return "redirect:../categoriesController/getAll.htm";
        } else {
            return "admin/jsp/login";
        }
    }
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.removeAttribute("email");
        return "redirect:../loginController/login.htm";
    }
    
}
