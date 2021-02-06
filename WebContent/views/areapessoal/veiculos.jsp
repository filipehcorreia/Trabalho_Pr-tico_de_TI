<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="home.*" %>
<%@ page import="java.sql.*" %>

<%
Utilizador u = new Utilizador();
if (request.getSession().getAttribute("utilizador")!=null){
u =(Utilizador) request.getSession().getAttribute("utilizador");
}else{
response.sendRedirect("home");
}

if (u.getNif()==0 || u.getMorada().equals(null)){ 
	request.getSession().invalidate();
	response.sendRedirect("home");
	%>
	<script>
	location.reload(true)
	</script>
<% }

%>



 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jq-3.3.1/dt-1.10.20/b-1.6.1/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jq-3.3.1/dt-1.10.20/b-1.6.1/datatables.min.js"></script>
<body>



<h2>Veículos</h2>


<%try {
	Class.forName("com.mysql.jdbc.Driver");
	
	DBconnection db = new DBconnection();
	ResultSet resultado = db.query("select v.* from veiculo v where v.username= \""+ u.getUsername() + "\"");
	%>
	
	<table class="table table-striped table-dark" id="tabela">
	  <thead>
	    <tr>
	      <th scope="col">Matrícula</th>
	      <th scope="col">Marca</th>
	      <th scope="col">Modelo</th>
	      <th scope="col">Ano</th>
	       <th scope="col">Ações</th>
	    </tr>
	  </thead>
	  <tbody>
	  
	
<%
			while (resultado.next()) { %>
				
	    <tr>
	      <td scope="row"><%=resultado.getString("matricula") %></td>
	      <td scope="row"><%=resultado.getString("marca") %></td>
	       <td scope="row"><%=resultado.getString("modelo") %></td>
	        <td scope="row"><%=resultado.getInt("ano") %></td>
				 <td scope="row"><a class=" btn btn-danger btn-sm " href="RemoverVeiculo?matricula=<%=resultado.getString("matricula") %>" >Remover</a></td>
				 </tr>
				<%
			
			}	
			db.conexao().close();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		%>
		</tbody>
		</table>

	<script>$(document).ready(function () {
    $.noConflict();
    var table = $('#tabela').DataTable();
    
});</script>

<hr>
<h2>Adicionar Veículo</h2>



<form method="post" name="AddVeiculoForm" action="/TP/AddVeiculoServlet">
<div class="col-sm-12 col-md-6">
  
         <div class="form-group"><label>Matrícula </label><input class="form-control" type="text" name="matricula"   pattern=".{8,8}" title="A matrícula tem de ser do tipo XX-XX-XX"></div>
   
         <div class="form-group"><label>Marca </label><input class="form-control" type="text" name="marca" required</div>
                        
         <div class="form-group"><label>Modelo </label><input class="form-control" type="text" name="modelo" required</div>
         
         <div class="form-group"><label>Ano </label><input class="form-control" type="number" name="ano" max="2020" min="1900" value="2020" required </div>
                       
  </div>
  <button class="btn btn-primary form-btn" type="submit">Adicionar </button>
  </form>
  
</body>
</html>