<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ page import="home.*" %>
<%@ page import="java.sql.*" %>


<%
String root =application.getContextPath();
Utilizador u = new Utilizador();
if (request.getSession().getAttribute("utilizador")!=null){
 u =(Utilizador) request.getSession().getAttribute("utilizador");


}else{
	response.sendRedirect("home");
	
}

%>
<% if(u.getTipo()==0){ %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  
<title>Insert title here</title>
</head>
<body>
<h2>Adicionar multas</h2>


<form method="post" name="AddMultaForm" action="/TP/AddMultaServlet">
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">Matrícula</label>
  </div>
  
  
  
  <%try {
	Class.forName("com.mysql.jdbc.Driver");
	
	DBconnection db = new DBconnection();
	ResultSet resultado = db.query("select * from veiculo order by username");
	%>
  
  <select class="custom-select" id="inputGroupSelect01" name="matricula">
  <option selected>Escolha...</option>
  <%while (resultado.next()) { %>
    
    <option value=<%=resultado.getString("matricula")%>><%=resultado.getString("matricula")+" ("+resultado.getString("username")+")" %></option>
  
 <% }	
  
  db.conexao().close();
  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} %>
		</select>
</div>





<div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect02">Tipo</label>
  </div>
  <select class="custom-select" id="inputGroupSelect02" name="tipo_multa">
    <option selected>Escolha...</option>
    <option value="1">Paquimetro</option>
    <option value="2">Estancionamento</option>
    <option value="3">Semáforo</option>
     <option value="4">Stop</option>
  </select>
</div>

  <div class="col-sm-12 col-md-6">
  
         <div class="form-group"><label>Latitude </label><input class="form-control" type="text" name="latitude" "></div>
   
         <div class="form-group"><label>Longitude </label><input class="form-control" type="text" name="longitude" </div>
                        
         <div class="form-group"><label>Localidade </label><input class="form-control" type="text" name="localidade"</div>
         
         <div class="form-group"><label>Distrito </label><input class="form-control" type="text" name="distrito" </div>
                       
  </div>
   <div class="form-row">
                        <div class="col-md-12 content-right">
                        <button class="btn btn-primary form-btn" type="submit">Adicionar </button>
                        
                        </form>
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
<%}else{ %>

<h1>Você não tem permissões para aceder a esta página</h1>

<%} %>

