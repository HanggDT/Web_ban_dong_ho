package mirora.entity;
// Generated Nov 4, 2020 4:35:21 PM by Hibernate Tools 4.3.1



/**
 * Images generated by hbm2java
 */
public class Images  implements java.io.Serializable {


     private int imageId;
     private Product product;
     private String imageLink;
     private Boolean imageStatus;

    public Images() {
    }

	
    public Images(int imageId) {
        this.imageId = imageId;
    }
    public Images(int imageId, Product product, String imageLink, Boolean imageStatus) {
       this.imageId = imageId;
       this.product = product;
       this.imageLink = imageLink;
       this.imageStatus = imageStatus;
    }
   
    public int getImageId() {
        return this.imageId;
    }
    
    public void setImageId(int imageId) {
        this.imageId = imageId;
    }
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }
    public String getImageLink() {
        return this.imageLink;
    }
    
    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }
    public Boolean getImageStatus() {
        return this.imageStatus;
    }
    
    public void setImageStatus(Boolean imageStatus) {
        this.imageStatus = imageStatus;
    }




}

