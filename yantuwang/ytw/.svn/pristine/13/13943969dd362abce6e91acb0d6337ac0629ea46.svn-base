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

import com.mtecc.rdc.pojo.Goods;
import com.mtecc.rdc.pojo.SysDictionary;
import com.mtecc.rdc.pojo.SysGroup;
import com.mtecc.rdc.pojo.SysGroupMenu;
import com.mtecc.rdc.pojo.SysMenu;
import com.mtecc.rdc.pojo.SysOrganization;
import com.mtecc.rdc.pojo.SysUserGroup;
import com.mtecc.rdc.system.sys.condition.DicManageCondition;
import com.mtecc.rdc.system.sys.condition.RoleManageCondition;
import com.mtecc.rdc.system.sys.service.SysService;
import com.mtecc.rdc.util.EmptyUtil;
import com.mtecc.rdc.util.JsonAjaxDoneUtil;

/**
 * 业务字典管理
 * @author lxm
 * 
 */
@Controller
@RequestMapping("/system/dicmanage/")
public class DictionaryManageController {

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
			result=req.getParameter("result");
			model.addAttribute("result", result);
		return "system/dicmanage/dicmain";
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
			DicManageCondition  condition) {
		JsonAjaxDoneUtil.setHeadFormatUTF8(response);
		JSONObject obj=new JSONObject();
		try {
			List<SysDictionary>  list=sysService.queryDic(condition, page, limit);
			int  count=sysService.count(condition);
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
	 * 跳转至添加
	 */
	@RequestMapping("toAdd.htm")
	public String toAdd(HttpServletRequest  req,HttpServletResponse response,Model model){
		return "system/dicmanage/dicadd";
	}
	/**
	 * 添加
	 */
	@RequestMapping("Add.htm")
	public void  Add(String busintypename,String busintypeid, int [] BUSINIDarr,  String [] BUSINNAMEarr,String [] statusArr, HttpServletRequest  req,HttpServletResponse response,Model model){
			try {
				JSONObject  obj=new JSONObject();
				String result="200";
				int length=BUSINIDarr.length;
				if(length>0){
					for (int i = 0; i < length; i++) {
						SysDictionary  dic=new SysDictionary();
						dic.setBUSINID(BUSINIDarr[i]);
						dic.setBUSINNAME(BUSINNAMEarr[i]);
						dic.setBusintypename(busintypename);
						dic.setBusintypeid(busintypeid);
						dic.setStatus(statusArr[i]);
						Integer did=sysService.saveDic(dic);
						if(EmptyUtil.isEmpty(did)){
							result="500";
							break;
						}
						
					}
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
	 * 跳转至编辑
	 */
	@RequestMapping("toEdit.htm")
	public void toEdit(HttpServletRequest  req,HttpServletResponse response,String  busintypeid,Model model){
		JsonAjaxDoneUtil.setHeadFormatUTF8(response);
		try {
			List<SysDictionary>  dicList=sysService.queryDicByType(busintypeid);
			JSONArray array=JSONArray.fromObject(dicList);
			PrintWriter out = response.getWriter();
			System.out.println(array.toString());
			out.print(array.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	/**
	 * 编辑
	 */
	@RequestMapping("Edit.htm")
	public void Edit(String busintypename,String busintypeid, int [] BUSINIDarr,  String [] BUSINNAMEarr,String [] statusArr,HttpServletRequest  req,HttpServletResponse response){
		try {
			JSONObject  obj=new JSONObject();
			String result="200";
			//先删后增
			boolean  flag=sysService.deleteDicByType(busintypeid);
			int length=BUSINIDarr.length;
			if(length>0 && flag){
				for (int i = 0; i < length; i++) {
					SysDictionary  dic=new SysDictionary();
					dic.setBUSINID(BUSINIDarr[i]);
					dic.setBUSINNAME(BUSINNAMEarr[i]);
					dic.setBusintypename(busintypename);
					dic.setBusintypeid(busintypeid);
					dic.setStatus(statusArr[i]);
					Integer did=sysService.saveDic(dic);
					if(EmptyUtil.isEmpty(did)){
						result="500";
						break;
					}
					
				}
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
	 * 查看
	 */
	@RequestMapping("look.htm")
	public String look(HttpServletRequest  req,HttpServletResponse response,String  busintypeid,Model model){
		try {
			List<SysDictionary>  dicList=sysService.queryDicByType(busintypeid);
			model.addAttribute("dicList", dicList);
			model.addAttribute("name", dicList.get(0).getBusintypename());
			model.addAttribute("typeid", dicList.get(0).getBusintypeid());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "system/dicmanage/diclook";
	}
	
	
	
	
	
	
}
