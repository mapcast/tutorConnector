package mgr;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TeacherServlet1
 */
@WebServlet("/TeacherServlet")
public class TeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse response) 
			throws ServletException, IOException {
	
		req.setCharacterEncoding("EUC-KR");
		
		TeacherMgr mgr = new TeacherMgr();
		mgr.registerTeacher(req);
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('������ ��� �Ϸ�');");
		out.println("location.href='main.jsp'");
		out.println("</script>");
		
	
	}

}


	
