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
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@200&display=swap" rel="stylesheet">

  <!-- output tailwindcss link -->
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-black text-smoke w-full h-screen bg-purple-300 flex justify-center items-center">
  <form action="login" method="post" class="w-full h-full flex justify-center items-center text-center">

    <div class="form flex flex-col justify-center items-center w-min">
      <h1 class="mb-5 text-2xl text-purple-600 font-medium">Login to your account</h1>  
      <input type="email" class=" px-4 py-1 w-80 rounded my-1 shadow-md text-black outline-none bg-slate-100 border :border-gray-300" placeholder="your email id" name="email">
      <input type="password" class=" px-4 py-1 w-80 rounded my-2 shadow-md text-black outline-none bg-slate-100 :border :border-gray-300" placeholder="password" name="pass">
  
      <button type="submit" class="w-80 rounded px-5 py-1 mt-2 mb-5 bg-purple-500 text-white">LOGIN</button>
      <div class="w-80 flex justify-between mb-1">
        <a href='signUp.jsp' class="text-gray-500 text-purple-600">Create new account</a>
        <a href='#' class="text-gray-500 text-purple-600">Forgot password</a>
      </div>
    </div>
  </form>
</body>
</html>