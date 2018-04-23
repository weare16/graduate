package com.mtecc.rdc.pojo;

/**
 * FsUuaUsergpmenu entity. @author MyEclipse Persistence Tools
 */

public class SysGroupMenu implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer gmid;
	private Integer groupid;
	private SysMenu menuid;

	// Constructors

	/** default constructor */
	public SysGroupMenu() {
	}

	public SysGroupMenu(Integer gmid, Integer groupid, SysMenu menuid) {
		super();
		this.gmid = gmid;
		this.groupid = groupid;
		this.menuid = menuid;
	}

	public Integer getGmid() {
		return gmid;
	}

	public void setGmid(Integer gmid) {
		this.gmid = gmid;
	}

	public Integer getGroupid() {
		return groupid;
	}

	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}

	public SysMenu getMenuid() {
		return menuid;
	}

	public void setMenuid(SysMenu menuid) {
		this.menuid = menuid;
	}

	/** full constructor */
	

	
	

}