package com.mtecc.rdc.system.login.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.BeansException;
import org.springframework.stereotype.Repository;



import com.mtecc.base.MteccBaseDao;
import com.mtecc.rdc.base.MteccContext;
import com.mtecc.rdc.pojo.SysUser;
import com.mtecc.rdc.pojo.SysUserGroup;
import com.mtecc.rdc.util.Base64;

@Repository
public class UserDao extends MteccBaseDao {

	/**
	 * @description 用户登录验证
	 * @return
	 */
	public JSONArray  getValidUser(String logName,String password) {
		JSONArray jsonStr = null;
		String returnMsg = null;
		Map<String,Object> resultMap = new HashMap<String,Object>();
		List<SysUser> userList;
		try {
			StringBuffer sb = new StringBuffer();
			sb.append( "select u from SysUser u where 1=1 ");
			if(logName!=null&&!"".equals(logName)){
				sb.append(" and u.logname = '"+logName+"'");
			}
			if(password!=null&&!"".equals(password)){
				sb.append(" and u.password = '"+password+"'");
			}
			userList = findAll(sb.toString());
			if(userList.size()==1){
					returnMsg="SUCCESS";
					resultMap.put("user", userList.get(0));
			}else{
				returnMsg="ERROR";
			}
			resultMap.put("result", returnMsg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		jsonStr = JSONArray.fromObject(resultMap);
		return jsonStr;
	}
	

	/**
	 * 判断一个用户是否是“领导组”用户,是返回真，否返回假
	 */
	public boolean IsUserisLeader(String userid) throws Exception {
		try {
			List<SysUserGroup> uList = null;
			StringBuilder sb = new StringBuilder();
			sb.append("from SysUserGroup u where 1=1 and u.userid='"
					+ userid + "' ");
			sb.append(" and u.usergpid='200219'");
			uList = (List<SysUserGroup>) findByHQL(sb.toString());
			if (uList != null && uList.size() > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	/**
	 * 获取单个用户信息
	 */
	public SysUser findUser(String hql) {
		Session session = this.getSession();
		try {
			return (SysUser) session.createQuery(hql).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	// 查找所有的用户
	public List<SysUser> findAll(String hql) throws Exception {
		List<SysUser> list = new ArrayList();
		Session session = null;
		Transaction t = null;
		try {
			session = getSession();
			t = session.beginTransaction();
			Query queryObject = session.createQuery(hql);
			list = queryObject.list();
			t.commit();
		} catch (Exception e) {
			if (t != null) {
				t.rollback();
			}
			throw e;
		} finally {
			session.close();
		}
		return list;
	}
	
	
	
	
	



}
