<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="home.*"%>

<%
String root =application.getContextPath(); 

Utilizador u = new Utilizador();
if (request.getSession().getAttribute("utilizador")!=null){
u =(Utilizador) request.getSession().getAttribute("utilizador");
u.validar2();
}else{
response.sendRedirect("home");
}



 


%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Untitled</title>
<link rel="stylesheet"
	href="<%=root%>/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=root%>/assets/css/styles.min.css">

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="fileupload/bootstrap.css" media="screen">
<link rel="stylesheet" href="fileupload/upload.css" media="screen">
</head>

<body>

	<div class="row">
		<div class="col-md-12 alert-col relative">
			<div class="alert alert-info absolue center" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<span>Conta atualizada!</span>
			</div>
		</div>
	</div>

	<form method="post" name="ContaPessoalForm"
		action="/TP/ContaPessoalServlet">
		<div class="form-row profile-row">
			<div class="col-md-2 relative">
				<div class="avatar">
					<div class="avatar-bg center">
						<img src="ficheiros/<%=u.getFoto() %>" width="200" heigth="200" class="rounded-circle" > </img>
					</div>
				</div>
				








			</div>
			<div class="col-md-8">
				<h1><%=u.getUsername() %></h1>
				<hr>
				<div class="form-row">
					<div class="col-sm-12 col-md-6">
						<div class="form-group">
							<label>Nome </label><input class="form-control" type="text"
								name="nome" value="<%=u.getNome()%>">
						</div>
					</div>
					<div class="col-sm-12 col-md-6">
						<div class="form-group">
							<label>NIF </label>
							<%
					if (u.getNif()==0){%>
						
						<input class="form-control" 
								name="nif" placeholder="Insira aqui" pattern=".{9,9}">
						<% 
					}else{  %>
					<input class="form-control" 
								name="nif" value="<%=u.getNif() %>" pattern=".{9,9}">
				<%	}
						%>
							
						</div>
					</div>
				</div>
				<div class="form-group">
					<label>Email </label><input class="form-control" type="email"
						autocomplete="off" required="" name="email"
						value="<%=u.getMail()%>">
				</div>
				<div class="form-group">
				
					<label>Morada </label>
					
					<%
					if (u.getMorada()==null|| (u.getMorada().equals("null"))){
			
						%>
					<input class="form-control" type="text"
						autocomplete="off" name="morada" placeholder="Insira a sua Morada">
							
				<%  }else{ 
					
				%>
				
					<input class="form-control" type="text"
						autocomplete="off" name="morada" value="<%=u.getMorada()%>">
							
					<% }  %>
						
				</div>

				<hr>
				<div class="form-row">
					<div class="col-md-12 content-right"></div>
				</div>
			</div>
		</div>
		<input class="btn btn-primary form-btn" type="submit" Value="Alterar">
		</input>
	</form>

	<hr>

	<p>
		
	</p>
		<div class="card card-body">
			<form method="post" action="/TP/MudarPassword">


				<div class="form-group">
					<label for="exemplopsw">Password Atual</label> <input
						type="password" class="form-control" id="exemplopsw"
						aria-describedby="pswHelp " name="passwordAntiga" >
				</div>

				<div class="form-group">
					<label for="exemplopsw1">Nova Password</label> <input
						type="password" class="form-control" id="exemplopsw1"
						aria-describedby="pswHelp" name="novaPassword" pattern=".{8,}">
				</div>


				<input class="btn btn-primary form-btn" type="submit"
					Value="Alterar"> </input>

			</form>
		</div>




<div>

	<script src="fileupload/FileUpload.js"></script>



	<div id="fileUploadPanel">

		<div class="uploadWidget">
			<div class="uploadWidget-header">

				<strong>Carregar Ficheiro</strong>

			</div>
			<div class="uploadWidget-body">
				<div id="dropbox">
					<span id="droplabel">Largue o ficheiro aqui...</span>
				</div>

				<img id="preview" alt="[ preview will display here ]" />
				<div id="fileinfo">
					<div id="filename"></div>
					<div id="filesize"></div>
					<div id="filetype"></div>
					<div id="filedim"></div>
				</div>

				<div id="error2">Ocorreu um erro na transferência do ficheiro</div>
				<div id="abort">A transferência foi cancelada ou o navegador
					fechou a conexão</div>
				<div id="progress_info">
					<div id="upfilename"></div>
					<div class="progress progress-striped active margin0">
						<div id="uploadProgress" class="bar" style="width: 0%;"></div>
					</div>


					<div>
						<div id="progress_percent">&nbsp;</div>
						<div id="speed">&nbsp;</div>
						<div id="remaining">&nbsp;</div>
						<div id="b_transfered">&nbsp;</div>
						<!--  <div class="clear_both"></div>  -->
					</div>
				</div>
				<div id="upload_response"></div>

			</div>
			<!-- uploadWidget-body   -->

			<div class="uploadWidget-footer" id="uploadWidget-footer">
				<a id="fileUploadCancel" href="#" class="btn btn-mini btn-danger">Cancel</a>
				<a id="fileUploadRestart" href="#" class="btn btn-mini btn-info">Transferir
					outro</a> <a id="fileUploadView" href="#"
					class="btn btn-mini btn-success">Verificar</a>

			</div>
		</div>
		<!-- uploadWidget  -->

	</div>

</div>










	<script src="<%=root%>/assets/js/jquery.min.js"></script>
	<script src="<%=root%>/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=root%>/assets/js/script.min.js"></script>
</body>

</html>