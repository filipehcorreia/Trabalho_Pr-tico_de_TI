package home;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registar
 */
@WebServlet("/RegistarServlet")
public class RegistarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistarServlet() {
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
		
		if(e.hash(request.getParameter("inputPassword")).equals(e.hash(request.getParameter("confirmPassword")))) {	
		Utilizador u = new Utilizador(request.getParameter("username"),request.getParameter("inputEmail"),request.getParameter("name"),e.hash(request.getParameter("inputPassword")));
		
		
		
		if(u.registar()) {
			request.getSession().removeAttribute("msg");
			response.sendRedirect("home?action=login");

		}else {
			request.getSession().setAttribute("msg", "Erro ao registar");
			response.sendRedirect("home?action=registar");
		}
		
		
		
		
	}
	}

}
