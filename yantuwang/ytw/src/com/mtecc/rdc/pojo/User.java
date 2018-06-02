package com.mtecc.rdc.pojo;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userid;
	private String username;
	private String sex;
	private String age;
	private String telphone;
	private String qq;
	private String wechat;
	private String shcool;
	private String college;
	private String discipline;
	private String introduce;
	private String logname;
	private String password;
	private String alipay;
	private String image;
	private String identify;
	private String studentcardid;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String image) {
		this.image = image;
	}

	/** full constructor */
	public User(String username, String sex, String age, String telphone,
			String qq, String wechat, String shcool, String college,
			String discipline, String introduce, String logname,
			String password, String alipay, String image, String identify,
			String studentcardid) {
		this.username = username;
		this.sex = sex;
		this.age = age;
		this.telphone = telphone;
		this.qq = qq;
		this.wechat = wechat;
		this.shcool = shcool;
		this.college = college;
		this.discipline = discipline;
		this.introduce = introduce;
		this.logname = logname;
		this.password = password;
		this.alipay = alipay;
		this.image = image;
		this.identify = identify;
		this.studentcardid=studentcardid;
	}

	// Property accessors

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAge() {
		return this.age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getTelphone() {
		return this.telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getWechat() {
		return this.wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	public String getShcool() {
		return this.shcool;
	}

	public void setShcool(String shcool) {
		this.shcool = shcool;
	}

	public String getCollege() {
		return this.college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getDiscipline() {
		return this.discipline;
	}

	public void setDiscipline(String discipline) {
		this.discipline = discipline;
	}

	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getLogname() {
		return this.logname;
	}

	public void setLogname(String logname) {
		this.logname = logname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAlipay() {
		return this.alipay;
	}

	public void setAlipay(String alipay) {
		this.alipay = alipay;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getIdentify() {
		return this.identify;
	}

	public void setIdentify(String identify) {
		this.identify = identify;
	}

	public String getStudentcardid() {
		return studentcardid;
	}

	public void setStudentcardid(String studentcardid) {
		this.studentcardid = studentcardid;
	}

	
}