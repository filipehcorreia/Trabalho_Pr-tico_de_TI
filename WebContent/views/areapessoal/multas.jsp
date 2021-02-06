<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="home.*"%>
<%@ page import="java.sql.*"%>

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
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs4/jq-3.3.1/dt-1.10.20/b-1.6.1/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/v/bs4/jq-3.3.1/dt-1.10.20/b-1.6.1/datatables.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<h1>Multas</h1>

	<%try {
	Class.forName("com.mysql.jdbc.Driver");
	
	DBconnection db = new DBconnection();
	ResultSet resultado = db.query("select m.* from multas m, veiculo v where m.matricula=v.matricula and v.username= \""+ u.getUsername() + "\"");
	%>

	<table id="tabela" class="table table-striped table-dark ">
		<thead>
			<tr>
				<th>ID Multa</th>
				<th>Tipo Multa</th>
				<th>Latituide</th>
				<th>Longitude</th>
				<th>Localidade</th>
				<th>Distrito</th>
				<th>Matricula</th>
				<th>Estado</th>
				<th>Validade</th>
				<th>Ações</th>
			</tr>
		</thead>
		<tbody>


			<%
			while (resultado.next()) { %>

			<tr>
				<td><%=resultado.getString("ID_MULTA") %></td>
				<td><%=resultado.getInt("ID_TIPO_MULTA") %></td>
				<td><%=resultado.getDouble("LATITUDE") %></td>
				<td><%=resultado.getDouble("LONGITUDE") %></td>
				<td><%=resultado.getString("LOCALIDADE") %></td>
				<td><%=resultado.getString("DISTRITO") %></td>
				<td><%=resultado.getString("MATRICULA") %></td>
				<td><%=resultado.getString("ESTADO_MULTA") %></td>
				<td><%=resultado.getString("VALIDADE")%></td>
				<td><a class="btn btn-danger text-white" data-toggle="modal"
					data-target="#ModalPagar"
					data-idmulta=<%=resultado.getString("ID_MULTA") %>>Pagar</a> <a
					class="open-AddBookDialog btn btn-primary text-white"
					data-toggle="modal" data-target="#exampleModal"
					data-lat=<%=resultado.getDouble("LATITUDE") %>
					data-lon=<%=resultado.getDouble("LONGITUDE") %>>Mapa</a></td>

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

	<hr>
	<h1>Multas Pagas</h1>
	<!-- Tabela multas pagas -->

	<%try {
	Class.forName("com.mysql.jdbc.Driver");
	
	DBconnection db = new DBconnection();
	ResultSet resultado = db.query("select m.* from multas_pagas m where  m.username= \""+ u.getUsername() + "\"");
	%>

	<table id="tabela2" class="table table-striped table-dark ">
		<thead>
			<tr>
				<th>ID Multa</th>
				<th>Tipo Multa</th>
				<th>Latituide</th>
				<th>Longitude</th>
				<th>Localidade</th>
				<th>Distrito</th>
				<th>Matricula</th>
				<th>Estado</th>
				<th>Paga em</th>
				<th>Ações</th>
			</tr>
		</thead>
		<tbody>


			<%
			while (resultado.next()) { %>

			<tr>
				<td><%=resultado.getString("IDMULTAS_PAGAS") %></td>
				<td><%=resultado.getString("TIPO") %></td>
				<td><%=resultado.getDouble("LATITUDE") %></td>
				<td><%=resultado.getDouble("LONGITUDE") %></td>
				<td><%=resultado.getString("LOCALIDADE") %></td>
				<td><%=resultado.getString("DISTRITO") %></td>
				<td><%=resultado.getString("MATRICULA") %></td>
				<td><%=resultado.getString("ESTADO") %></td>
				<td><%=resultado.getString("PAGOEM")%></td>
				<td><a class="open-AddBookDialog btn btn-primary text-white"
					data-toggle="modal" data-target="#exampleModal"
					data-lat=<%=resultado.getDouble("LATITUDE") %>
					data-lon=<%=resultado.getDouble("LONGITUDE") %>>Mapa</a></td>

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
    var table2 = $('#tabela2').DataTable();
    
});</script>



	<!-- Modal do pagamento -->

	<div class="modal fade" id="ModalPagar" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Tipos de
						Pagamento</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<img id="mb" src="imagens/mb.png" width="250" heigth="250"> <a
						id="amb">Pagar com Multibanco</a>
					<hr>
					<img id="mbway" src="imagens/mbway.png" width="250" heigth="250">
					<a id="ambway">Pagar com MBWay</a>



					<script>
    
    $(document).on("click", ".btn-danger", function () {
	     var idmulta = $(this).data('idmulta');
	     document.getElementById("amb").href= "PagarMultaServlet?met=mb&id="+idmulta;
	     document.getElementById("ambway").href= "PagarMultaServlet?met=mbway&id="+idmulta;
	    
	});
</script>



				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>






	<!-- Modal do maps -->

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Mapa</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<script>
    
      </script>
				<div class="modal-body">
					<style>
/* Set the size of the div element that contains the map */
#map {
	height: 400px; /* The height is 400 pixels */
	width: 100%; /* The width is the width of the web page */
}
</style>
					</head>
					<body>
						<!--The div element for the map -->
						<div id="map"></div>
						<script>
    
    $(document).on("click", ".open-AddBookDialog", function () {
	     var lat1 = $(this).data('lat');
	     var lon = $(this).data('lon');
	     initMap(lat1,lon);
	});

   
// Initialize and add the map
function initMap(lat1,lon ) {
  // The location of Uluru
  var uluru =  {lat: lat1, lng: lon};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 4, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
}
    </script>
						<!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
						<script async defer
							src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEItLpNtkMzg0dSfhiNo5i7dnCIU2cQYE&callback=initMap">
    </script>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>






</body>
</html>