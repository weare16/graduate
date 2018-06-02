package com.mtecc.rdc.pojo;

import java.util.List;




public class SysMenu implements java.io.Serializable {

	// Fields

	private Integer menuid;
	private Integer pmenuid;
	private String menuname;
	private String menuflag;
	private Integer menuorder;
	private String menuurl;
	private String menulv;
	private String isactive;
	
	private  List<SysMenu> sonlist;
	// Constructors

	public SysMenu() {
	}
	
	
	public SysMenu(Integer menuid) {
		super();
		this.menuid = menuid;
	}

	public SysMenu(Integer menuid, Integer pmenuid, String menuname,
			String menuflag, Integer menuorder, String menuurl, String menulv,
			 String isactive) {
		super();
		this.menuid = menuid;
		this.pmenuid = pmenuid;
		this.menuname = menuname;
		this.menuflag = menuflag;
		this.menuorder = menuorder;
		this.menuurl = menuurl;
		this.menulv = menulv;
		this.isactive = isactive;
		
	}
	// Property accessors

	public Integer getMenuid() {
		return this.menuid;
	}

	public void setMenuid(Integer menuid) {
		this.menuid = menuid;
	}

	public Integer getPmenuid() {
		return this.pmenuid;
	}

	public void setPmenuid(Integer pmenuid) {
		this.pmenuid = pmenuid;
	}

	

	public String getMenuname() {
		return menuname;
	}


	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}


	public String getMenuflag() {
		return this.menuflag;
	}

	public void setMenuflag(String menuflag) {
		this.menuflag = menuflag;
	}

	public Integer getMenuorder() {
		return this.menuorder;
	}

	public void setMenuorder(Integer menuorder) {
		this.menuorder = menuorder;
	}

	public String getMenuurl() {
		return this.menuurl;
	}

	public void setMenuurl(String menuurl) {
		this.menuurl = menuurl;
	}

	

	public String getIsactive() {
		return this.isactive;
	}

	public String getMenulv() {
		return menulv;
	}

	public void setMenulv(String menulv) {
		this.menulv = menulv;
	}

	
	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}


	public List<SysMenu> getSonlist() {
		return sonlist;
	}


	public void setSonlist(List<SysMenu> sonlist) {
		this.sonlist = sonlist;
	}


	

	


}