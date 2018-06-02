package com.mtecc.rdc.system.login.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



import com.mtecc.rdc.base.GetJson;
import com.mtecc.rdc.util.GetUrlUtil;

@Controller
@RequestMapping("/")
public class MainController  {
	/**
	 * 跳转至主页面
	 * 
	 * @param session
	 * @param model
	 * @return
	 */

	@RequestMapping("main.htm")
	public String main(HttpSession session, Model model) {
		try {
			String userid = session.getAttribute("mtecc.session.userid")+"";
			String username = (String) session
					.getAttribute("mtecc.session.username");
			//获取当前用户绑定的菜单
			 GetJson gj = new GetJson();
			JSONArray firstjson = gj.loadMenu(null, userid, "1");
			int count=firstjson.size();
			if(firstjson.size()>0){
				for (int i = 0; i <count;  i++) {
					String menuid=firstjson.optJSONObject(i).optString("menuid");
					JSONArray secordjson=gj.loadMenu(menuid, userid, "2");
					firstjson.optJSONObject(i).put("secordjson", secordjson);
				}
			}
			
			model.addAttribute("firstjson", firstjson);
			model.addAttribute("username", username);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index/main";
	}

	/**
	 * 加载核心首页
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("main_index.htm")
	public String homeUI(HttpSession session, Model model) {
		try {
			String userid = (String) session.getAttribute("mtecc.session.user");
			String logname = (String) session
					.getAttribute("mtecc.session.logname");
			String md5Password = (String) session
					.getAttribute("mtecc.session.password");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index/manager_index";
	}
	/**
	 * 个人信息
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("userInfo.htm")
	public String userInfo(HttpServletRequest  req,Model model) {
		String msg=req.getParameter("msg");
		String lname=req.getParameter("lname");
		model.addAttribute("msg",msg);
		model.addAttribute("lname",lname);
		return "index/userinfo";
	}
	
	/**
	 * 修改密码
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("changePwd.htm")
	public String changePwd(HttpServletRequest  req,Model model) {
		String msg=req.getParameter("msg");
		String lname=req.getParameter("lname");
		model.addAttribute("msg",msg);
		model.addAttribute("lname",lname);
		return "index/changepwd";
	}
	

}
