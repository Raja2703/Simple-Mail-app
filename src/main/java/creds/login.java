package creds;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.db;

@WebServlet("/login")
public class login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = (String) request.getParameter("email");
		String pass = (String) request.getParameter("pass");
		
		db db = new db();
		try {
			boolean isValid = db.isValidUser(email,pass);
			if(isValid) {
				HttpSession session = request.getSession();
				session.setAttribute("user_email", email);
				response.sendRedirect("getInboxMessages");
			}
			else
				response.sendRedirect("login.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
