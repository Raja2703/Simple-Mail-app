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
	<form action="logout" method="post" class=" relative">
		<nav class="py-2 px-4 bg-purple-300 group/logout">
			<div class="flex justify-between">
				<h1 class="text-lg">Mailer</h1>
				<div>
					<img class="w-10 h-10 mr-2 rounded-2xl hover:cursor-pointer"
						src="https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg">
					<div
						class="absolute top-14 right-0 h-8 w-fit px-5 rounded-md bg-purple-300 hidden group-hover/logout:block">
						<button class="hover:cursor-pointer" type="submit">logout</button>
					</div>
				</div>
			</div>
		</nav>
	</form>

</body>
</html>