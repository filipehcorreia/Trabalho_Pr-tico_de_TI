package home;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ContaPessoalServlet
 */
@WebServlet("/ContaPessoalServlet")
public class ContaPessoalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContaPessoalServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		Utilizador u;

		if (request.getSession().getAttribute("utilizador") == null) {
			response.sendRedirect("home");
		} else {
			// verificar valores
			u = (Utilizador) request.getSession().getAttribute("utilizador");
			u.setNome(request.getParameter("nome"));
			u.setNif(Integer.parseInt(request.getParameter("nif")));
			u.setMail(request.getParameter("email"));
			u.setMorada(request.getParameter("morada"));
			u.toString();
			u.atualizar();

			response.sendRedirect("home?action=dashboard");
		}

	}

}
