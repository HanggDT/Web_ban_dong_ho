/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mirora.entity;

/**
 *
 * @author Tuan Hoang
 */
public class Cart {

    private Product pro;
    private int quantity;
    private String color;

    public Cart() {
    }
    //Hàm khởi tạo có tham số

    public Cart(Product pro, int quantity, String color) {
        this.pro = pro;
        this.quantity = quantity;
        this.color = color;
    }

    public Cart(Product pro, int quantity) {
        this.pro = pro;
        this.quantity = quantity;
    }
    
    
    

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    

  

    public Product getPro() {
        return pro;
    }

    public void setPro(Product pro) {
        this.pro = pro;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
