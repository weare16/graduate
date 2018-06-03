package com.mtecc.rdc.system.login.service;

import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.web.multipart.MultipartFile;

import com.mtecc.rdc.pojo.User;

public interface UserService {

	public List<User> findUserByLogname(String  logname)throws  Exception;
	public  Integer  saveUser(User u)throws Exception;

	public JSONArray getValidUser(String logName, String password)
				throws Exception ;

	/*// 判断一个用户是否是“领导组”用户
	public boolean IsUserisLeader(String userid) throws Exception;
	
	public SysUser  getUserById(String userid) throws  Exception;*/
	
	
	
	



}
