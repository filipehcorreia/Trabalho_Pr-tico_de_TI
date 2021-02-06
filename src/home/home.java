package home;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Home
 */
@WebServlet("/home")
public class home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	Utilizador u1=(Utilizador) request.getSession().getAttribute("utilizador");
    	if(u1!=null) {
    	}
	    String action= request.getParameter("action");
	    if(action==null)action="home";
	    switch(action){
	    
	    case "home" : home(request,response);
	    break;
	    case "contacto" : contacto(request,response);
	    break;
	    case "sobrenos" : sobrenos(request,response);
	    break;
	    case "servicos" : servicos(request,response);
	    break;
	    case "registar" : registar(request,response);
	    break;
	    case "passwordreset" : passwordreset(request,response);
	    break;
	    case "login" : login(request,response);
	    break;
	    case "logout" : logout(request,response);
	    break;
	    case "dashboard" : dashboard(request,response);
	    break;
	    case "multas" : multas(request,response);
	    break;
	    case "veiculos" : veiculos(request,response);
	    break;
	    case "contapessoal" : contapessoal(request,response);
	    break;
	    case "addmultas" : addmultas(request,response);
	    break;
	    case "gerirutili" : gerirutili(request,response);
	    break;
	    case "forgotalterar": forgotalterar(request,response);
	    break;
	    

		
	    }
	}

  
	private void forgotalterar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("views/areapessoal/alterarPasswordForgot.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("views/index.jsp").forward(request, response);
	}
	
	protected void contacto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("views/shared/contact.jsp").forward(request, response);
	}
	
	protected void sobrenos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("views/shared/about.jsp").forward(request, response);
	}
	
	protected void servicos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("views/shared/services.jsp").forward(request, response);
	}
	
	protected void registar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("views/home/register.jsp").forward(request, response);
	}
	protected void passwordreset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("views/home/forgot-password.jsp").forward(request, response);
	}
	
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("views/home/login.jsp").forward(request, response);
	}
	protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getSession().invalidate();
		response.sendRedirect("home");
	}	
	protected void dashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("render", "contapessoal.jsp");
		request.getRequestDispatcher("views/areapessoal/dashboard.jsp").forward(request, response);
	}	
	protected void multas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("render", "multas.jsp");
		request.getRequestDispatcher("views/areapessoal/dashboard.jsp").forward(request, response);
	}	
	protected void veiculos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("render", "veiculos.jsp");
		request.getRequestDispatcher("views/areapessoal/dashboard.jsp").forward(request, response);
	}	
	protected void addmultas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("render", "addmultas.jsp");
		request.getRequestDispatcher("views/areapessoal/dashboard.jsp").forward(request, response);
	}	
	protected void gerirutili(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("render", "gerirutili.jsp");
		request.getRequestDispatcher("views/areapessoal/dashboard.jsp").forward(request, response);
	}	
	protected void contapessoal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	request.setAttribute("render", "contapessoal.jsp");
		request.getRequestDispatcher("views/areapessoal/dashboard.jsp").forward(request, response);
	}	
	
}
