package com.mtecc.rdc.system.login.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mtecc.rdc.pojo.User;
import com.mtecc.rdc.system.login.dao.UserDao;
import com.mtecc.rdc.system.login.service.UserService;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserDao regUserDao;
	public List<User> findUserByLogname(String  logname)throws  Exception{
		return regUserDao.findUserByLogname(logname);
	}
	/*
		

		public boolean IsUserisLeader(String userid) throws Exception {
			return regUserDao.IsUserisLeader(userid);
		}
	
		public SysUser  getUserById(String userid) throws  Exception{
			return (SysUser) regUserDao.get(SysUser.class, userid);
		}*/
	public Integer saveUser(User u) throws Exception {
		return (Integer) regUserDao.save(u);
	}
	public JSONArray getValidUser(String logName, String password)
			throws Exception {
		return regUserDao.getValidUser(logName, password);
	}
	



	
}
