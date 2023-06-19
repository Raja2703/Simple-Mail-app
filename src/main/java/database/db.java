package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class db {
	Connection con;
	PreparedStatement stmt,ps1,ps2;
	ResultSet rs;
	
	@SuppressWarnings("finally")
	public boolean insertUser(String uname,String gender,String email,String pass) throws SQLException {
		boolean isRegistered = false;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mail","root","Root@2709");
			stmt = con.prepareStatement("insert into user values(?,?,?,?);");
			stmt.setString(1, uname);
			stmt.setString(2, email);
			stmt.setString(3, gender);
			stmt.setString(4, pass);
			int count = stmt.executeUpdate();
			if(count>0) {
				isRegistered = true;
				return isRegistered;
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			con.close();
			stmt.close();
		}
		return isRegistered;
	}
	
	@SuppressWarnings("finally")
	public boolean isValidUser(String email,String pass) throws SQLException {
		boolean isValid = false;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mail","root","Root@2709");
			stmt = con.prepareStatement("select * from user where email=? and pass=?");
			stmt.setString(1, email);
			stmt.setString(2, pass);
			rs = stmt.executeQuery();
			if(rs.next()) {
				isValid = true;
				return isValid;
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			con.close();
			stmt.close();
		}
		return isValid;
	}
	
	@SuppressWarnings("finally")
	public boolean insertMail(String senderName,String recepientEmail,Timestamp sent_date,String subject,String body) throws SQLException {
		boolean isMessageSent = false;
		try {
			int mid = (int)(Math.random() * 50 + 1);
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mail","root","Root@2709");
			ps1 = con.prepareStatement("insert into message(mid,senderName,sent_date,subject,body,recepientEmail) values(?,?,?,?,?,?);");
			ps1.setInt(1, mid);
			ps1.setString(2, senderName);
			ps1.setTimestamp(3, sent_date);
			ps1.setString(4, subject);
			ps1.setString(5, body);
			ps1.setString(6, recepientEmail);
			ps1.addBatch();
			
			ps2 = con.prepareStatement("insert into inbox(mid,senderName,sent_date,subject,body,recepientEmail,isTrashed) values(?,?,?,?,?,?,?);");
			ps2.setInt(1, mid);
			ps2.setString(2, senderName);
			ps2.setTimestamp(3, sent_date);
			ps2.setString(4, subject);
			ps2.setString(5, body);
			ps2.setString(6, recepientEmail);
			ps2.setString(7, "false");
			ps2.addBatch();
			
			ps1.executeBatch();
			ps2.executeBatch();
			isMessageSent = true;
			return isMessageSent;
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			con.close();
			ps1.close();
			ps2.close();
		}
		return isMessageSent;
	}
	
	@SuppressWarnings("finally")
	public List getInboxMessages(String user_email) throws SQLException {
		List<Map<String,Object>> outerList = new ArrayList<>();
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mail","root","Root@2709");
			stmt = con.prepareStatement("select * from inbox where recepientEmail=? and isTrashed=false");
			stmt.setString(1, user_email);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> inbox = new HashMap<>();
				int mid = rs.getInt(1);
				String sender_email = rs.getString(2);
				Timestamp sent_date = rs.getTimestamp(3);
				String subject = rs.getString(4);
				String body = rs.getString(5);
				String recepient_email = rs.getString(6);	
				inbox.put("mid",mid);
				inbox.put("sender_email",sender_email);
				inbox.put("sent_date",sent_date);
				inbox.put("subject",subject);
				inbox.put("body",body);
				inbox.put("recepient_email",recepient_email);
				outerList.add(inbox);
			}
			
			return outerList;
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			con.close();
			stmt.close();
		}
		return outerList;
	}
	
	@SuppressWarnings("finally")
	public List getSentInboxMessages(String user_email) throws SQLException {
		List<Map<String,Object>> outerList = new ArrayList<>();
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mail","root","Root@2709");
			stmt = con.prepareStatement("select * from inbox where senderName=?");
			stmt.setString(1, user_email);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> inbox = new HashMap<>();
				int mid = rs.getInt(1);
				String sender_email = rs.getString(2);
				Timestamp sent_date = rs.getTimestamp(3);
				String subject = rs.getString(4);
				String body = rs.getString(5);
				String recepient_email = rs.getString(6);	
				inbox.put("mid",mid);
				inbox.put("sender_email",sender_email);
				inbox.put("sent_date",sent_date);
				inbox.put("subject",subject);
				inbox.put("body",body);
				inbox.put("recepient_email",recepient_email);
				outerList.add(inbox);
			}
			
			return outerList;
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			con.close();
			stmt.close();
		}
		return outerList;
	}
	
	@SuppressWarnings("finally")
	public Map getMessage(int mid) throws SQLException {
		Map<String, Object> msg = new HashMap<>();
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mail","root","Root@2709");
			stmt = con.prepareStatement("select * from message where mid=?");
			stmt.setInt(1, mid);
			rs = stmt.executeQuery();
			
			if(rs.next()) {

				String sender_email = rs.getString(2);
				Timestamp sent_date = rs.getTimestamp(3);
				String subject = rs.getString(4);
				String body = rs.getString(5);
				String recepient_email = rs.getString(6);	
				msg.put("mid",mid);
				msg.put("sender_email",sender_email);
				msg.put("sent_date",sent_date);
				msg.put("subject",subject);
				msg.put("body",body);
				msg.put("recepient_email",recepient_email);
			}
			
			return msg;
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			con.close();
			stmt.close();
		}
		return msg;
	}
	
	@SuppressWarnings("finally")
	public void deleteMsg(int mid,String uname) throws SQLException {
//		boolean isMessageSent = false;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mail","root","Root@2709");
			stmt = con.prepareStatement("select * from inbox where mid=?");
			stmt.setInt(1, mid);
			rs = stmt.executeQuery();
			if(rs.next()) {
				String senderName = rs.getString("senderName");
				Timestamp sent_date = rs.getTimestamp("sent_date");
				String subject = rs.getString("subject");
				String body = rs.getString("body");
				String recepientEmail = rs.getString("recepientEmail");
				
				insertIntoTrash(uname,mid,senderName,sent_date,subject,body,recepientEmail);
			}	
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			con.close();
			stmt.close();
		}
	}
	
	@SuppressWarnings("finally")
	public void insertIntoTrash(String deletedFromUser,int mid,String senderName,Timestamp sent_date,String subject,String body,String recepientEmail) throws SQLException {
//		boolean isMessageSent = false
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mail","root","Root@2709");
			ps1 = con.prepareStatement("insert into trash values(?,?,?,?,?,?,?);");
			ps1.setString(1, deletedFromUser);
			ps1.setInt(2, mid);
			ps1.setString(3, senderName);
			ps1.setTimestamp(4, sent_date);
			ps1.setString(5, subject);
			ps1.setString(6, body);
			ps1.setString(7, recepientEmail);
			ps1.addBatch();
			
			ps2 = con.prepareStatement("update inbox set isTrashed=true where mid=?");
			ps2.setInt(1, mid);
			ps2.addBatch();
			
			ps1.executeBatch();
			ps2.executeBatch();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			con.close();
			ps1.close();
			ps2.close();
		}
	}
}
