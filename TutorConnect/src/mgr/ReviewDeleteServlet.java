package mgr;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReviewDelete")
public class ReviewDeleteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		ReviewMgr mgr=new ReviewMgr();
		int fromNum=Integer.parseInt(request.getParameter("fromNum"));
		int toNum=Integer.parseInt(request.getParameter("toNum"));
		mgr.deleteReview(fromNum, toNum);
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('리뷰 삭제 완료');");
		out.println("location.href='commentList.jsp'");
		out.println("</script>");
	}

}
