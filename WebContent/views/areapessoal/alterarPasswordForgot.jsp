<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="home.*" %>
    <% if (request.getParameter("k")==null){
    	response.sendRedirect("home"); } %>
   
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




  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Alterar Password</div>
      <div class="card-body">
        <form method="post" name="Form" action="/TP/MudarPassword">
          
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="inputPassword" name="passwordforgot" class="form-control" placeholder="Password" required="required">
              <label for="inputPassword">Password</label>
            </div>
          </div>
          <input hidden name="inputK" value=<%=request.getParameter("k") %>>
          
           <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="inputPassword2" name="passwordforgotrepetida" class="form-control" placeholder="Repita a password" required="required">
              <label for="inputPassword2">Repita a password</label>
            </div>
          </div>
          
        <input class="btn btn-primary btn-block" type="submit" value="Alterar"></input>
            </div>
          </div>
          
        </form>
        
        
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
