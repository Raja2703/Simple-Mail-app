<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>IPX WEB</title>

  <!-- Google fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@200&display=swap" rel="stylesheet">

  <!-- output tailwindcss link -->
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-purple-300 text-white h-screen w-screen flex justify-center items-center">

  <form action="Register" method="post" class="flex justify-center text-center mt-2">

    <div class="form flex flex-col justify-center items-center w-min">
      <h1 class="mb-2.5 text-2xl text-purple-600 font-medium">Create new account</h1>
      <input type="text" class=" px-4 py-2 w-80 rounded my-2 shadow-md outline-none bg-slate-100 border border-gray-300 text-black" placeholder="name" name="name">
      <input type="email" class=" px-4 py-2 w-80 rounded my-2 shadow-md outline-none bg-slate-100 border border-gray-300 text-black" placeholder="email" name="email">
      <input type="password" class=" px-4 py-2 w-80 rounded my-2 shadow-md outline-none bg-slate-100 border border-gray-300 text-black" placeholder="password" name="pass">
      <input type="text" class=" px-4 py-2 w-80 rounded my-2 shadow-md outline-none bg-slate-100 border border-gray-300 text-black" placeholder="gender" name="gender">

      <button type="submit" class="w-80 rounded px-5 py-1 mt-2 mb-5 bg-purple-500">SIGNUP</button>
      <div class="w-80 flex justify-between mb-1">
        <a href="login.jsp" class="text-purple-600">Already have an account? Login</a>
      </div>
    </div>
  </form>
</body>
</html>