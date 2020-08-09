package common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Download {

	public static void download(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String filename = request.getParameter("filename");
		
		final String DIRECTORY = "storage";
		String realPath = request.getServletContext().getRealPath("/" + DIRECTORY);
		
		File path = new File(realPath);
		if (!path.exists()) {
			path.mkdirs();
		}
		
		File file = new File(realPath, filename);
		
		response.setHeader("Content-Type", "application/x-msdownload");
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(filename, "utf-8"));
		response.setHeader("Content-Length", file.length()+"");
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		byte[] byteArray = new byte[1024];	// 1KB
		while((bis.read(byteArray)) != -1) {
			bos.write(byteArray);
		}
		
		if (bos != null) { bos.close();}
		if (bis != null) { bis.close();}
		
		
	}
}
