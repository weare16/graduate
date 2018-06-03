package com.mtecc.rdc.system.login.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mtecc.rdc.coach.service.CoachService;
import com.mtecc.rdc.pojo.User;
import com.mtecc.rdc.system.login.service.UserService;
import com.mtecc.rdc.util.Base64;
import com.mtecc.rdc.util.EmptyUtil;
import com.mtecc.rdc.util.JsonAjaxDoneUtil;

/**
 * 登录页面
 * 
 * @author lxm
 * 
 */
@Controller
@RequestMapping("/system/login/")
public class LoginController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CoachService cService;

	/**
	 * 跳转至登录页面
	 * 
	 * @author lxm
	 * 
	 */
	@RequestMapping("toLogin.htm")
	public String toLogin(HttpServletRequest  req,Model model) {
		String msg=req.getParameter("msg");
		String lname=req.getParameter("lname");
		model.addAttribute("msg",msg);
		model.addAttribute("lname",lname);
		return "index/login";
	}

	/**
	 * @param lname
	 * @param pwd
	 *  登录
	 */
	@RequestMapping("Login.htm")
	public void toMain(HttpServletResponse response,HttpServletRequest  req,  HttpSession session,Model model,User user) {
		JsonAjaxDoneUtil.setHeadFormatUTF8(response);
        try {
    	    String msg ="";
    	    String password= Base64.getBASE64(user.getPassword());
			JSONArray  array=userService.getValidUser(user.getLogname(), password);
			String result=array.optJSONObject(0).getString("result");
			if(result.equals("SUCCESS")){
				JSONObject  sysuser=array.optJSONObject(0).getJSONObject("user");
				session.setAttribute("mtecc.session.userid",sysuser.get("userid"));
				session.setAttribute("mtecc.session.username",sysuser.get("username"));
				msg = "200";
			}else{
			   msg = "500";//用户名或者密码错误
			}
			response.reset();
			response.getOutputStream().print(msg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	/**
	 * 跳转至注册
	 * 
	 */
	@RequestMapping("toRegist.htm")
	public String toRegist(HttpServletRequest  req,Model model) {
		return "index/regist";
	}
	/**
	 * 验证注册的用户名是否已在库中存在
	 * @author lxm
	 * 
	 */
	@RequestMapping("validateLogName.htm")
	public void validateLogName(HttpServletRequest  req,HttpServletResponse reb,String logname) {
		try {
			JSONObject obj=new JSONObject();
			PrintWriter out=reb.getWriter();
			boolean result=false;
			List <User> list=userService.findUserByLogname(logname);
			if(list.size()>0){//用户名已存在
				result=true;
			}
			
			obj.put("result", result);
			out.print(obj.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	/**
	 * 注册
	 * @author lxm
	 * 
	 */
	@RequestMapping("Regist.htm")
	public String Regist(HttpServletRequest  req,HttpServletResponse reb,Model model,User user) {
		int msg=200;
		//将密码进行加密处理
		String basePass=Base64.getBASE64(user.getPassword());
		user.setPassword(basePass);
		Integer userid;
		try {
			userid = userService.saveUser(user);
			if(EmptyUtil.isEmpty(userid)){
				msg=500;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("msg", msg);
		return "index/registresult";
	}
	/**
	 * 跳转至修改密码
	 * @param req
	 * @param reb
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("toChangePwd.htm")
	public String  toChangePwd(HttpServletRequest  req,HttpServletResponse reb,HttpSession  session
			,Model  model) {
		Integer  userid=  (Integer) session.getAttribute("mtecc.session.userid");
		User u;
		try {
			u = cService.getUserById(userid);
			model.addAttribute("user", u);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "index/changepwd";
	}
	/**
	 * 修改密码
	 * @param req
	 * @param reb
	 * @param session
	 */
	
	
	
	
	@RequestMapping("changePwd.htm")
	public void changePwd(HttpServletRequest  req,HttpServletResponse reb
			,HttpSession  session) {
		int result=500;
		String oldpwd=req.getParameter("oldpass");
		String newpwd=req.getParameter("newpass");
		Integer  userid=  (Integer) session.getAttribute("mtecc.session.userid");
		User u;
		try {
			u = cService.getUserById(userid);
			if((Base64.getBASE64(oldpwd)).equals(u.getPassword())){
				u.setPassword(Base64.getBASE64(newpwd));
				boolean  flag=cService.updateUser(u);
				if(flag){
					result=200;
				}
			}else{
				result=501;//原密码错误
			}
			JSONObject obj=new JSONObject();
			PrintWriter out=reb.getWriter();
			obj.put("result", result);
			out.print(obj.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
