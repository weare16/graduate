package com.mtecc.rdc.coach.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import net.sf.json.JSONArray;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mtecc.rdc.coach.dao.CoachDao;
import com.mtecc.rdc.coach.service.CoachService;
import com.mtecc.rdc.pojo.Coach;
import com.mtecc.rdc.pojo.User;
import com.mtecc.rdc.system.login.dao.UserDao;
import com.mtecc.rdc.system.login.service.UserService;

@Service
public class CoachServiceImp implements CoachService {

	@Autowired
	private CoachDao cDao;
	
	
	
	public User  getUserById(Integer  userid) throws  Exception{
		return (User) cDao.get(User.class, userid);
		
	}



	public boolean updateUser(User u) throws Exception {
		return cDao.update(u);
		
	}



	public Integer saveCoach(Coach c) throws Exception {
		return (Integer) cDao.save(c);
	}
	
	public List<Coach>  getCoachByUser(Integer userid) throws  Exception{
		return cDao.getCoachByUser(userid);
	}

	public  boolean     deleteCoachList  (List<Coach> list) throws  Exception{
		boolean flag=true;
		for (int i = 0; i < list.size(); i++) {
			flag=cDao.delete(list.get(i));
			if(!flag){
				break;
			}
		}
		return flag;
	}
	
}
