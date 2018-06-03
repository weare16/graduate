package com.mtecc.rdc.system.menu.controller;

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

import com.mtecc.rdc.pojo.SysMenu;
import com.mtecc.rdc.system.login.service.UserService;
import com.mtecc.rdc.system.menu.condition.MenuManageCondition;
import com.mtecc.rdc.system.menu.service.SysService;
import com.mtecc.rdc.util.Base64;
import com.mtecc.rdc.util.EmptyUtil;
import com.mtecc.rdc.util.JsonAjaxDoneUtil;
import com.mtecc.rdc.util.MD5;

/**
 * 系统菜单管理
 * @author lxm
 * 
 */
@Controller
@RequestMapping("/system/menumanage/")
public class MenuManageController {

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
			model.addAttribute("result", result);
		return "system/menumanage/menulist";
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
			MenuManageCondition  condition) {
		JsonAjaxDoneUtil.setHeadFormatUTF8(response);
		JSONObject obj=new JSONObject();
		try {
			List<SysMenu>  list=sysService.queryMenu(condition, page, limit);
			int  count=sysService.count(condition);
			//重新封装数据
			JSONArray array=new JSONArray();
			for (int i = 0; i < list.size(); i++) {
				JSONObject ob=new JSONObject();
				Integer pmenuid=list.get(i).getPmenuid();
				SysMenu m=sysService.getMenuById(pmenuid);
				if(!EmptyUtil.isEmpty(m) ){
					ob.put("pmenu", m.getMenuname());
				}else{
					ob.put("pmenu","无");
				}
				ob.put("menuname", list.get(i).getMenuname());
				ob.put("menuurl", list.get(i).getMenuurl());
				ob.put("menuid", list.get(i).getMenuid());
				String menulv=list.get(i).getMenulv();
				if(menulv.equals("1")){
					ob.put("menulv", "一级菜单");
				}else if(menulv.equals("2")){
					ob.put("menulv", "二级菜单");
				}
				String isactive=list.get(i).getIsactive();
				if(EmptyUtil.isEmpty(isactive)){
					ob.put("isactive", "禁用");
				}else{
					ob.put("isactive", "可用");
				}
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
	 * 跳转至添加
	 */
	@RequestMapping("toAdd.htm")
	public String toAdd(HttpServletRequest  req,HttpServletResponse response,Model model){
		
		try {
			//获取到所有菜单
			List<SysMenu>  menuList=sysService.getAllMneu();
			model.addAttribute("menuList", menuList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "system/menumanage/menuadd";
	}
	/**
	 * 添加
	 */
	@RequestMapping("Add.htm")
	public void  Add(SysMenu menu,HttpServletRequest  req,HttpServletResponse response,Model model){
			try {
				if(null!=menu){
				JSONObject  obj=new JSONObject();
				String result="";
				Integer menuid=sysService.saveMenu(menu);
				if(!EmptyUtil.isEmpty(menuid)){//成功
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
	 * 跳转至修改
	 */
	@RequestMapping("toEdit.htm")
	public String toEdit(HttpServletRequest  req,HttpServletResponse response,Integer menuid,Model model){
		try {
			SysMenu  menu=sysService.getMenuById(menuid);
			//获取到所有菜单
			List<SysMenu>  menuList=sysService.getAllMneu();
			model.addAttribute("menuList", menuList);
			model.addAttribute("menu", menu);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "system/menumanage/menuedit";
	}
	/**
	 * 编辑
	 */
	@RequestMapping("Edit.htm")
	public void Edit(HttpServletRequest  req,HttpServletResponse response,SysMenu menu,Model model){
		try {
			JSONObject  obj=new JSONObject();
			String result="";
			boolean  flag =sysService.updateMenu(menu);
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
				Integer   menuid=(Integer) array.getJSONObject(i).get("menuid");
				SysMenu  menu=sysService.getMenuById(menuid);
				//删除
				boolean  flag=sysService.deleteMenu(menu);
				if(!flag ){//失败
					result="500";
				}
			}
			model.addAttribute("result", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/system/menumanage/toList.htm";
	}
	
	
	
	
	
	
	
	
	
	
	
}
