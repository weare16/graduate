package com.mtecc.rdc.system.sys.controller;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mtecc.rdc.goodsinfo.condition.goodsCondition;
import com.mtecc.rdc.pojo.Goods;
import com.mtecc.rdc.pojo.SysGroup;
import com.mtecc.rdc.pojo.SysOrganization;
import com.mtecc.rdc.pojo.SysUser;
import com.mtecc.rdc.system.sys.condition.UserManageCondition;
import com.mtecc.rdc.system.sys.service.SysService;
import com.mtecc.rdc.util.EmptyUtil;
import com.mtecc.rdc.util.JsonAjaxDoneUtil;

/**
 * 机构管理
 * @author lxm
 * 
 */
@Controller
@RequestMapping("/system/orgmanage/")
public class OrgManageController {

	@Autowired
	private SysService sysService;

	/**
	 * 获取机构数据
	 * @author lxm
	 * 
	 */
	@RequestMapping("toList.htm")
	public String toLogin(HttpServletRequest  req,HttpServletResponse response,Model model) {
		try {
				List<SysOrganization> orglist=sysService.getSonOrg("ROOT");
				getSonlist(orglist);//循环遍历取出子机构
			    JSONArray array=JSONArray.fromObject(orglist);
				model.addAttribute("orglist",array);
				//获取所有用户
				List<SysUser> ulist=sysService.getAllUser();
				model.addAttribute("ulist",ulist);
			
			String result="";
			result=req.getParameter("result");
			model.addAttribute("result", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "system/orgmanage/list";
	}
   //循环获取子机构
	public List<SysOrganization>  getSonlist(List<SysOrganization> orglist){
		 try {
			if(orglist.size()>0){
				 for (int i = 0; i < orglist.size(); i++) {
					    String orgid=orglist.get(i).getOrgid()+"";
						List<SysOrganization> sonList=sysService.getSonOrg(orgid);
						if(sonList.size()>0){
							getSonlist(sonList);
						}
						orglist.get(i).setSonorglist(sonList);
				      }
			}
		  } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return orglist;
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
			 Integer orgid) {
		JsonAjaxDoneUtil.setHeadFormatUTF8(response);
		JSONObject obj=new JSONObject();
		try {
			UserManageCondition condition=new UserManageCondition();
			condition.setOrgid(orgid);
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
	 * 跳转至添加机构
	 */
	@RequestMapping("toAdd.htm")
	public String toAdd(HttpServletRequest  req,HttpServletResponse response,Model model){
		//获取到所有机构
		try {
			List<SysOrganization>  list=sysService.getAllOrg();
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "system/orgmanage/add";
	}
	/**
	 * 添加机构
	 */
	@RequestMapping("Add.htm")
	public void  Add(SysOrganization org,HttpServletRequest  req,HttpServletResponse response,Model model){
			try {
				if(null!=org){
				//手动生成机构ID
				Calendar c=Calendar.getInstance();
				String year=( c.get(Calendar.YEAR)+"").substring(2);
				String month= c.get(Calendar.MONTH)+ 1+"";
				String day=c.get(Calendar.DAY_OF_MONTH)+"";
				String minute = c.get(Calendar.MINUTE)+"";
				String secored=c.get(Calendar.SECOND)+"";
				String orgid=year+month+day+minute+secored;
				org.setOrgid(Integer.parseInt(orgid));
				//根据父机构给予当前新增机构等级
				if(org.getParentorg().equals("ROOT")){
					org.setOrglevel("1");
				}else{
					//根据父机构自动加一级
					SysOrganization parentOrg=sysService.getOrgById(Integer.parseInt(org.getParentorg()));
					String parentOrgLevel=parentOrg.getOrglevel();
					String level=(Integer.parseInt(parentOrgLevel)+1)+"";
					org.setOrglevel(level);
				}
				boolean flag=sysService.save(org);
				JSONObject  obj=new JSONObject();
				String result="";
				if(flag){//成功
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
	 * 跳转至编辑
	 */
	@RequestMapping("toEdit.htm")
	public String toEdit(HttpServletRequest  req,HttpServletResponse response,Integer orgid,Model model){
		try {
			List<SysOrganization>  list=sysService.getAllOrg();
			model.addAttribute("list", list);
			SysOrganization  org=sysService.getOrgById(orgid);
			model.addAttribute("org", org);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "system/orgmanage/edit";
	}
	/**
	 * 编辑
	 */
	@RequestMapping("Edit.htm")
	public void Edit(HttpServletRequest  req,HttpServletResponse response,SysOrganization org,Model model){
		try {
			//根据父机构给予当前新增机构等级
			if(org.getParentorg().equals("ROOT")){
				org.setOrglevel("1");
			}else{
				//根据父机构自动加一级
				SysOrganization parentOrg=sysService.getOrgById(Integer.parseInt(org.getParentorg()));
				String parentOrgLevel=parentOrg.getOrglevel();
				String level=(Integer.parseInt(parentOrgLevel)+1)+"";
				org.setOrglevel(level);
			}
			boolean falg=sysService.update(org);
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
	public String delete(HttpServletRequest  req,HttpServletResponse response,Integer orgid,Model model){
		String result="200";//成功
		try {
				SysOrganization  org=sysService.getOrgById(orgid);
				//判断当前机构下是否有用户
				List<SysUser> ulist=sysService.getOrgUser(orgid);
				if(ulist.size()>0){
					result="501";//机构存在用户，无法删除！
					return "redirect:/system/orgmanage/toList.htm?result="+result;
				}else{
					boolean  flag=sysService.delete(org);
					if(!flag){//失败
						result="500";
					}
				}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/system/orgmanage/toList.htm?result="+result;
	}
	
	
	
	
	
	
	
	
	
	
}
