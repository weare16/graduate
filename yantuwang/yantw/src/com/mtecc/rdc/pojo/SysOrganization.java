package com.mtecc.rdc.pojo;

import java.util.List;

public class SysOrganization{
	private static final long serialVersionUID = 1L;
	private Integer orgid;
	private String orgname;
	private String orglevel;
	private String parentorg;
	private String orgaddress;
	private String remark;
	private String state;
	
	private  List<SysOrganization> sonorglist;
	
	
	public SysOrganization(){
		super();
	}
	
	public SysOrganization(Integer orgid){
		super();
		this.orgid = orgid;
	}
	public SysOrganization(Integer orgid, String orgname) {
		super();
		this.orgid = orgid;
		this.orgname = orgname;
	}
	public SysOrganization(Integer orgid, String orgname,
			String orglevel, String parentorg, String orgaddress,
			 String remark,String state) {
		super();
		this.orgid = orgid;
		this.orgname = orgname;
		this.orglevel = orglevel;
		this.parentorg = parentorg;
		this.orgaddress = orgaddress;
		this.remark = remark;
		this.state=state;
	}
	
	public Integer getOrgid() {
		return orgid;
	}

	public void setOrgid(Integer orgid) {
		this.orgid = orgid;
	}


	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public void setOrglevel(String orglevel) {
		this.orglevel = orglevel;
	}

	public String getParentorg() {
		return parentorg;
	}

	public void setParentorg(String parentorg) {
		this.parentorg = parentorg;
	}

	public String getOrgaddress() {
		return orgaddress;
	}

	public void setOrgaddress(String orgaddress) {
		this.orgaddress = orgaddress;
	}


	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getOrglevel() {
		return orglevel;
	}

	public List<SysOrganization> getSonorglist() {
		return sonorglist;
	}

	public void setSonorglist(List<SysOrganization> sonorglist) {
		this.sonorglist = sonorglist;
	}
	
	

}