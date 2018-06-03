package com.mtecc.rdc.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

/**
 * 文件上传工具
 * @author hp
 *
 */

public class FileUploadUtil {

	private static Logger log = Logger.getLogger(FileUploadUtil.class);
	/**
	 * 上传文件方法
	 * @param bs
	 * @param fileName
	 * @return
	 */
	public static boolean uploadPic( byte  []bs, String fileName) {
		FileOutputStream out = null;
		try {
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyyMM");
			String strDate = sf.format(date);
			String savePath = GetUrlUtil.getUrl("save_path");
			
			log.info("***********"+savePath+"***********开始上传*********");
			File file = new File(savePath);
			//判断上传文件的保存目录是否存在
			if (!file.exists() && !file.isDirectory()) {
				System.out.println(savePath+"目录不存在，需要创建");
			//创建目录 
				file.mkdir();
			}

			out = new FileOutputStream(savePath+"//"+fileName);
			try {
				out.write(bs);
				log.info("**********************上传成功***********");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return true;
	}
	// 删除文件
    public static boolean deleteFile(String sPath) {
        boolean flag = false;
        File file = new File(sPath);
        // 路径为文件且不为空则进行删除
        if (file.isFile() && file.exists()) {
            file.delete();
            flag = true;
        }
        return flag;
    }


}
