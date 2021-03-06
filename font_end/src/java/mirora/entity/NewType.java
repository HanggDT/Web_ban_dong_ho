package mirora.entity;
// Generated Nov 4, 2020 4:35:21 PM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * NewType generated by hbm2java
 */
public class NewType  implements java.io.Serializable {


     private String newsTypeId;
     private Serializable typeName;
     private Boolean newsTypeStatus;
     private Set newses = new HashSet(0);

    public NewType() {
    }

	
    public NewType(String newsTypeId) {
        this.newsTypeId = newsTypeId;
    }
    public NewType(String newsTypeId, Serializable typeName, Boolean newsTypeStatus, Set newses) {
       this.newsTypeId = newsTypeId;
       this.typeName = typeName;
       this.newsTypeStatus = newsTypeStatus;
       this.newses = newses;
    }
   
    public String getNewsTypeId() {
        return this.newsTypeId;
    }
    
    public void setNewsTypeId(String newsTypeId) {
        this.newsTypeId = newsTypeId;
    }
    public Serializable getTypeName() {
        return this.typeName;
    }
    
    public void setTypeName(Serializable typeName) {
        this.typeName = typeName;
    }
    public Boolean getNewsTypeStatus() {
        return this.newsTypeStatus;
    }
    
    public void setNewsTypeStatus(Boolean newsTypeStatus) {
        this.newsTypeStatus = newsTypeStatus;
    }
    public Set getNewses() {
        return this.newses;
    }
    
    public void setNewses(Set newses) {
        this.newses = newses;
    }




}


