package message;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.db;

@WebServlet("/Compose")
public class Compose extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String recepient_email = (String) request.getParameter("recepient_email");
		String subject = (String) request.getParameter("subject");
		String body = (String) request.getParameter("body");
		
		Calendar calendar = Calendar.getInstance();
		Timestamp sent_date = new Timestamp(calendar.getTime().getTime());
		
		HttpSession session = request.getSession();
		String senderName = (String) session.getAttribute("user_email");
		
		db db = new db();
		try {
			boolean isMessageSent = db.insertMail(senderName,recepient_email,sent_date,subject,body);
			if(isMessageSent) {
				response.sendRedirect("inbox.jsp");
			}
			else
				response.sendRedirect("login.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
