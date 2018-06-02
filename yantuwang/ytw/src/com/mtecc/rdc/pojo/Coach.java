package com.mtecc.rdc.pojo;



/**
 * Coach entity. @author MyEclipse Persistence Tools
 */

public class Coach  implements java.io.Serializable {


    // Fields    

     private Integer cid;
     private String coachtype;
     private Integer userid;


    // Constructors

    /** default constructor */
    public Coach() {
    }

    
    /** full constructor */
    public Coach(String coachtype, Integer userid) {
        this.coachtype = coachtype;
        this.userid = userid;
    }

   
    // Property accessors

    public Integer getCid() {
        return this.cid;
    }
    
    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCoachtype() {
        return this.coachtype;
    }
    
    public void setCoachtype(String coachtype) {
        this.coachtype = coachtype;
    }

    public Integer getUserid() {
        return this.userid;
    }
    
    public void setUserid(Integer userid) {
        this.userid = userid;
    }
   








}