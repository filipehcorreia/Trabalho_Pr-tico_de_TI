<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<% if(request.getSession().getAttribute("msg")!=null){ %>

<div class="alert alert-danger" role="alert">
  <%=request.getSession().getAttribute("msg")%>
</div>
<%} 
request.getSession().removeAttribute("msg");
%>

  <title>SB Admin - Register</title>

  <!-- Custom fonts for this template-->
  <link href="<%=root %>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="<%=root %>/css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Register an Account</div>
      <div class="card-body">
        <form method="post" name="registarForm" action="/TP/RegistarServlet" >
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="username" name="username" class="form-control" placeholder="username" required="required" autofocus="autofocus">
                  <label for="username">Username</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="name" name="name" class="form-control" placeholder="name" required="required">
                  <label for="name">Nome </label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="email"  id="inputEmail" name="inputEmail" class="form-control" placeholder="Email address" required="required">
              <label for="inputEmail">Email address</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required="required" pattern=".{8,}">
                  <label for="inputPassword">Password</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm password" required="required" pattern=".{8,}">
                  <label for="confirmPassword">Confirm password</label>
                </div>
              </div>
            </div>
          </div>
          <input  class="btn btn-primary btn-block" type="submit"  value="Registar">
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="home?action=login">Login Page</a>
          <a class="d-block small" href="home?action=passwordreset">Forgot Password?</a>
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
