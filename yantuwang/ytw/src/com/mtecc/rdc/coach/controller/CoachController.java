package com.mtecc.rdc.coach.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mtecc.rdc.coach.service.CoachService;
import com.mtecc.rdc.pojo.Coach;
import com.mtecc.rdc.pojo.User;
import com.mtecc.rdc.system.login.service.UserService;
import com.mtecc.rdc.util.Base64;
import com.mtecc.rdc.util.Constants;
import com.mtecc.rdc.util.EmptyUtil;
import com.mtecc.rdc.util.FileUploadUtil;
import com.mtecc.rdc.util.GetUrlUtil;
import com.mtecc.rdc.util.JsonAjaxDoneUtil;

/**
 * 登录页面
 * 
 * @author yxf
 * 
 */
@Controller
@RequestMapping("/pages/coach/")
public class CoachController {

	@Autowired
	private CoachService cService;

	/**
	 * 跳转至主页面
	 * 
	 * @author yxf
	 * 
	 */
	@RequestMapping("toAdd.htm")
	public String topage(HttpSession session, HttpServletRequest req,
			Model model) {
		Integer userid = (Integer) session.getAttribute("mtecc.session.userid");
		if (!EmptyUtil.isEmpty(userid)) {
			model.addAttribute("loginstate", 1);// 已登录
			try {
				String str="";
				User u = cService.getUserById(userid);
				//取出照片
				if(!EmptyUtil.isEmpty(u.getImage())){
					String path = GetUrlUtil.getUrl("img_ip")+File.separator+u.getImage();
					u.setImage(path);
					List<Coach> list=cService.getCoachByUser(u.getUserid());
					
					if(list.size()>0){
						for (int i = 0; i < list.size(); i++) {
							if(i==list.size()-1){
								str=str+list.get(i).getCoachtype();
							}else{
								str=str+list.get(i).getCoachtype()+",";
							}
						}
						
					}
				}
				
				model.addAttribute("coachtype", str);
				model.addAttribute("user", u);

				if (userid != Constants.Admin_roleid) {
					model.addAttribute("isadmin", 1);// 不是管理员
				} else {
					model.addAttribute("isadmin", 0);// 是管理员
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			model.addAttribute("loginstate", 0);// 未登录
		}

		return "coach/add";
	}

	/**
	 * 保存信息
	 * 
	 * @param session
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("Add.htm")
	public void Add(HttpSession session, HttpServletRequest req,HttpServletResponse  reb ) {
		int result=200;
		try {
			 User u=cService.getUserById(Integer.parseInt(req.getParameter("userid")));
			 if(null!=u){
				 Integer userid=Integer.parseInt(req.getParameter("userid"));
				 u.setUsername(req.getParameter("username") );
				 u.setUserid(userid);
				 u.setAge(req.getParameter("age"));
				 u.setSex(req.getParameter("sex"));
				 u.setTelphone(req.getParameter("telphone"));
				 u.setQq(req.getParameter("qq"));
				 u.setWechat(req.getParameter("wechat"));
				 u.setStudentcardid(req.getParameter("studentcardid"));
				 u.setCollege(req.getParameter("college"));
				 u.setDiscipline(req.getParameter("discipline"));
				 u.setIdentify(req.getParameter("identify"));
				 u.setAlipay(req.getParameter("alipay"));
				 u.setIntroduce(req.getParameter("introduce"));
				 u.setImage(req.getParameter("image"));
		    	boolean flag=cService.updateUser(u);
			    if(flag){
			    	List<Coach> list=cService.getCoachByUser(userid);
			    			if(list.size()>0){
			    				//先删后赠
			    				flag=cService.deleteCoachList(list);
			    				if(flag){
			    					for (int i = 1; i < 9; i++) {
				    					String coachtype=req.getParameter("coachtype["+i+"]");
				    					if(!EmptyUtil.isEmpty(coachtype)){
				    						Coach c =new Coach();
					    					c.setUserid(u.getUserid());
					    					c.setCoachtype(coachtype);
					    					Integer  cid=cService.saveCoach(c);
					    					if(EmptyUtil.isEmpty(cid)){
					    						result=500;
					    						break;
					    					}
				    					}
				    				}
			    				}else{
			    					result=500;
			    				}
			    				
			    			}else{
			    				for (int i = 1; i < 9; i++) {
			    					String coachtype=req.getParameter("coachtype["+i+"]");
			    					if(!EmptyUtil.isEmpty(coachtype)){
			    						Coach c =new Coach();
				    					c.setUserid(u.getUserid());
				    					c.setCoachtype(coachtype);
				    					Integer  cid=cService.saveCoach(c);
				    					if(EmptyUtil.isEmpty(cid)){
				    						result=500;
				    						break;
				    					}
			    					}
			    				}
			    			}
				
			}else{
				result=500;
			}
			 }else{
				 throw  new Exception("当前用户ID不存在！请检查！");
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
	/**
	 * 文件上传
	 * @param session
	 * @param req
	 * @param reb
	 * @param u
	 */
	@RequestMapping("/fileUpload.htm")
	public void upload(HttpServletRequest request,
			HttpServletResponse response, @RequestParam MultipartFile files) {
		JsonAjaxDoneUtil.setHeadFormatUTF8(response);
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			
			String imageName = System.currentTimeMillis() + "."
							+ files.getOriginalFilename().split("[.]")[1];
					InputStream in = files.getInputStream();
					byte[] bs = new byte[in.available()];
					in.read(bs);
					in.close();
				    boolean flag=FileUploadUtil.uploadPic(bs, imageName);
				    if(flag){
				    	map.put("result", 200);
				    	map.put("imageName", imageName);
				    }else{
				    	map.put("result", 500);
				    }
					JSONObject jsonObject = JSONObject.fromObject(map);
					JsonAjaxDoneUtil.write(response, jsonObject.toString());
 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 文件下载
	 * @param session
	 * @param req
	 * @param reb
	 * @param u
	 */
	@RequestMapping("/downfile.htm")
	public void downfile(HttpServletResponse response,Integer userid){
		JsonAjaxDoneUtil.setHeadFormatUTF8(response);
		try{
			User  u=cService.getUserById(userid);
			String path = GetUrlUtil.getUrl("save_path")+File.separator+u.getImage();

			File file = new File(path);
			InputStream inStream = new FileInputStream(file);
			response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(u.getImage(),"UTF-8"));  
			 // 循环取出流中的数据  
	        byte[] b = new byte[100];  
	        int len;  

	        while ((len = inStream.read(b)) > 0){
	        	response.getOutputStream().write(b, 0, len);  
	        }
	        inStream.close(); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
	
	
}