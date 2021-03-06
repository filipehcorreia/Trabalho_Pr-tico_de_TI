<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ page import="home.*" %>
<% 
String nome="errrro";
Utilizador u = new Utilizador();
if (request.getSession().getAttribute("utilizador")!=null){
	
 u =(Utilizador) request.getSession().getAttribute("utilizador");


 nome = u.getNome();

System.out.println(nome);
}else{
	
}

%>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Atlum</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/heroic-features.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="home">Atlum</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="home">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="home?action=sobrenos">Sobre nós</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="home?action=servicos">Serviços</a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="home?action=contacto">Contactos</a>
          </li>
            <% if( !u.isLogged() ) { %>
           <li class="nav-item">
            <a class="nav-link" href="home?action=login">Login</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="home?action=registar">Registar</a>
          </li>
          <% }else{ %>
            <li class="nav-item">
            <a class="nav-link" href="home?action=dashboard">Dashboard</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="home?action=logout">Logout</a>
          </li>
          <% } %>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  
  
  <% if( u.isLogged() ) { %>
 <div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong>Olá, <%=nome %>!</strong> Bem-vindo de volta.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<% } %>


  <div class="container">

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
      <h1 class="display-3">Contactos</h1>
      <p class="lead">Entre em contacto connosco de segunda a sexta das  9h00 às 19h00. Através do contacto telefónico: 243000000</p>
      <p>Estamos situados no Complexo Andaluz, Apartado 295 2001-904 Santarém</p>
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3827.3806168133933!2d-8.691899784639991!3d39.22285677952165!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd18ee41821c85e3%3A0x4a533034cd17a4bf!2sComplexo%20Andaluz%20-%20Escolas!5e1!3m2!1spt-PT!2spt!4v1578596633684!5m2!1spt-PT!2spt" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>      
      
    </header>

    <!-- Page Features -->
    <div class="row text-center">

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="imagens/contactos.png" width="500" height="250" alt="">
          <div class="card-body">
            <h4 class="card-title">Contactos</h4>
            <p class="card-text">Aqui pode ver todos os nossos contactos caso necessite do nosso suporte.</p>
          </div>
          <div class="card-footer">
            <a href="home?action=contacto" class="btn btn-primary">Saiba mais!</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="imagens/servicos.png" width="500" height="250" alt="">
          <div class="card-body">
            <h4 class="card-title">Serviços</h4>
            <p class="card-text">Aqui pode ver todos os serviços que oferecemos.</p>
          </div>
          <div class="card-footer">
            <a href="home?action=servicos" class="btn btn-primary">Saiba Mais!</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="imagens/sobrenos.jpeg" width="500" height="250" alt="">
          <div class="card-body">
            <h4 class="card-title">Sobre nós</h4>
            <p class="card-text">Aqui pode encontrar informações que lhe poderão ser úteis.</p>
          </div>
          <div class="card-footer">
            <a href="home?action=sobrenos" class="btn btn-primary">Saiba Mais!</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="imagens/epa.jpg" width="500" height="250" alt="">
          <div class="card-body">
            <h4 class="card-title">Epá</h4>
            <p class="card-text">Aqui pode encontrar o seu gelado epá.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Saiba Mais!</a>
          </div>
        </div>
      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Atlum 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>

