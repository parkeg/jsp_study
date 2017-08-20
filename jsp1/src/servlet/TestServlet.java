package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
		System.out.println("두 포스트 호출햇네여~~"+req.getParameterMap());
		 PrintWriter out=resp.getWriter();
	}
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
		//ArrayList<String> list=new ArrayList<String>();
		//list.add("1");
		
		Map<String, String[]> m =req.getParameterMap();
		Iterator<String> it=m.keySet().iterator();
		String result="두 겟 호출했네요~~";
		while(it.hasNext()) {
			String key=it.next();
			result += key+":"+req.getParameter(key);
		}
		doProcess(resp,result);
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
