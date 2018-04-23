package com.mtecc.rdc.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileDelete {

	public static List<String> fail;

	public static int deletefile(String folder, List<String> path) throws Exception {
		fail = new ArrayList<String>();
		boolean bln = false;
		int count = 0;
		if (folder != null && path != null && path.size() > 0) {
			File file;
			for (int i = 0; i < path.size(); i++) {
				file = new File(folder + path.get(i));
				bln = file.delete();
				if (!bln) {
					count++;
					fail.add(path.get(i));
				}
			}
		}
		return count;
	}

	public static boolean deleteOnefile(String folder, String path) throws Exception {
		fail = new ArrayList<String>();
		boolean bln = false;
		if (folder != null && path != null) {
			File file;
			file = new File(folder + path);
			bln = file.delete();
		}
		return bln;
	}
	
	public static void main(String[] args) {
		try {
			List<String> list = new ArrayList<String>();
			list.add("100005629_0_3");
			deletefile("G:\\apache-tomcat-6.0.41\\webapps\\MEIMS\\recordimgs\\", list);
			//System.out.println(fail.get(0));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
