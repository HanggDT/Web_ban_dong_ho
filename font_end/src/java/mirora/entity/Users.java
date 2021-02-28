package mirora.entity;
// Generated Nov 4, 2020 4:35:21 PM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Users generated by hbm2java
 */
public class Users  implements java.io.Serializable {


     private int userId;
     private String userName;
     private String userPassword;
     private Boolean gender;
     private String mail;
     private String phone;
     private String userAddress;
     private Boolean userStatus;
     private Boolean permission;
     private Set orderses = new HashSet(0);
     private Set comments = new HashSet(0);
     private Set starses = new HashSet(0);
     private Set favorites = new HashSet(0);

    public Users() {
    }

	
    public Users(int userId) {
        this.userId = userId;
    }
    public Users(int userId, String userName, String userPassword, Boolean gender, String mail, String phone, String userAddress, Boolean userStatus, Boolean permission, Set orderses, Set comments, Set starses, Set favorites) {
       this.userId = userId;
       this.userName = userName;
       this.userPassword = userPassword;
       this.gender = gender;
       this.mail = mail;
       this.phone = phone;
       this.userAddress = userAddress;
       this.userStatus = userStatus;
       this.permission = permission;
       this.orderses = orderses;
       this.comments = comments;
       this.starses = starses;
       this.favorites = favorites;
    }
   
    public int getUserId() {
        return this.userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getUserPassword() {
        return this.userPassword;
    }
    
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
    public Boolean getGender() {
        return this.gender;
    }
    
    public void setGender(Boolean gender) {
        this.gender = gender;
    }
    public String getMail() {
        return this.mail;
    }
    
    public void setMail(String mail) {
        this.mail = mail;
    }
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getUserAddress() {
        return this.userAddress;
    }
    
    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }
    public Boolean getUserStatus() {
        return this.userStatus;
    }
    
    public void setUserStatus(Boolean userStatus) {
        this.userStatus = userStatus;
    }
    public Boolean getPermission() {
        return this.permission;
    }
    
    public void setPermission(Boolean permission) {
        this.permission = permission;
    }
    public Set getOrderses() {
        return this.orderses;
    }
    
    public void setOrderses(Set orderses) {
        this.orderses = orderses;
    }
    public Set getComments() {
        return this.comments;
    }
    
    public void setComments(Set comments) {
        this.comments = comments;
    }
    public Set getStarses() {
        return this.starses;
    }
    
    public void setStarses(Set starses) {
        this.starses = starses;
    }
    public Set getFavorites() {
        return this.favorites;
    }
    
    public void setFavorites(Set favorites) {
        this.favorites = favorites;
    }




}

