/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.user.controller;

import mirora.entity.Cart;
import mirora.entity.Product;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import mirora.admin.model.ProductModel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/cartController")
public class CartController {
    private ProductModel proModel;

    public CartController() {
        proModel = new ProductModel();
    }
    @RequestMapping(value = "/getCart")
    public ModelAndView getCart(HttpSession session, HttpServletRequest request){
    ModelAndView mav = new ModelAndView("user/jsp/cart");
    List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
    return mav;
    }

    @RequestMapping(value = "/addCart")
    public ModelAndView addCart(HttpSession session, HttpServletRequest request) {
        //Khai bao doi tuong ModelAndView
        ModelAndView mav = new ModelAndView("user/jsp/cart");
        //lay listCart o trong session
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        //Lay ma san pham ma khach hang muon mua o request
        String productId = request.getParameter("productId");
        //-Lay thong tin san pham ma khach hang muon mua
        Product pro = proModel.getProductById(productId);
        //kiem tra listCart da ton tai trong session chua        
        if (listCart == null) {
            //Nguoi dung chua mua hang gi
            //-Khoi tao listCart
            listCart = new ArrayList<>();
            //-Khoi tao doi tuong hoa don chi tiet cho khach hang
            Cart cart = new Cart(pro, 1);
            //-add hoa don chi tiet va hoa don(listCart)\
            listCart.add(cart);
        } else {
            //Nguoi dung da mua hang
            //-Kiem tra san pham do da co trong hoa don chua
            boolean checkExist = false;
            for (Cart cart : listCart) {
                if (cart.getPro().getProductId().equals(productId)) {
                    checkExist = true;
                    break;
                }
            }
            if (checkExist) {
                //San pham muon mua da ton tai trong hoa don
                for (int i = 0; i < listCart.size(); i++) {
                    if (listCart.get(i).getPro().getProductId().equals(productId)) {
                        //Cong so luong len 1
                        listCart.get(i).setQuantity(listCart.get(i).getQuantity()+1);
                        break;
                    }
                }
            }else{
                //San pham chua ton tai trong hoa don
                Cart cart = new Cart(pro, 1);
                listCart.add(cart);
            }
        }
        //Add listCart vao session
        session.setAttribute("listCart", listCart);
        //Tinh tong tien cua hoa don va add vao session
        session.setAttribute("tongTien", sumAmount(listCart));
        session.setAttribute("size",listCart.size());
        
        return mav;
    }
    
    public float sumAmount(List<Cart> listCart){
        float sum = 0;
        for (Cart cart : listCart) {
            sum+=cart.getQuantity()*cart.getPro().getPrice()*(1-cart.getPro().getDiscount());            
        }
        return sum;
    }
    
    @RequestMapping(value = "/updateQuantity",method = RequestMethod.POST)
    public String updateQuantity(HttpSession session,HttpServletRequest request){
        //Lay listCart tu session
        List<Cart> listCart = (List<Cart>)session.getAttribute("listCart");
        //Lay mang so luong cua tung hoa don chi tiet trong request
        String[] arrQuantity = request.getParameterValues("quantity");
        String[] arrColor = request.getParameterValues("color");
        int dem=0;
        //Cap nhat so luong cua cac don hang chi tiet
        for (int i = 0; i < listCart.size(); i++) {
            listCart.get(i).setQuantity(Integer.parseInt(arrQuantity[i]));
            if (listCart.get(i).getColor() == null) {
                for (int j = dem; j < arrColor.length ; j++) {
                    listCart.get(i).setColor(arrColor[j]);
                    dem = dem+1;
                    break;
                }               
            } 
        }
        //add listCart vao session
        session.setAttribute("listCart", listCart);
        //tinh lai tong tien va add vao session
        session.setAttribute("tongTien", sumAmount(listCart));
        return "user/jsp/cart";
    }
    @RequestMapping(value = "/deleteCart")
    public String deleteCart(HttpSession session, HttpServletRequest request){
        //Lay ma san pham can xoa khoi hoa don tu request
        String productId = request.getParameter("productId");
        //Lay listCart tu session
        List<Cart> listCart = (List<Cart>)session.getAttribute("listCart");
        //Xoa productId ra khoi listCart
        for (int i = 0; i < listCart.size(); i++) {
            if (listCart.get(i).getPro().getProductId().equals(productId)) {
                listCart.remove(i);
                break;
            }
        }
        //add listCart vao session
        session.setAttribute("listCart", listCart);
        session.setAttribute("size",listCart.size());
        //Tinh tong tien cua hoa don va add vao session
        session.setAttribute("tongTien", sumAmount(listCart));
        return "user/jsp/cart";
    }
    @RequestMapping(value = "/addCart1")
    public ModelAndView addCart1(HttpSession session, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("user/jsp/cart");
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        String productId = request.getParameter("productId");
        String quan = request.getParameter("qty");
        int qty = Integer.parseInt(quan);
        Product pro = proModel.getProductById(productId);   
        if (listCart == null) {           
            listCart = new ArrayList<>();
            Cart cart = new Cart(pro, qty);
            listCart.add(cart);
        } else {
           
            boolean checkExist = false;
            for (Cart cart : listCart) {
                if (cart.getPro().getProductId().equals(productId)) {
                    checkExist = true;
                    break;
                }
            }
            if (checkExist) {
                for (int i = 0; i < listCart.size(); i++) {
                    if (listCart.get(i).getPro().getProductId().equals(productId)) {
                        listCart.get(i).setQuantity(listCart.get(i).getQuantity()+qty);
                        break;
                    }
                }
            }else{
                Cart cart = new Cart(pro, qty);
                listCart.add(cart);
            }
        }
        session.setAttribute("listCart", listCart);
        session.setAttribute("tongTien", sumAmount(listCart));
        session.setAttribute("size",listCart.size());
        return mav;
    }
}
