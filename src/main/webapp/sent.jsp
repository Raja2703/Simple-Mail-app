<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- output tailwindcss link -->
  	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="flex w-100% bg-zinc-100">
		<!-- menu -->
		<div class="w-2/12 px-3 py-6">
			<a href="compose.jsp" class="text-xl border-2 rounded py-2 px-4">+ Compose</a>
			
			<ul class="leading-6 mt-4">
				<li><a href="inbox.jsp" class="text-lg pl-2 pr-36 py-1 hover:rounded-lg hover:bg-slate-200">Inbox</a></li>
				<li><a href="sent.jsp" class="text-lg pl-2 pr-36 py-1 hover:rounded-lg hover:bg-slate-200">Sent</a></li>
				<li><a href="trash.jsp" class="text-lg pl-2 pr-36 py-1 hover:rounded-lg hover:bg-slate-200">Trash</a></li>
			</ul>
		</div>
		
		<!-- inbox -->
		<div class="ml-2 w-10/12 h-screen border-2 rounded-md mt-5 mr-3 bg-white">
			<ul>
				<li class="p-2 border-b border-gray-300 bg-zinc-200">message</li>
				<li class="p-2 border-b border-gray-300 bg-zinc-200">message</li>
				<li class="p-2 border-b border-gray-300 bg-zinc-200">message</li>
			</ul>
		</div>
	</div>
</body>
