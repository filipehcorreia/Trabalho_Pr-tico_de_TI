<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="home.*" %>
    
<%
String root =application.getContextPath(); 
String nome="";
Utilizador u = new Utilizador();
if (request.getSession().getAttribute("utilizador")!=null){
 u =(Utilizador) request.getSession().getAttribute("utilizador");
 nome = u.getNome();

}else{
	response.sendRedirect("home");
	
}

String render=null; // vista ou pagina a incluir consoante a action
render= (String)request.getAttribute("render");
if(render==null){
		render="contapessoal.jsp";
	}
%>
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atlum</title>
    <link rel="stylesheet" href="<%=root%>/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=root%>/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="<%=root%>/assets/css/styles.min.css">
</head>

<body>
    <div id="wrapper">
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand"> <a class="text-white">Atlum Dashboard</a></li>
                <%if (!(u.getNif()==0 || u.getMorada().equals(null))){ %>
                <li> <a href="home?action=multas">Multas</a></li>
                <li> <a href="home?action=veiculos">Veiculos</a></li>
                <%} else { %>
                	<div class="alert alert-danger" role="alert">
                	  Para desbloquear todas as funcionalidades forneca um nif e morada!
                	</div>
               <%}%>
                <li> <a href="home?action=contapessoal">Conta Pessoal</a></li>
                <li><a href="home">Voltar</a></li>
                <li><a href="home?action=logout">Logout</a></li>
                <% if(u.getTipo()==0) { %>
                <li class="sidebar-brand"> <a class="text-white">Admin Dashboard</a></li>
                <li> <a href="home?action=addmultas">Adicionar Multas</a></li>
                <li> <a href="home?action=gerirutili">Gerir Utilizadores</a></li>
                <%} %>
                </ul>
        </div>
        
        
        
        <div class="page-content-wrapper">
        
       
            <div class="container-fluid" style="height:600px;"><a class="btn btn-link" role="button" href="#menu-toggle" id="menu-toggle"><i class="fa fa-bars"></i></a>
            
            <jsp:include page="<%=render%>" flush="true"></jsp:include>
            
            </div>
         
        </div>
        
        
        
    </div>
    <script src="<%=root%>/assets/js/jquery.min.js"></script>
    <script src="<%=root%>/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=root%>/assets/js/script.min.js"></script>
</body>

</html>