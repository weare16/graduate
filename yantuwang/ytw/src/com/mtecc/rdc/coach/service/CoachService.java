package com.mtecc.rdc.coach.service;

import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.web.multipart.MultipartFile;

import com.mtecc.rdc.pojo.Coach;
import com.mtecc.rdc.pojo.User;

public interface CoachService {
	
	public User  getUserById(Integer  userid) throws  Exception;
	
	public boolean  updateUser(User  u) throws  Exception;
	
	public Integer  saveCoach(Coach c) throws  Exception;
	
	public List<Coach>  getCoachByUser(Integer userid) throws  Exception;
	
	public  boolean     deleteCoachList  (List<Coach> list) throws  Exception;
	
	

	
	
	
	
	



}
