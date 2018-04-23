package com.mtecc.rdc.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
/**
 * json操作工具类
 * @author liuxizhe
 *
 */
public class JsonAjaxDoneUtil {
	public static final String SUCCESS_CODE="200";
	public static final String FAILED_CODE="300";
	public static final String SUCCESS_MESSAGE="\u64CD\u4f5C\u6210\u529f";//操作成功
	public static final String FAILED_MESSAGE="\u64CD\u4F5C\u5931\u8D25";//操作失败
	public static final String FILETYPE_ERROR="\u4EC5\u652F\u6301\u5BFC\u5165xls\u6216xlsx\u6587\u6863\uFF01";
	public static final String FAILED_MESSAGE_PROCESSING="\u4E0D\u80FD\u5220\u9664\u6B63\u5728\u6267\u884C\u7684\u4EFB\u52A1\uFF01";//不能删除正在执行的任务！
	public static final String SAMENAME_MESSAGE="\u540D\u5B57\u91CD\u590D";//名字重复
	public static final String SAMEOBJ_MESSAGE="\u4E0E\u5DF2\u6709\u8BB0\u5F55\u91CD\u590D\uFF01";//与已有记录重复
	public static final String SAMEOTHERMENU_MESSAGE="\u4E0E\u5DF2\u6709\u5176\u4ED6\u8BB0\u5F55\u540D\u79F0\u91CD\u590D\uFF01";//与已有其他记录重复
	public static final String NOTUPDATE = "\u8BB0\u5F55\u6CA1\u505A\u4FEE\u6539\uFF01";//记录没做修改
	public static final String SAMECONSERV_MESSAGE="IP\u548COfficeType\u4E0E\u5DF2\u6709\u8BB0\u5F55\u91CD\u590D\uFF01";
	public static final String FAILED_MESSAGE_NORMAL="\u4E0D\u80FD\u5BF9\u6B63\u5E38\u72B6\u6001\u7684\u4EFB\u52A1\u8FDB\u884C\u91CD\u8BD5\u64CD\u4F5C\uFF01";//不能对正常状态的任务进行重试操作！
	public static final String FAILED_MESSAGE_NOTWAITSTATE="\u53EA\u80FD\u5BF9\u201C\u7B49\u5F85\u201D\u72B6\u6001\u7684\u8BB0\u5F55\u8FDB\u884C\u64CD\u4F5C\uFF01";//只能对“等待”状态的记录进行操作！
	public static final String CLOSE_CURRENT="closeCurrent";
	public static final String NO_FUNC_OPEN="\u6B64\u529F\u80FD\u6682\u672A\u5F00\u653E\uFF01";
	
	public static final String SAMEUSERLOGNAME="\u4E0E\u5176\u4ED6\u8BB0\u5F55\u767B\u5F55\u540D\u91CD\u590D\uFF01";
	
	public static final String URL_USERLIST="../usermanager/user!findByPager.do";
	public static final String TYPE_FORWARD = "forward";
	
	
	
	
	
	/**
	 * 功能：把对象封装成JSONObject的字符串格式
	 * @author liuxizhe
	 * @param bean
	 * @return
	 */
	public static void setHeadFormatUTF8(HttpServletResponse response){
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
	}
	/**
	 * 功能：把json的字符串写出流
	 * @author liuxizhe
	 * @param bean
	 * @return
	 * @throws IOException 
	 */
	public static void write(HttpServletResponse response, String res) throws IOException{
		PrintWriter out = response.getWriter();
		out.write(res);
		out.close();
	}
	
	/**
	 * 功能：封装成DWZ页面需要的AjaxDone的字符串格式
	 * @author liuxizhe
	 * @param bean
	 * @return
	 */
	public static String getAjaxDoneJsonStr(String statusCode, String message,
			String navTabId, String rel, String callBackType,
			String forwardUrl, String confirmMsg) {
		
		JSONObject jsonObject = new JSONObject().element("statusCode", statusCode!=null?statusCode:"")
				.element("message", message!=null?message:"")
				.element("navTabId", navTabId!=null?navTabId:"")
				.element("rel", rel!=null?rel:"")
				.element("callbackType", callBackType!=null?callBackType:"")
				.element("forwardUrl", forwardUrl!=null?forwardUrl:"")
				.element("confirmMsg", confirmMsg!=null?confirmMsg:"");
		return JSONSerializer.toJSON(jsonObject).toString();
	}
	

	/**
	 * 例子：
	 * 保存新增网站
	 * @author liuxizhe
	 * @return
	 */
//	public String websiteAdd() {
//		JsonAjaxDoneUtil.setHeadFormatUTF8(response);//设置头信息
//		String opercode = null;
//		String opermessage = null;
//		SysWebsite wsTemp = null;
//		try {
//			//判断网站名是否重复，重复则在页面中提示
//			wsTemp = websiteService.getWebsiteByWsName(website.getWsname().trim());
//			if(wsTemp == null) {
//				opercode = JsonAjaxDoneUtil.SUCCESS_CODE;
//				opermessage = JsonAjaxDoneUtil.SUCCESS_MESSAGE;
//				websiteService.add(website);
//			} else {
//				opercode = JsonAjaxDoneUtil.FAILED_CODE;
//				opermessage = JsonAjaxDoneUtil.SAMEWEBSITENAME;
//			}
//		} catch (Exception e) {
//			opercode = JsonAjaxDoneUtil.FAILED_CODE;
//			opermessage = JsonAjaxDoneUtil.FAILED_MESSAGE;
//			e.printStackTrace();
//		}
//		String saveInfo = JsonAjaxDoneUtil.getAjaxDoneJsonStr(
//				opercode,
//				opermessage, "website_manage", null,
//				JsonAjaxDoneUtil.CLOSE_CURRENT,
//				JsonAjaxDoneUtil.URL_WEBSITELIST, null);
//		request.setAttribute("jsonRes", saveInfo);
//		return SUCCESS;
//	}
}
