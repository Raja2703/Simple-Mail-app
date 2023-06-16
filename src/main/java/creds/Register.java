package creds;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.db;

@WebServlet("/Register")
public class Register extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = (String) request.getParameter("name");
		String email = (String) request.getParameter("email");
		String pass = (String) request.getParameter("pass");
		String gender = (String) request.getParameter("gender");
		
		db db = new db();
		try {
			if(db.insertUser(name,gender,email,pass)) {
				response.sendRedirect("login.jsp");
			}else {
				response.sendRedirect("Register.jsp");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
