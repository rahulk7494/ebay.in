<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	try {
		String dbImageName = request.getParameter("image");
		System.out.println("========" + dbImageName);
		File imageFile = new File("E:\\Software\\System Software\\eclipse-jee-mars-1-win32-x86_64\\" + dbImageName);
		BufferedImage bi = ImageIO.read(imageFile);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(bi, "jpg", baos);
		baos.flush();
		byte[] imageInByte = null;
		imageInByte = baos.toByteArray();
		baos.close();

		response.setContentType("image/jpeg");
		response.getOutputStream().write(imageInByte);
		
	}
catch(Exception e) {
	e.printStackTrace();
}
%> 
