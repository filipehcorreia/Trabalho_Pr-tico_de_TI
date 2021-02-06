<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="home.*" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

<% String root =application.getContextPath();
%>

  <!-- Custom fonts for this template-->
  <link href="<%=root %>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="<%=root %>/css/sb-admin.css" rel="stylesheet">

</head>



<body class="bg-dark">



<% if(request.getSession().getAttribute("msg")!=null){ %>

<div class="alert alert-danger" role="alert">
  <%=request.getSession().getAttribute("msg")%>
</div>
<%} 
request.getSession().removeAttribute("msg");
%>





  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        <form method="post" name="loginForm" action="/TP/LoginServlet">
          <div class="form-group">
            <div class="form-label-group">
              <input type="name" id="username" name="username" class="form-control" placeholder="Username" required="required" autofocus="autofocus">
              <label for="username">Username</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required="required">
              <label for="inputPassword">Password</label>
            </div>
          </div>
          <div class="form-group">
            <div class="checkbox">
             
            </div>
          </div>
          <input class="btn btn-primary btn-block" type="submit" value="Login"></input>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="home?action=registar">Registar</a>
          <a class="d-block small" href="home?action=passwordreset">Esqueci-me da password</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="<%=root %>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=root %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="<%=root %>/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
