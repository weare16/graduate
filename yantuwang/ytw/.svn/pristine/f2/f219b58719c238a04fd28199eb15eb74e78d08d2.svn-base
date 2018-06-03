package com.mtecc.rdc.system.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mtecc.rdc.system.login.service.UserService;
import com.mtecc.rdc.util.Base64;
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
	 *  跳转至主页面
	 */
	@RequestMapping("toMain.htm")
	public void toMain(HttpServletResponse response,HttpServletRequest  req,  HttpSession session,Model model) {
		JsonAjaxDoneUtil.setHeadFormatUTF8(response);
		String msg ="";
		//解密用户信息
		String userMessage = req.getHeader("Authorization");
		String eInfo = Base64.getFromBASE64(userMessage.split(" ")[1]);
		String[] str = eInfo.split(":");
		String lname = str[0];
		String password = str[1];
		System.out.println(password);
		try {
			
			JSONArray  array=userService.getValidUser(lname, password);
			String result=array.optJSONObject(0).getString("result");
			if(result.equals("SUCCESS")){
				JSONObject  sysuser=array.optJSONObject(0).getJSONObject("user");
				session.setAttribute("mtecc.session.userid",sysuser.get("userid"));
				session.setAttribute("mtecc.session.username",sysuser.get("username"));
				//session.setAttribute("mtecc.session.cid",sysuser.getJSONObject("cid").get("cid"));
				//session.setAttribute( "mtecc.session.cname",sysuser.getJSONObject("cid").get("cname"));
				//session.setAttribute("mtecc.session.logname", lname);
				//session.setAttribute("mtecc.session.password", password);
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
	 * @author lxm
	 * 
	 */
	@RequestMapping("toRegist.htm")
	public String toRegist(HttpServletRequest  req,Model model) {
		return "index/regist";
	}
	

}
