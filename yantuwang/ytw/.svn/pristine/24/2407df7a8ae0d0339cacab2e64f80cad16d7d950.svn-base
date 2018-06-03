package com.mtecc.rdc.system.sys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mtecc.rdc.goodsinfo.condition.goodsCondition;
import com.mtecc.rdc.pojo.Goods;
import com.mtecc.rdc.pojo.SysGroup;
import com.mtecc.rdc.pojo.SysOrganization;
import com.mtecc.rdc.pojo.SysUser;
import com.mtecc.rdc.pojo.SysUserGroup;
import com.mtecc.rdc.system.login.service.UserService;
import com.mtecc.rdc.system.sys.condition.UserManageCondition;
import com.mtecc.rdc.system.sys.service.SysService;
import com.mtecc.rdc.util.Base64;
import com.mtecc.rdc.util.EmptyUtil;
import com.mtecc.rdc.util.JsonAjaxDoneUtil;
import com.mtecc.rdc.util.MD5;

/**
 * 人员管理
 * @author lxm
 * 
 */
@Controller
@RequestMapping("/system/usermanage/")
public class UserManageController {

	@Autowired
	private SysService sysService;

	/**
	 * 获取人员数据
	 * @author lxm
	 * 
	 */
	@RequestMapping("toList.htm")
	public String toLogin(HttpServletRequest  req,HttpServletResponse response,Model model) {
			String result="";
			result=req.getParameter("result");
			//获取到所有机构
			try {
				List<SysOrganization>  orgList=sysService.getAllOrg();
				model.addAttribute("orgList", orgList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("result", result);
		return "system/usermanage/userlist";
	}
	/**
	 * 表格加载数据
	 * @param req
	 * @param response
	 * @param model
	 * @param page
	 * @param limit
	 */
	@RequestMapping("listfortable.htm")
	public void listfortable(HttpServletRequest  req,HttpServletResponse response, int page,int limit ,
			UserManageCondition  condition) {
		JsonAjaxDoneUtil.setHeadFormatUTF8(response);
		JSONObject obj=new JSONObject();
		try {
			List<SysUser>  list=sysService.queryUsers(condition, page, limit);
			int  count=sysService.count(condition);
			//重新封装数据
			JSONArray array=new JSONArray();
			for (int i = 0; i < list.size(); i++) {
				JSONObject ob=new JSONObject();
				ob.put("logname", list.get(i).getLogname());
				ob.put("username", list.get(i).getUsername());
				ob.put("userid", list.get(i).getUserid());
				ob.put("phonenum", list.get(i).getPhonenum());
				ob.put("email", list.get(i).getEmail());
				ob.put("orgname", list.get(i).getOrg().getOrgname());
				array.add(ob);
			}
            
			obj.put("data", array);
			obj.put("code", "0");
			obj.put("msg", "");
			obj.put("count", count);
			obj.put("limit", limit);
			
			PrintWriter out = response.getWriter();
			System.out.println(obj);
			out.print(obj.toString());
			out.flush();
			out.close();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		
		
	}
	/**
	 * 跳转至添加人员
	 */
	@RequestMapping("toAdd.htm")
	public String toAdd(HttpServletRequest  req,HttpServletResponse response,Model model){
		
		try {
			//获取到所有机构
			List<SysOrganization>  orgList=sysService.getAllOrg();
			//获取所有用户组
			List<SysGroup> groupList=sysService.getAllGroup();
			model.addAttribute("groupList", groupList);
			model.addAttribute("orgList", orgList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "system/usermanage/useradd";
	}
	/**
	 * 添加人员
	 */
	@RequestMapping("Add.htm")
	public void  Add(SysUser user,int[] groupid,HttpServletRequest  req,HttpServletResponse response,Model model){
			try {
				if(null!=user){
				JSONObject  obj=new JSONObject();
				String result="";
				Integer userid=sysService.saveUser(user);
				
				if(groupid.length>0){
					 for (int i = 0; i < groupid.length; i++) {
						  SysUserGroup  ug=new SysUserGroup();
					      ug.setUserid(userid);
					      ug.setGroupid(groupid[i]);
					      Integer usergpid=sysService.saveUserGroup(ug);
					      if(EmptyUtil.isEmpty(usergpid)){
					    	  result="501";//绑定用户组失败
					    	  break;
					      }
					 }
				      
				}
				
				if(!EmptyUtil.isEmpty(userid)){//成功
					result="200";
				}else{//失败
					result="500";
				}
				obj.put("result", result);
				PrintWriter out = response.getWriter();
				System.out.println(obj);
				out.print(obj.toString());
				out.flush();
				out.close();
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	/**
	 * 跳转至修改人员
	 */
	@RequestMapping("toEdit.htm")
	public String toEdit(HttpServletRequest  req,HttpServletResponse response,Integer userid,Model model){
		try {
			SysUser  user=sysService.getUserById(userid);
			//获取到所有机构
			List<SysOrganization>  orgList=sysService.getAllOrg();
			//获取所有用户组
			List<SysGroup> groupList=sysService.getAllGroup();
			//获取当前用户所绑定的用户组
			List<SysUserGroup> uglist=sysService.getGroupByUserid(userid);
			String arr="";
			for (int i = 0; i < uglist.size(); i++) {
				if(i==uglist.size()-1){
					arr=arr+uglist.get(i).getGroupid();
				}else{
					arr=arr+uglist.get(i).getGroupid()+",";
				}
				
			}
			model.addAttribute("user", user);
			model.addAttribute("orgList", orgList);
			model.addAttribute("groupList", groupList);
			model.addAttribute("ugarr", arr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "system/usermanage/useredit";
	}
	/**
	 * 编辑
	 */
	@RequestMapping("Edit.htm")
	public void Edit(HttpServletRequest  req,HttpServletResponse response,SysUser user,int [] grouparr,Model model){
		try {
			JSONObject  obj=new JSONObject();
			String result="";
			boolean  flag =sysService.updateUser(user);
			//删除当前用户所绑定的用户组
			boolean deleteflag=sysService.deleteGroupByUserid(user.getUserid());
			if(deleteflag){
				//重新绑定用户组
				if(grouparr.length>0){
					 for (int i = 0; i < grouparr.length; i++) {
						  SysUserGroup  ug=new SysUserGroup();
					      ug.setUserid(user.getUserid());
					      ug.setGroupid(grouparr[i]);
					      Integer usergpid=sysService.saveUserGroup(ug);
					      if(EmptyUtil.isEmpty(usergpid)){
					    	  result="501";//绑定用户组失败
					    	  break;
					      }
					 }
				      
				}
			}else{
				result="501";//绑定用户组失败
			}
			
			if(flag){//成功则跳转到列表
				result="200";
			}else{
				result="500";
			}
			obj.put("result", result);
			PrintWriter out = response.getWriter();
			System.out.println(obj);
			out.print(obj.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 删除
	 */
	@RequestMapping("delete.htm")
	public String delete(HttpServletRequest  req,HttpServletResponse response,String deleteStr,Model model){
		try {
			String result="200";//成功
			JSONArray array=JSONArray.fromObject(deleteStr);
			for (int i = 0; i < array.size(); i++) {
				Integer   userid=(Integer) array.getJSONObject(i).get("userid");
				SysUser  user=sysService.getUserById(userid);
				//删除用户
				boolean  flag=sysService.deleteUser(user);
				//删除与用户组相关联的中间表数据
				boolean deleteflag=sysService.deleteGroupByUserid(user.getUserid());
				if(!flag || !deleteflag){//失败
					result="500";
					break;
				}
			}
			model.addAttribute("result", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/system/usermanage/toList.htm";
	}
	/**
	 * 跳转至绑定用户组
	 *
	 */
	@RequestMapping("toBindRole.htm")
	public String toBindRole(Integer userid,HttpServletRequest  req,HttpServletResponse response,Model model){
		
		try {
			//获取所有用户组
			List<SysGroup> groupList=sysService.getAllGroup();
			//获取当前用户所绑定的用户组
			List<SysUserGroup> uglist=sysService.getGroupByUserid(userid);
			String arr="";
			for (int i = 0; i < uglist.size(); i++) {
				if(i==uglist.size()-1){
					arr=arr+uglist.get(i).getGroupid();
				}else{
					arr=arr+uglist.get(i).getGroupid()+",";
				}
			}
			model.addAttribute("groupList", groupList);
			model.addAttribute("ugarr", arr);
			model.addAttribute("userid", userid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "system/usermanage/bindrole";
	}
	
	/**
	 * 绑定用户组
	 *
	 */
	@RequestMapping("bindRole.htm")
	public void bindRole(HttpServletRequest  req,HttpServletResponse response,int userid,int[] grouparr,Model model){
		try {
			JSONObject  obj=new JSONObject();
			String result="200";//成功
			//删除当前用户所绑定的用户组
			boolean deleteflag=sysService.deleteGroupByUserid(userid);
			if(deleteflag){
				//重新绑定用户组
				if(grouparr.length>0){
					 for (int i = 0; i < grouparr.length; i++) {
						  SysUserGroup  ug=new SysUserGroup();
					      ug.setUserid(userid);
					      ug.setGroupid(grouparr[i]);
					      Integer usergpid=sysService.saveUserGroup(ug);
					      if(EmptyUtil.isEmpty(usergpid)){
					    	  result="500";//绑定用户组失败
					    	  break;
					      }
					 }
				      
				}
			}else{
				result="500";//绑定用户组失败
			}
			obj.put("result", result);
			PrintWriter out = response.getWriter();
			System.out.println(obj);
			out.print(obj.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
}
