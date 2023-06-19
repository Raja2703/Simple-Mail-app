package message;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.db;

public class getMessageServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int mid = 0;
		db db = new db();
		
		if(request.getParameter("btn") == null) {
			mid =  Integer.parseInt(request.getParameter("deleteBtn"));
			System.out.println("delete button pressed");
			
			try {
				HttpSession session = request.getSession();
				String uname = (String)session.getAttribute("user_email");
				db.deleteMsg(mid,uname);
				response.sendRedirect("getInboxMessages");
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}else {
			mid = Integer.parseInt(request.getParameter("btn"));
			System.out.println("msg button pressed");
			try {
				Map<String, Object> msg = db.getMessage(mid);
				request.setAttribute("msg", msg);
				RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
				rd.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
	}

}
