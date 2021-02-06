package home;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Hashing e = new Hashing();
		
	
		Utilizador u = new Utilizador(request.getParameter("username"),e.hash(request.getParameter("password")));
		u.validar2();
		if (u.isLogged()) {
			request.getSession().setAttribute("utilizador",u); 
			request.getSession().removeAttribute("msg");
			response.sendRedirect("home");
	
		}else {
			
			request.getSession().setAttribute("msg", "Erro ao fazer login");
			response.sendRedirect("home?action=login");
		    
		}
		
	}

}
