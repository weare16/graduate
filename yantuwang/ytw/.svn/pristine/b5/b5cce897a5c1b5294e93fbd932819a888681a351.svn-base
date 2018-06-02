package com.mtecc.rdc.pojo;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class SysGroup implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer usergpid;
	private String usergpname;
	private String usergpdesc;
	private String isactive;

	// Constructors

	public SysGroup() {
		super();
	}

	public SysGroup(Integer usergpid, String usergpname, String usergpdesc,
			String isactive) {
		super();
		this.usergpid = usergpid;
		this.usergpname = usergpname;
		this.usergpdesc = usergpdesc;
		this.isactive = isactive;
	}




	public Integer getUsergpid() {
		return this.usergpid;
	}

	public void setUsergpid(Integer usergpid) {
		this.usergpid = usergpid;
	}

	public String getUsergpname() {
		String temp = null;
		try {
			if(null != this.usergpname){
				temp = URLDecoder.decode(this.usergpname, "utf-8");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	

	public void setUsergpname(String usergpname) {
		try {
			this.usergpname = URLEncoder.encode(usergpname, "utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getUsergpdesc() {
		return this.usergpdesc;
	}

	public void setUsergpdesc(String usergpdesc) {
		this.usergpdesc = usergpdesc;
	}

	public String getIsactive() {
		return this.isactive;
	}

	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}
	

}