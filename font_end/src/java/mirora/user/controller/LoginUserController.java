/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.user.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mirora.admin.model.OrderModel;
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
@RequestMapping(value = "/loginUserController")
public class LoginUserController {
    private UserAccountModel uAccountModel;
    private OrderModel oModel;

    public LoginUserController() {
        uAccountModel = new UserAccountModel();
    }
    
    @RequestMapping(value = "/login")
    public ModelAndView diplayLogin(){
        ModelAndView mav = new ModelAndView("user/jsp/login");
        
        return mav;
    }
    
    
    @RequestMapping(value = "/checklogin", method = RequestMethod.POST)
    public String checkLogin(HttpServletRequest request, HttpServletResponse response){
        String username = request.getParameter("uname");
        String password = request.getParameter("psw");
        
        //String from = request.getParameter("from");
        String userId = uAccountModel.checkAccountLogin(username, password);
        if (userId!=null) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);
            return "redirect:../indexController/getAll.htm";
        } else {
            return "user/jsp/login";
        }
    }
    
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.removeAttribute("userId");
        return "redirect:../indexController/getAll.htm";
    }
    
    @RequestMapping(value = "/register")
    public String register(HttpServletRequest request, HttpServletResponse response){
        String email = request.getParameter("register_email");
        String password = request.getParameter("register_password");
        Users newUser = new Users();
        newUser.setUserName(email);
        newUser.setMail(email);
        newUser.setUserPassword(password);
        newUser.setUserStatus(true);
        newUser.setPermission(false);
        boolean check = uAccountModel.register(newUser);
        if (check) {
            return "redirect:../loginUserController/login.htm";
        } else {
            return "user/jsp/error";
        }
    }
}
