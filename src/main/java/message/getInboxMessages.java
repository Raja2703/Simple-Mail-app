package message;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.db;

@WebServlet("/getInboxMessages")
public class getInboxMessages extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String user_email = (String) session.getAttribute("user_email");
		
		db db = new db();
		try {
			List<Map<String, Object>> list = db.getInboxMessages(user_email);
			session.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("inbox.jsp");
			request.setAttribute("list", list);
			rd.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
