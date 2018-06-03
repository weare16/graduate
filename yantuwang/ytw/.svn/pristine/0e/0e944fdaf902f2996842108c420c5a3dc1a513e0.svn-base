package com.mtecc.rdc.goodsinfo.contrller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.mtecc.rdc.goodsinfo.condition.goodsCondition;
import com.mtecc.rdc.goodsinfo.service.goodsService;
import com.mtecc.rdc.pojo.Goods;
import com.mtecc.rdc.util.EmptyUtil;
import com.mtecc.rdc.util.JsonAjaxDoneUtil;

/**
 * 商品管理
 * 
 * @author lxm
 * 
 */
@Controller
@RequestMapping("/pages/goods/")
public class goodsController {

	@Autowired
	private goodsService gService;

	/**
	 * 跳转至初始列表
	 * 
	 * @author lxm
	 * 
	 */
	@RequestMapping("list.htm")
	public String tolist(HttpServletRequest  req,HttpServletResponse response,Model model){
		String result="";
		result=req.getParameter("result");
		model.addAttribute("result", result);
		return "goods/list";
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
			 String goodsname,String number,String barcode) {
		JsonAjaxDoneUtil.setHeadFormatUTF8(response);
		JSONObject obj=new JSONObject();
		try {
			goodsCondition  condition=new goodsCondition();
			condition.setBarcode(barcode);
			condition.setName(goodsname);
			condition.setNumber(number);
			List<Goods>  list=gService.queryGoods(condition, page, limit);
			//对字段是业务字典的作处理
			for (int i = 0; i < list.size(); i++) {
				String c=list.get(i).getCategory();
				String stockwarn=list.get(i).getStockwarn();
				String qualitywarn=list.get(i).getQualitywarn();
				String sugg=list.get(i).getSuggestion();
				if(c.equals("01")){
					list.get(i).setCategory("饮料");
				}else if(c.equals("02")){
					list.get(i).setCategory("干果");
				}else if(c.equals("05")){
					list.get(i).setCategory("膨化食物");
				}
				if(null==stockwarn){
					list.get(i).setStockwarn("未设置");
				}else{
					list.get(i).setStockwarn("已设置");
				}
				if(null==qualitywarn){
					list.get(i).setQualitywarn("未设置");
				}else{
					list.get(i).setQualitywarn("已设置");
				}
				if(EmptyUtil.isEmpty(sugg)){
					list.get(i).setSuggestion("未审核");
				}else{
					list.get(i).setSuggestion("已审核");
				}
				
			}
            int  count=gService.count(condition);
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
	 * 跳转至查询
	 */
	@RequestMapping("goSearch.htm")
	public String  goSearch(){
		return "goods/search";
		
	}
	/**
	 * 跳转至添加商品
	 */
	@RequestMapping("toAdd.htm")
	public String toAdd(HttpServletRequest  req,HttpServletResponse response,Model model){
		return "goods/add";
	}
	/**
	 * 添加商品
	 */
	@RequestMapping("Add.htm")
	public void  Add(Goods goods,HttpServletRequest  req,HttpServletResponse response,Model model){
			try {
				if(null!=goods){
				//判断是否开启预警
				Integer goodsid=gService.save(goods);
				JSONObject  obj=new JSONObject();
				String result="";
				if(!EmptyUtil.isEmpty(goodsid)){//成功则跳转到列表
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
				}
			} catch (Exception e) {//失败则跳转到添加页面
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	/**
	 * 跳转至编辑商品
	 */
	@RequestMapping("toEdit.htm")
	public String toEdit(HttpServletRequest  req,HttpServletResponse response,Integer goodsid,Model model){
		try {
			Goods  goods=gService.getObjectById(goodsid);
			model.addAttribute("goods", goods);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "goods/edit";
	}
	/**
	 * 编辑商品
	 */
	@RequestMapping("Edit.htm")
	public void Edit(HttpServletRequest  req,HttpServletResponse response,Goods goods,Model model){
		try {
			boolean  flag =gService.update(goods);
			JSONObject  obj=new JSONObject();
			String result="";
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
	 * 查看商品
	 */
	@RequestMapping("look.htm")
	public String look(HttpServletRequest  req,HttpServletResponse response,Integer goodsid,Model model){
		try {
			Goods  goods=gService.getObjectById(goodsid);
			model.addAttribute("goods", goods);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "goods/look";
	}
	/**
	 * 删除商品
	 */
	@RequestMapping("delete.htm")
	public String delete(HttpServletRequest  req,HttpServletResponse response,String deleteStr,Model model){
		try {
			String result="200";//成功
			JSONArray array=JSONArray.fromObject(deleteStr);
			for (int i = 0; i < array.size(); i++) {
				Integer   goodsid=(Integer) array.getJSONObject(i).get("goodsid");
				Goods  goods=gService.getObjectById(goodsid);
				boolean  flag=gService.delete(goods);
				if(!flag){//失败
					result="500";
					break;
				}
			}
			model.addAttribute("result", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/pages/goods/list.htm";
	}
	/**
	 * 跳转至审核商品
	 */
	@RequestMapping("toAudit.htm")
	public String toAudit(String auditStr,HttpServletRequest  req,HttpServletResponse response,Model model,HttpSession session){
		try {
			Integer userid=(Integer) session.getAttribute("mtecc.session.userid");
			String username=(String) session.getAttribute("mtecc.session.username");
			SimpleDateFormat  sdf=new SimpleDateFormat("yyyy年MM月dd日  HH时mm分ss秒");
			String time=sdf.format(new Date());
			model.addAttribute("auditStr", auditStr);
			model.addAttribute("userid", userid);
			model.addAttribute("username", username);
			model.addAttribute("time", time);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "goods/audit";
	}
	/**
	 * 跳转至审核商品
	 */
	@RequestMapping("audit.htm")
	public String audit(Model model,HttpServletRequest  req,HttpServletResponse response,Integer auditStr,String auditperson,String suggestion){
		try {
			   String result="200";//成功
				Goods  goods=gService.getObjectById(auditStr);
				goods.setAuditperson(auditperson);
				goods.setAudittime(new Date());
				goods.setSuggestion(suggestion);
				boolean  flag=gService.update(goods);
				if(!flag){//失败
					result="500";
				}
				model.addAttribute("result", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/pages/goods/list.htm";
	}
	/**
	 * 
	 * @author lxm
	 * 
	 */
	@RequestMapping("error.htm")
	public String error(HttpServletRequest  req,HttpServletResponse response,Model model){
		return "goods/error";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
