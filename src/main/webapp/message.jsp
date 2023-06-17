<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Mail app</title>
	
	<!-- output tailwindcss link -->
  	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="flex w-100% bg-zinc-100">
		<!-- menu -->
		<div class="w-2/12 px-3 py-6">
			<a href="compose.jsp" class="text-xl border border-black rounded-xl py-2 px-4">+ Compose</a>
			
			<ul class="leading-6 mt-4">
				<li><a href="inbox.jsp" class="text-lg pl-2 pr-36 py-1 hover:rounded-lg hover:bg-slate-200">Inbox</a></li>
				<li><a href="getSentInbox" class="text-lg pl-2 pr-36 py-1 hover:rounded-lg hover:bg-slate-200">Sent</a></li>
				<li><a href="trash.jsp" class="text-lg pl-2 pr-36 py-1 hover:rounded-lg hover:bg-slate-200">Trash</a></li>
			</ul>
		</div>
		
		<!-- message -->
		<div class="ml-2 w-10/12 h-screen border-2 rounded-md mt-5 mr-3 bg-white">
			<div>
				<%
					HttpSession sessionObj = request.getSession();
					Map<String,Object> msg = (Map<String,Object>) request.getAttribute("msg");
					int mid = (int) msg.get("mid");
					String sender_email = (String) msg.get("sender_email");
					Timestamp sent_date =  (Timestamp) msg.get("sent_date");
					SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy, HH:mm a");
					String str_date = sdf.format(sent_date);
					String subject = (String) msg.get("subject");
					String body = (String) msg.get("body");
					String recepient_email = (String) msg.get("recepient_email");
				%>
				<h1 class="px-16 pt-3"><%=subject %></h1>
				<div class="flex justify-between p-4">
					<div class="flex">
						<img class="w-10 h-10 mr-2" src="https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg">
						<div>
							<h3><%=sender_email %></h3>
							<h3 class="text-xs"><%=recepient_email %></h3>
						</div>
					</div>	
					<div><%=str_date %></div>
				</div>
				<hr>
				<div class="px-16 pt-4"><%=body %></div>
			</div>
		</div>
	</div>
</body>
</html>