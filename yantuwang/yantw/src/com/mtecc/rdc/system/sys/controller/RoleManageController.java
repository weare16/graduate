package com.mtecc.rdc.system.sys.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mtecc.rdc.pojo.SysGroup;
import com.mtecc.rdc.pojo.SysGroupMenu;
import com.mtecc.rdc.pojo.SysMenu;
import com.mtecc.rdc.pojo.SysOrganization;
import com.mtecc.rdc.pojo.SysUserGroup;
import com.mtecc.rdc.system.sys.condition.RoleManageCondition;
import com.mtecc.rdc.system.sys.service.SysService;
import com.mtecc.rdc.util.EmptyUtil;
import com.mtecc.rdc.util.JsonAjaxDoneUtil;

/**
 * 用户角色管理
 * @author lxm
 * 
 */
@Controller
@RequestMapping("/system/rolemanage/")
public class RoleManageController {

	@Autowired
	private SysService sysService;

	/**
	 * 跳转至列表
	 * @author lxm
	 * 
	 */
	@RequestMapping("toList.htm")
	public String toLogin(HttpServletRequest  req,HttpServletResponse response,Model model) {
			String result="";
			result=req.getParameter("groupResult");
			model.addAttribute("groupResult", result);
		return "system/rolemanage/rolelist";
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
			RoleManageCondition  condition) {
		JsonAjaxDoneUtil.setHeadFormatUTF8(response);
		JSONObject obj=new JSONObject();
		try {
			List<SysGroup>  list=sysService.queryGroup(condition, page, limit);
			int  count=sysService.count(condition);
			//对字段是业务字典的作处理
			for (int i = 0; i < list.size(); i++) {
				String isactive=list.get(i).getIsactive();
				if(null!=isactive && isactive.equals("0")){
					list.get(i).setIsactive("可用");
				}else{
					list.get(i).setIsactive("禁用");
				}
			}
			obj.put("data", list);
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
	 * 跳转至添加用户组
	 */
	@RequestMapping("toAdd.htm")
	public String toAdd(HttpServletRequest  req,HttpServletResponse response,Model model){
		return "system/rolemanage/roleadd";
	}
	/**
	 * 添加用户组
	 */
	@RequestMapping("Add.htm")
	public void  Add(SysGroup group,HttpServletRequest  req,HttpServletResponse response,Model model){
			try {
				if(null!=group){
				Integer goroupid=sysService.saveGroup(group);
				JSONObject  obj=new JSONObject();
				String result="";
				if(!EmptyUtil.isEmpty(goroupid)){//成功
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
	 * 跳转至编辑用户组
	 */
	@RequestMapping("toEdit.htm")
	public String toEdit(HttpServletRequest  req,HttpServletResponse response,Integer usergpid,Model model){
		try {
			SysGroup  group=sysService.getGroupById(usergpid);
			model.addAttribute("group", group);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "system/rolemanage/roleedit";
	}
	/**
	 * 编辑用户组
	 */
	@RequestMapping("Edit.htm")
	public void Edit(HttpServletRequest  req,HttpServletResponse response,SysGroup group,Model model){
		try {
			boolean falg=sysService.updateGroup(group);
			JSONObject  obj=new JSONObject();
			String result="";
			if(falg){//成功
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
		String result="200";//成功
		try {
			JSONArray array=JSONArray.fromObject(deleteStr);
			for (int i = 0; i < array.size(); i++) {
				Integer   usergpid=(Integer) array.getJSONObject(i).get("usergpid");
				SysGroup  group=sysService.getGroupById(usergpid);
				boolean  flag=sysService.deleteGroup(group);
				if(!flag){//失败
					result="500";
					break;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/system/rolemanage/toList.htm?groupResult="+result;
	}
	/**
	 * 跳转至绑定菜单
	 *
	 */
	@RequestMapping("toBindMenu.htm")
	public String toBindMenu(Integer usergpid,HttpServletRequest  req,HttpServletResponse response,Model model){
		
		try {
			//获取到所有菜单
			List<SysMenu>  menuList=sysService.getMenuByLevel("1");
			getSonlist(menuList);
			//获取当前用户组所绑定的菜单
			List<SysGroupMenu> gmlist=sysService.getMneuByGroupId(usergpid);
			String arr="";
			for (int i = 0; i < gmlist.size(); i++) {
				if(i==gmlist.size()-1){
					arr=arr+gmlist.get(i).getMenuid().getMenuid();
				}else{
					arr=arr+gmlist.get(i).getMenuid().getMenuid()+",";
				}
			}
			model.addAttribute("menuList", menuList);
			model.addAttribute("gmarr", arr);
			model.addAttribute("usergpid", usergpid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "system/rolemanage/bindmenu";
	}
	
	   //循环获取子菜单
		public List<SysMenu>  getSonlist(List<SysMenu>  menuList){
			 try {
				if(menuList.size()>0){
					 for (int i = 0; i < menuList.size(); i++) {
						    Integer menuid=menuList.get(i).getMenuid();
							List<SysMenu> sonList=sysService.getSonMenu(menuid);
							if(sonList.size()>0){
								getSonlist(sonList);
							}
							menuList.get(i).setSonlist(sonList);
					      }
				}
			  } catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			return menuList;
		}
		/**
		 * 绑定菜单
		 *
		 */
		@RequestMapping("bindMenu.htm")
		public void bindMenu(HttpServletRequest  req,HttpServletResponse response,int groupid,int[] menuarr,Model model){
			try {
				JSONObject  obj=new JSONObject();
				String result="200";//成功
				//删除当前用户所绑定的菜单
				boolean deleteflag=sysService.deleteMenuByGroupId(groupid);
				if(deleteflag){
					//重新绑定用户组
					if(menuarr.length>0){
						 for (int i = 0; i < menuarr.length; i++) {
							  SysGroupMenu gm=new SysGroupMenu();
							  gm.setGroupid(groupid);
							  gm.setMenuid(new SysMenu(menuarr[i]));
						      Integer gmid=sysService.saveGropMenu(gm);
						      if(EmptyUtil.isEmpty(gmid)){
						    	  result="500";//绑定菜单失败
						    	  break;
						      }
						 }
					      
					}
				}else{
					result="500";//绑定菜单失败
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
