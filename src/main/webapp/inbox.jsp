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
	<div class="flex w-100% bg-purple-200">
		<!-- menu -->
		<div class="w-2/12 px-3 py-6">
			<a href="compose.jsp" class="bg-purple-400 text-white text-xl border border-black rounded-xl py-2 px-4">+ Compose</a>
			
			<ul class="leading-6 mt-4">
				<li><a href="getInboxMessages" class="text-lg pl-2 pr-36 py-1 hover:rounded-lg hover:bg-purple-300">Inbox</a></li>
				<li><a href="getSentInbox" class="text-lg pl-2 pr-36 py-1 hover:rounded-lg hover:bg-purple-300">Sent</a></li>
				<li><a href="getTrashInbox" class="text-lg pl-2 pr-36 py-1 hover:rounded-lg hover:bg-purple-300">Trash</a></li>
			</ul>
		</div>
		
		<!-- inbox -->
		<form class="ml-2 w-10/12 h-screen border-2 rounded-md mt-0 mr-0 bg-purple-100" action="getMessageServlet" method="post">
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
						String subStrBody = body.length() > 28 ? body.substring(0, 27)+" ......." : body;
				%>
				<div class="flex border-b border-gray-300 bg-purple-100 hover:bg-purple-200">
				<button class="w-full p-2 flex" type="submit" value=<%=mid %> name="btn">
					<p class="w-25% mr-4"><%=sender_email %></p>
					<p class="w-70% mx-4"><%=subject %> - <%=subStrBody %></p>
					<div class="w-5% flex-auto text-end">
						<p class="inline-block"><%=str_date %></p>
					</div>
				</button>
				<button class="inline-block" type="submit" value=<%=mid %> name="deleteBtn">
						<svg class="inline-block w-7 h-7 hover:bg-red-500 p-1 rounded-lg" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
  							<path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
						</svg>
				</button>
				</div>
				<% } %>
			</ul>
		</form>
	</div>
</body>
</html>