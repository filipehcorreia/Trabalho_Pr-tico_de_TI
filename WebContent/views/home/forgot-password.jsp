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

  <title>Repor password</title>

  <!-- Custom fonts for this template-->
  <link href="<%=root %>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="<%=root %>/css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Repor Password</div>
      <div class="card-body">
        <div class="text-center mb-4">
          <h4>Não te lembras da password?</h4>
          <p>Introduz o teu email e vamos responder com instruções para proseguir</p>
        </div>
        <form method="post" action="/TP/EnviarMailServlet">
          <div class="form-group">
            <div class="form-label-group">
              <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Enter email address" required="required" autofocus="autofocus">
              <label for="inputEmail">Insere o email</label>
            </div>
          </div>
          <input class="btn btn-primary btn-block" type="submit">Enviar</a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="home?action=registar">Registar uma conta</a>
          <a class="d-block small" href="home?action=login">Login</a>
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
