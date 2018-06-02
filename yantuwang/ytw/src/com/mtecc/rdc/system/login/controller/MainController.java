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
import com.mtecc.rdc.util.Constants;
import com.mtecc.rdc.util.GetUrlUtil;
/**
 * 主页
 * @author lxm
 *
 */


@Controller
@RequestMapping("/")
public class MainController  {
	
	/**
	 * 未登录首页
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	
	@RequestMapping("noLongin.htm")
	public String noLongin( Model model) {
		//加载默认菜单
		// GetJson gj = new GetJson();
		//JSONArray firstjson = gj.loadMenu(null,"1");
		//过滤掉“管理员入口”这个菜单
		/*for (int i = 0; i < firstjson.size(); i++) {
			JSONObject obj=firstjson.getJSONObject(i);
			String name=(String) obj.opt("menuname");
			if(name.trim().equals("管理员入口")){
				firstjson.remove(i);
				break;
			}
		}
		int count=firstjson.size();
		if(firstjson.size()>0){
			for (int i = 0; i <count;  i++) {
				String menuid=firstjson.optJSONObject(i).optString("menuid");
				JSONArray secordjson=gj.loadMenu(menuid,"2");
				if(secordjson.size()>0){
					firstjson.optJSONObject(i).put("secordjson", secordjson);
				}else{
					firstjson.optJSONObject(i).put("secordjson", "");
				}
			}
		}
		model.addAttribute("firstjson", firstjson);*/
		model.addAttribute("loginstate", 0);
		return "index/showmain";
	}
	
	/**
	 * 已登录主页面
	 * 
	 * @param session
	 * @param model
	 * @return
	 */

	@RequestMapping("main.htm")
	public String main(HttpSession session, Model model) {
		try {
			Integer userid = (Integer) session.getAttribute("mtecc.session.userid");
			String username = (String) session
					.getAttribute("mtecc.session.username");
			if(null==userid){
				return "redirect:noLongin.htm";
				
			}else{
				//获取当前用户绑定的菜单
				// GetJson gj = new GetJson();
				//JSONArray firstjson = gj.loadMenu(null,"1");
				//判断当前用户是否是系统管理员
				if(userid!=Constants.Admin_roleid){
					//过滤掉“管理员入口”这个菜单
					/*for (int i = 0; i < firstjson.size(); i++) {
						JSONObject obj=firstjson.getJSONObject(i);
						String name=(String) obj.opt("menuname");
						if(name.trim().equals("管理员入口")){
							firstjson.remove(i);
							break;
						}
					}*/
					model.addAttribute("isadmin", 1);//不是管理员
				}else{
					model.addAttribute("isadmin", 0);//是管理员
				}
				/*int count=firstjson.size();
				if(firstjson.size()>0){
					for (int i = 0; i <count;  i++) {
						String menuid=firstjson.optJSONObject(i).optString("menuid");
						JSONArray secordjson=gj.loadMenu(menuid,"2");
						if(secordjson.size()>0){
							firstjson.optJSONObject(i).put("secordjson", secordjson);
						}else{
							firstjson.optJSONObject(i).put("secordjson", "");
						}
					}
				}
				model.addAttribute("firstjson", firstjson);*/
				model.addAttribute("username", username);
				model.addAttribute("loginstate", 1);
				
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index/showmain";
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
	
	/**
	 * 退出
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("exit.htm")
	public String exit(HttpServletRequest  req,Model model,HttpSession session) {
		session.removeAttribute("mtecc.session.userid");
		session.removeAttribute("mtecc.session.username");
		return "redirect:noLongin.htm";
	}

}
