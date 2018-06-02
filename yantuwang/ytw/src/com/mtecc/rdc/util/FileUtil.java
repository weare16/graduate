package com.mtecc.rdc.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;

/**
 * 本类是文件工具类，主要包括对文件的各种操作、readFromFile方法的功能是从文件中读数据；isFileExists方法的功能是 判断文件是否存在；
 * deleteFile方法的功能是删除文件
 * ；fileToVector方法的功能是将文件中内容转换城vecotr；vectorToFile方法的功能是将vector转换成文件；
 * @author liu
 */
public class FileUtil {

	private DataOutputStream dos;
	private static final int BUFFER_SIZE = 16 * 1024;

	/**
	 * 向文件中写数据
	 * 
	 * @param fileName
	 *            文件的名称
	 * @param dataLine
	 *            写入的字符串
	 * @param isAppendMode
	 *            如果为 true，则将字节写入文件末尾处，而不是写入文件开始处
	 * @param isNewLine
	 *            是否从新的行开始写入。
	 * @return boolean 是否操作成功（若操作成功返回true，否则返回false）
	 */
	public boolean writeToFile(String fileName, String dataLine,
			boolean isAppendMode, boolean isNewLine) {
		if (isNewLine) {
			dataLine = "\n" + dataLine;
		}
		try {
			File outFile = new File(fileName);
			if (isAppendMode) {
				dos = new DataOutputStream(new FileOutputStream(fileName, true));
			} else {
				dos = new DataOutputStream(new FileOutputStream(outFile));
			}
			dos.writeBytes(dataLine);
			dos.close();
		} catch (FileNotFoundException ex) {
			return (false);
		} catch (IOException ex) {
			return (false);
		}
		return (true);
	}

	/**
	 * 从文件中读数据
	 * 
	 * @param fileName
	 *            文件的名称
	 * @return String 从文件中读出的字符串
	 */
	public String readFromFile(String fileName) {
		String DataLine = "";
		try {
			File inFile = new File(fileName);
			BufferedReader br = new BufferedReader(new InputStreamReader(
					new FileInputStream(inFile)));
			DataLine = br.readLine();
			br.close();
		} catch (FileNotFoundException ex) {
			return (null);
		} catch (IOException ex) {
			return (null);
		}
		return (DataLine);
	}

	/**
	 * 判断文件是否存在
	 * 
	 * @param fileName
	 *            文件的名称
	 * @return boolean 是否存在 （若存在返回true，否则返回false）
	 */
	public boolean isFileExists(String fileName) {
		File file = new File(fileName);
		return file.exists();
	}

	/**
	 * 删除文件
	 * 
	 * @param fileName
	 *            文件的名称
	 * @return 是否删除（若删除返回true，否则返回false）
	 */
	public boolean deleteFile(String fileName) {
		File file = new File(fileName);
		return file.delete();
	}

	/**
	 * 将文件中内容转换成vecotr
	 * 
	 * @param fileName
	 *            文件的名称
	 * @return Vector 文件中内容转换后的容器
	 */
	@SuppressWarnings("unchecked")
	public Vector fileToVector(String fileName) {
		Vector v = new Vector();
		String inputLine;
		try {
			File inFile = new File(fileName);
			BufferedReader br = new BufferedReader(new InputStreamReader(
					new FileInputStream(inFile)));
			while ((inputLine = br.readLine()) != null) {
				v.addElement(inputLine.trim());
			}
			br.close();
		} catch (FileNotFoundException ex) {
			//
		} catch (IOException ex) {
			//
		}
		return (v);
	}

	/**
	 * 将vector转换成文件
	 * 
	 * @param v
	 *            被转换的vector
	 * @param fileName
	 *            文件的名称
	 */
	@SuppressWarnings("unchecked")
	public void vectorToFile(Vector v, String fileName) {
		for (int i = 0; i < v.size(); i++) {
			writeToFile(fileName, (String) v.elementAt(i), true, true);
		}
	}

	/***************************************************************************
	 * 文件拷贝
	 * 
	 * @param src
	 *            源文件
	 * @param dst
	 *            目标文件
	 * @return
	 */
	public static boolean copyFile(File src, File dst) {
		boolean result = false;
		InputStream in = null;
		OutputStream out = null;
		try {
			in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
			out = new BufferedOutputStream(new FileOutputStream(dst),
					BUFFER_SIZE);
			byte[] buffer = new byte[BUFFER_SIZE];
			int len = 0;
			while ((len = in.read(buffer)) > 0) {
				out.write(buffer, 0, len);
			}
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (null != out) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	/***************************************************************************
	 * 随机得到文件名称格式：yyyyMMddHHmmss+六位随机数字
	 * 
	 * @return
	 */
	public static String getRandomFileName(String fileName) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		Random random = new Random();
		String fileStr = sf.format(date) + random.nextInt(10000);
		int i = fileName.lastIndexOf('.');
		String str = fileName.substring(i + 1);
		return fileStr + "." + str;
	}

	/**
	 * 根据指定路径得到该路径下面所有文件
	 * 
	 * @param filePath
	 * @return
	 */
	public static List<String> getFileNames(String filePath) {
		List<String> fileNames = new ArrayList<String>();
		File f = new File(filePath);
		if (f.isDirectory()) {
			File[] files = f.listFiles();
			for (File file : files) {
				String fileName = file.getName();
				fileNames.add(fileName);
			}
		}
		return fileNames;
	}

	public static boolean delFilePath(String filePath) {

		File f = new File(filePath);
		if (f.isDirectory()) {
			File[] files = f.listFiles();
			for (File file : files) {

				if (file.isFile()) {
					file.delete();

				}
			}
		}
		return true;
	}

	/**
	 * 根据指定路径得到该路径下面需要的扩展名所有文件
	 * 
	 * @param filePath
	 * @return
	 */
	public static List<File> getFiles(String filePath,
			List<String> extendFileName) {
		// 将传入的匹配扩展名转换为大写
		List<String> upperCaseList = new ArrayList<String>();
		for (String exName : extendFileName) {
			upperCaseList.add(exName.toUpperCase());
		}
		// 将传入的匹配扩展名转换为大写

		List<File> fileList = new ArrayList<File>();
		File f = new File(filePath);
		if (f.isDirectory()) {
			File[] files = f.listFiles();
			for (File file : files) {
				String fileName = file.getName();
				if (upperCaseList.contains(getExtendFileName(fileName))) {
					fileList.add(file);
				}
			}
		}
		return fileList;
	}

	public static boolean findPNGByFile(File upload, String pngname) {

		boolean flag = false;
		if (upload == null) {
			return false;
		}

		try {
			InputStream in = new FileInputStream(upload);

			flag = findPNGByString(convertStreamToString(in), pngname);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	public static boolean findPNGByString(String input, String pngname) {

		boolean flag = false;

		if (input == null || input.length() == 0) {
			return false;
		}

		Pattern chagePattern = Pattern.compile(pngname);

		Matcher inputMatcher = chagePattern.matcher(input);

		if (inputMatcher.find()) {
			flag = true;
		}

		return flag;

	}

	public static String convertFileToString(File upload) {

		StringBuilder sb = new StringBuilder();
		try {
			LineNumberReader reader = new LineNumberReader(
					new BufferedReader(new InputStreamReader(
							new FileInputStream(upload), "utf-8")));
			String line = null;
			while ((line = reader.readLine()) != null) {
				sb.append(line + "\n");

			}
		} catch (UnsupportedEncodingException e) {

		} catch (FileNotFoundException e) {

		} catch (IOException e) {

		}
		return sb.toString();
	}

	public static String file2String(File file, String charset) {
		StringBuffer sb = new StringBuffer();
		try {
			LineNumberReader reader = new LineNumberReader(new BufferedReader(
					new InputStreamReader(new FileInputStream(file), charset)));
			String line;
			while ((line = reader.readLine()) != null) {

				sb.append(line).append(System.getProperty("line.separator"));
			}
		} catch (UnsupportedEncodingException e) {

		} catch (FileNotFoundException e) {

		} catch (IOException e) {

		}
		return sb.toString();
	}

	public static String convertStreamToString(InputStream is) {

		BufferedReader reader = new BufferedReader(new InputStreamReader(is));
		StringBuilder sb = new StringBuilder();

		String line = null;
		try {
			while ((line = reader.readLine()) != null) {

				sb.append(line + "\n");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return sb.toString();
	}

	/**
	 * 根据文件名得到其扩展名 注：返回的扩展名都是大写
	 * 
	 * @param fileName
	 * @return
	 */
	public static String getExtendFileName(String fileName) {
		if (fileName.indexOf(".") < 0) {
			return null;
		}
		return fileName.substring(fileName.indexOf(".") + 1, fileName.length())
				.toUpperCase();
	}

	public static void main(String[] args) {
		String path = "E:\\vilook\\VilookManage\\src\\com\\mm2u\\wvei\\sysutil\\MD5.java";
		File file = new File(path);
		//System.out.println(file.getParent());
		String strs = StringUtils.replace(file.getParent(), file
				.getParentFile().getParent(), "");
		//System.out.println(strs.substring(1, strs.length()));
	}
}