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
				<li><a href="getInboxMessages" class="text-lg pl-2 pr-36 py-1 hover:rounded-lg hover:bg-slate-200">Inbox</a></li>
				<li><a href="getSentInbox" class="text-lg pl-2 pr-36 py-1 hover:rounded-lg hover:bg-slate-200">Sent</a></li>
				<li><a href="getTrashInbox" class="text-lg pl-2 pr-36 py-1 hover:rounded-lg hover:bg-slate-200">Trash</a></li>
			</ul>
		</div>
		
		<!-- sent -->
		<form class="ml-2 w-10/12 h-screen border-2 rounded-md mt-5 mr-3 bg-white" action="getMessageServlet" method="post">
			<ul>
				<%
					HttpSession sessionObj = request.getSession();
					List<Map<String,Object>> outerList = (List<Map<String,Object>>) sessionObj.getAttribute("list");
					for(int i=0;i<outerList.size();i++){
						Map<String,Object> inboxMsg = outerList.get(i);
						int mid = (int) inboxMsg.get("mid");
						String sender_email = (String) inboxMsg.get("sender_email");
						Timestamp sent_date =  (Timestamp) inboxMsg.get("sent_date");
						SimpleDateFormat sdf = new SimpleDateFormat("MMM dd");
						String str_date = sdf.format(sent_date);
						String subject = (String) inboxMsg.get("subject");
						String body = (String) inboxMsg.get("body");
						String recepient_email = (String) inboxMsg.get("recepient_email");
				%>
				<button class="w-full p-2 border-b border-gray-300 bg-zinc-200 flex" type="submit" value=<%=mid %> name="btn">
					<p class="w-25% mr-4">To: <%=recepient_email %></p>
					<p class="w-70% mx-4"><%=subject %> - <%=body.substring(0,30) %>  .......</p>
					<p class="w-5% flex-auto text-end"><%=str_date %></p>
				</button>
				<% } %>
			</ul>
		</form>
	</div>
</body>
</html>