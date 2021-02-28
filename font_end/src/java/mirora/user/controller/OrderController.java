/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.user.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import mirora.admin.model.OrderModel;
import mirora.entity.Cart;
import mirora.entity.OrderDetail;
import mirora.entity.Orders;
import mirora.entity.Product;
import mirora.entity.Users;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Tuan Hoang
 */
@Controller
@RequestMapping(value = "/orderController")
public class OrderController {

    private OrderModel oModel;

    public OrderController() {
        oModel = new OrderModel();
    }
    @RequestMapping(value = "/getall")
    public ModelAndView getAll() {
        ModelAndView mav = new ModelAndView("admin/jsp/listOrder");
        List<Orders> listOr = oModel.getAllOrders();
        mav.addObject("listOr", listOr);
        return mav;
    }
    
    @RequestMapping(value = "/auth")
    public String authOrder(String orderId){
        int oId = Integer.parseInt(orderId);
        boolean check = oModel.authOrders(oId);
        if (check) {
            return "redirect:../orderController/getall.htm";
        } else {
            return "admin/jsp/error";
        }
    }
    
    @RequestMapping(value = "/placeOrder")
    public String addOrder(HttpSession session, HttpServletRequest request){
        session = request.getSession();
        String from = request.getPathInfo();
        String userId = (String) session.getAttribute("userId");
        int uId = Integer.parseInt(userId);        
        float tongtien = (float) session.getAttribute("tongTien");      
        List<Cart> listCart = (List<Cart>)session.getAttribute("listCart");
        Orders order = new Orders();
        order.setUsers(new Users(uId));
        List<OrderDetail> listDetail = new ArrayList<>();
        for (Cart cart : listCart) {
            OrderDetail od = new OrderDetail();
            od.setOrders(order);
            od.setProductDetail(cart.getPro().getOneProdetail(cart.getColor()));
            od.setQuantity(cart.getQuantity());
            od.setAmount(cart.getQuantity() * cart.getPro().getPrice());
            od.setOrderStatus(true);
            listDetail.add(od);
        }
        Set<OrderDetail> setOrderDetail = new HashSet(listDetail);
        order.setOrderDetails(setOrderDetail);
        
        order.setTotalAmount(tongtien);
        order.setOrderStatus(false);
        boolean check = oModel.insertOrder(order); 
        if (check) {
            session.removeAttribute("listCart");
            session.removeAttribute("tongTien");
            session.setAttribute("size", 0);
            return "redirect:../myAccountController/myAccount.htm";
        } else {
            return "user/jsp/error";
        }
    }
    
    @RequestMapping(value = "/orderDetail")
    public ModelAndView orderDetail(String orderId){
        ModelAndView mav = new ModelAndView("user/jsp/orderDedail");
        Orders od = oModel.getOrderById(orderId);
        List<OrderDetail> listDetail = new ArrayList<>();
        for (Object orderDetail : od.getOrderDetails()) {
            OrderDetail odetail = (OrderDetail) orderDetail;
            listDetail.add(odetail);
        }
        mav.addObject("listDetail", listDetail);
        mav.addObject("od", od);
        return mav;
    }
}
