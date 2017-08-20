package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.DBconnector;

public class UserServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
		//System.out.println("두 포스트 호출햇네여~~"+req.getParameterMap());
		req.setCharacterEncoding("utf-8"); 
		String id =req.getParameter("id");
		String pwd =req.getParameter("pwd");
		String name =req.getParameter("name");
		String[] hobbies =req.getParameterValues("hobby");
		String hobby="";
		for(String h:hobbies) {
			hobby += h+",";
		}
		//hobby=hobby.substring(0,hobby.length()-1);
		//String result="입력하신 ID : "+id+"<br>";
		String result = name+"님 회원가입 실패함";
		//result += "입력하신 취미 : "+hobby+ "<br>";
		Connection con;
		try {
			con = DBconnector.getCon();
			String sql="insert into user(id,password,name,hobby)";
			sql += " values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);//접속 후  커리창을 만든 상태
			ps.setString(1,id);
			ps.setString(2,pwd);
			ps.setString(3,name);
			ps.setString(4,hobby);//물음표에 들어갈 값
			int row=ps.executeUpdate();
			if(row==1) {
				result="회원가입에 성공하셨습니다.";
			}		
		}catch(Exception e) {
			e.printStackTrace();
		}
		doProcess(resp,result);
				
		//PrintWriter out=resp.getWriter();
	}
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
		//ArrayList<String> list=new ArrayList<String>();
		//list.add("1");
		
		/*Map<String, String[]> m =req.getParameterMap();
		Iterator<String> it=m.keySet().iterator();
		String result="두 겟 호출했네요~~";
		while(it.hasNext()) {
			String key=it.next();
			result += key+":"+req.getParameter(key);
		}
		doProcess(resp,result);*/
		//PrintWriter out=resp.getWriter();
		//System.out.println("두겟 호출햇네요~~"+req.getParameterMap());
		
	}
	public void doProcess(HttpServletResponse resq, String writeStr)
		throws IOException {
		resq.setContentType("Text/html; charset =UTF-8");
		PrintWriter out = resq.getWriter();
		out.print(writeStr);//jsp의 일을 대신해주는 것이 아님
	}
}
