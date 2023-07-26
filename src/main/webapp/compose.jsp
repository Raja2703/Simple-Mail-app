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
<body class="w-full h-screen flex justify-center items-center bg-purple-200">
	<form action="Compose" method="post" class="border border-gray-400 bg-purple-100 rounded">
		<div class="flex justify-between py-2 px-2 bg-purple-300">
			<h3>New Message</h3>
			<a href="getInboxMessages" class="hover:cursor-pointer">x</a>
		</div>
		
		<div>
			<div class="mt-3 px-2 mb-2">
				<p class="inline">To:</p>
				<input type="email" class="outline-none border-b border-black-100" name="recepient_email">
			</div>
			<div class="px-2 mt-3">
				<p class="inline">Subject:</p>
				<input type="text" class="outline-none border-b border-black-100" name="subject">
			</div>
			<div class="px-2 mt-3"> 
				<textarea rows="10" cols="90" class="outline-none" name="body"></textarea>
			</div>
			<div class="px-2 mb-2">
				<button type="submit" class="bg-purple-400 text-white rounded-xl px-5 py-1">Send</button>
			</div>
		</div>
	</form>
</body>
</html>