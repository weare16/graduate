package com.mtecc.rdc.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.mtecc.rdc.util.EmptyUtil;



public  class Goods implements java.io.Serializable {

	// Fields

	private Integer goodsid;//主键
	private String number;//商品编号
	private String name;//名称
	private String barcode;//条码
	private String measure;//规格型号
	private String category;//商品类别
	private String producer;//生产商或者生产地
	private String license;//许可证号
	private String picture;//商品图片
	private String stockwarn;//库存预警
	private String qualitywarn;//保质期预警
	private String suggestion;//审核意见
	private String auditperson;//审核人
	private Date audittime;//审核时间
	private String audittimeStr;

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** full constructor */
	public Goods(String number, String name, String barcode,
			String measure, String category, String producer, String license,
			String picture,String stockwarn,String qualitywarn,String suggestion,
			String auditperson,Date audittime) {
		this.number = number;
		this.name = name;
		this.barcode = barcode;
		this.measure = measure;
		this.category = category;
		this.producer = producer;
		this.license = license;
		this.picture = picture;
		this.stockwarn=stockwarn;
		this.qualitywarn=qualitywarn;
		this.auditperson=auditperson;
		this.audittime=audittime;
		this.suggestion=suggestion;
	}

	// Property accessors

	public Integer getGoodsid() {
		return this.goodsid;
	}

	public void setGoodsid(Integer goodsid) {
		this.goodsid = goodsid;
	}

	public String getNumber() {
		return this.number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBarcode() {
		return this.barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getMeasure() {
		return this.measure;
	}

	public void setMeasure(String measure) {
		this.measure = measure;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getProducer() {
		return this.producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getLicense() {
		return this.license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getStockwarn() {
		return stockwarn;
	}

	public void setStockwarn(String stockwarn) {
		this.stockwarn = stockwarn;
	}

	public String getQualitywarn() {
		return qualitywarn;
	}

	public void setQualitywarn(String qualitywarn) {
		this.qualitywarn = qualitywarn;
	}

	public String getSuggestion() {
		return suggestion;
	}

	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}

	public String getAuditperson() {
		return auditperson;
	}

	public void setAuditperson(String auditperson) {
		this.auditperson = auditperson;
	}

	public Date getAudittime() {
		return audittime;
	}

	public void setAudittime(Date audittime) {
		this.audittime = audittime;
	}

	public String getAudittimeStr() {
		String str="";
		if(!EmptyUtil.isEmpty(audittime)){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			str=sdf.format(audittime);
		}
		return str;
	}

	
	

}