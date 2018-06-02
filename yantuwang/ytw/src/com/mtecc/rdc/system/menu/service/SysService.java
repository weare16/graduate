package com.mtecc.rdc.system.menu.service;

import java.util.List;

import javax.swing.text.StyledEditorKit.BoldAction;

import net.sf.json.JSONArray;

import org.springframework.web.multipart.MultipartFile;

import com.mtecc.rdc.pojo.SysMenu;
import com.mtecc.rdc.system.menu.condition.MenuManageCondition;

public interface SysService {


	
	
	
	
	
	
	
	
	
	public List queryMenu(MenuManageCondition condition, int start, int page) throws Exception;
	public int count(MenuManageCondition condition) throws Exception;
	public Integer saveMenu(SysMenu menu)throws  Exception;
	public boolean  updateMenu(SysMenu  menu) throws  Exception;
	public boolean  deleteMenu(SysMenu  menu) throws  Exception;
	public SysMenu  getMenuById(Integer menuid) throws  Exception;
	public List<SysMenu> getAllMneu() throws Exception;
	public List getMenuByLevel(String menulv,Integer groupid) throws Exception;
	public List getSonMenu(Integer menuid,Integer groupid)throws Exception;
	public boolean  deleteMenuByGroupId(Integer  groupid) throws  Exception;


	
	
	
	
	
	
	
	
}
