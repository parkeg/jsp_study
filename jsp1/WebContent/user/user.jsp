<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.Connection" %>
   <%@ page import="java.sql.ResultSet" %>
   <%@ page import="java.sql.SQLException" %>
   <%@ page import="java.sql.DriverManager" %>
   <%@ page import="java.sql.Statement" %>
   <%@ page import="java.util.List" %>
   <%@ page import="java.util.ArrayList" %>

<%
String url = "jdbc:mysql://localhost:3306/jsp_study";
String id = "root";
String pwd = "jspstudy";
Connection con;
Statement st;
try {
	Class.forName("org.mariadb.jdbc.Driver");
	con = DriverManager.getConnection(url, id, pwd);
	st = con.createStatement();
	String sql = "select * from user";
	ResultSet rs = st.executeQuery(sql);
	out.println("<table border='1'>");
	while(rs.next()) {
		out.println("<tr>");
		out.println("<td>");
		out.println(rs.getString("user_no"));
		out.println("</td>");
		out.println("<td>");
		out.println(rs.getString("id"));
		out.println("</td>");
		out.println("<td>");
		out.println(rs.getString("password"));
		out.println("</td>");
		out.println("<td>");
		out.println(rs.getString("name"));
		out.println("</td>");
		out.println("</tr>");
		
	}
	out.println("</table>");
}catch(ClassNotFoundException e) {
	e.printStackTrace();
}catch(SQLException e) {
	e.printStackTrace();
}


%>
