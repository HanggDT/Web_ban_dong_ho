package mirora.entity;
// Generated Nov 4, 2020 4:35:21 PM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Comment generated by hbm2java
 */
public class Comment  implements java.io.Serializable {


     private int commentId;
     private Product product;
     private Users users;
     @DateTimeFormat(pattern = "yyyy-MM-dd")
     private Date createdateComment;
     private String commentContent;
     private Integer parentId;
     private Boolean commentStatus;

    public Comment() {
    }

	
    public Comment(int commentId) {
        this.commentId = commentId;
    }
    public Comment(int commentId, Product product, Users users, Date createdateComment, String commentContent, Integer parentId, Boolean commentStatus) {
       this.commentId = commentId;
       this.product = product;
       this.users = users;
       this.createdateComment = createdateComment;
       this.commentContent = commentContent;
       this.parentId = parentId;
       this.commentStatus = commentStatus;
    }
   
    public int getCommentId() {
        return this.commentId;
    }
    
    public void setCommentId(int commentId) {
        this.commentId = commentId;
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
    public Date getCreatedateComment() {
        return this.createdateComment;
    }
    
    public void setCreatedateComment(Date createdateComment) {
        this.createdateComment = createdateComment;
    }
    public String getCommentContent() {
        return this.commentContent;
    }
    
    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }
    public Integer getParentId() {
        return this.parentId;
    }
    
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
    public Boolean getCommentStatus() {
        return this.commentStatus;
    }
    
    public void setCommentStatus(Boolean commentStatus) {
        this.commentStatus = commentStatus;
    }




}

