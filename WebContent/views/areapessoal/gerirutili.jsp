<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="home.*" %>
<%@ page import="java.sql.*"%>
    <%
Utilizador u = new Utilizador();
if (request.getSession().getAttribute("utilizador")!=null){
 u =(Utilizador) request.getSession().getAttribute("utilizador");
 

}else{
	response.sendRedirect("home");
	
}
if (u.getTipo()!=0){
	request.setAttribute("render", "contapessoal.jsp");
	response.sendRedirect("home?action=dashboard");
}
%>
 <% if(u.getTipo()==0){ %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jq-3.3.1/dt-1.10.20/b-1.6.1/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jq-3.3.1/dt-1.10.20/b-1.6.1/datatables.min.js"></script>

<title>Insert title here</title>


</head>
<body>
<h1>Gerir Utilizadores</h1>
</body>

<%try {
	Class.forName("com.mysql.jdbc.Driver");
	
	DBconnection db = new DBconnection();
	ResultSet resultado = db.query("select * from  utilizador ");
	%>

	<table id="tabela" class="table table-striped table-dark ">
		<thead>
			<tr>
				<th>UserName</th>
				<th>Tipo</th>
				<th>Email</th>
				<th>Nome</th>
				<th>NIF</th>
				<th>Morada</th>
				<th>Ações</th>				
			</tr>
		</thead>
		<tbody>


			<%
			while (resultado.next()) { %>

			<tr>
				<td><%=resultado.getString("username") %></td>
				
				<%
				String res;
				if (resultado.getInt("tipo")==0){
					res="Administrador";
				}else{
					res="Cliente";
				}			
				%>
				<td><%=res %></td>
				<td><%=resultado.getString("email") %></td>
				<td><%=resultado.getString("nome") %></td>
				<td><%=resultado.getInt("nif") %></td>
				<td><%=resultado.getString("morada_utilizador") %></td>
				<td>
				
				<a class="btn btn-danger text-white" href="RemoverUtilizador?username=<%=resultado.getString("username") %>">Remover</a>
				
			<%	if (resultado.getInt("tipo")==0){ %>
				<a class="btn btn-warning text-white" href="PromoverDespromoverUtili?username=<%=resultado.getString("username") %>&tipo=0">Despromover</a>
				<%	}else{%>
					<a class="btn btn-success text-white" href="PromoverDespromoverUtili?username=<%=resultado.getString("username") %>&tipo=1">Promover</a>
				<%}%>
				
				</td>

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
		<tfoot></tfoot>
	</table>

	<script>$(document).ready(function () {
    $.noConflict();
    var table = $('#tabela').DataTable();
    
});

	
	  $(document).on("click", ".btn-danger", function () {
		     var iduti = $(this).data('username');
		     document.getElementById("amb").href= "PagarMultaServlet?met=mb&id="+iduti;
		     document.getElementById("ambway").href= "PagarMultaServlet?met=mbway&id="+idmulta;
		    
		});
	  
	  </script>
</html>
<%}else{ %>

<h1>Você não tem permissões para aceder a esta página</h1>



<%} %>