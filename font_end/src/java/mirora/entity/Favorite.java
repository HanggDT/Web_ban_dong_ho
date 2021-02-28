package mirora.entity;
// Generated Nov 4, 2020 4:35:21 PM by Hibernate Tools 4.3.1



/**
 * Favorite generated by hbm2java
 */
public class Favorite  implements java.io.Serializable {


     private int favoriteId;
     private Product product;
     private Users users;

    public Favorite() {
    }

	
    public Favorite(int favoriteId) {
        this.favoriteId = favoriteId;
    }
    public Favorite(int favoriteId, Product product, Users users) {
       this.favoriteId = favoriteId;
       this.product = product;
       this.users = users;
    }
   
    public int getFavoriteId() {
        return this.favoriteId;
    }
    
    public void setFavoriteId(int favoriteId) {
        this.favoriteId = favoriteId;
    }
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }




}


