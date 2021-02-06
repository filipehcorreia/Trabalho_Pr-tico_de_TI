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
		System.out.println("antes");
		if(request.getParameter("inputPassword").equals(request.getParameter("confirmPassword"))) {	
		Utilizador u = new Utilizador(request.getParameter("username"),request.getParameter("inputEmail"),request.getParameter("name"),request.getParameter("inputPassword"));
		u.registar();
		System.out.println("depois");
		response.sendRedirect("home?action=login");
	}
	}

}
