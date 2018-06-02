package com.mtecc.rdc.system.menu.service.imp;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.mtecc.rdc.pojo.SysMenu;
import com.mtecc.rdc.system.login.dao.UserDao;
import com.mtecc.rdc.system.login.service.UserService;
import com.mtecc.rdc.system.menu.condition.MenuManageCondition;
import com.mtecc.rdc.system.menu.dao.SysDao;
import com.mtecc.rdc.system.menu.service.SysService;
import com.mtecc.rdc.util.EmptyUtil;

@Service
@Transactional
public class SysServiceImp implements SysService {

	@Autowired
	private SysDao dao;

	public List queryMenu(MenuManageCondition condition, int start, int page)
			throws Exception {
		return dao.queryMenu(condition, start, page);
	}

	public int count(MenuManageCondition condition) throws Exception {
		return count(condition);
	}

	public Integer saveMenu(SysMenu menu) throws Exception {
		return (Integer) dao.save(menu);
	}

	public boolean updateMenu(SysMenu menu) throws Exception {
		return dao.update(menu);
	}

	public boolean deleteMenu(SysMenu menu) throws Exception {
		return dao.delete(menu);
	}

	public SysMenu getMenuById(Integer menuid) throws Exception {
		return (SysMenu) dao.get(SysMenu.class, menuid);
	}

	public List<SysMenu> getAllMneu() throws Exception {
		return dao.getAllMneu();
	}

	public List getMenuByLevel(String menulv, Integer groupid) throws Exception {
		return dao.getMenuByLevel(menulv, groupid);
	}

	public List getSonMenu(Integer menuid, Integer groupid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean deleteMenuByGroupId(Integer groupid) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	

	
}
