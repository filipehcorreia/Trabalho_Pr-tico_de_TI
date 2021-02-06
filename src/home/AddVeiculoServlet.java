package home;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddVeiculoServlet
 */
@WebServlet("/AddVeiculoServlet")
public class AddVeiculoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddVeiculoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		try {
			Utilizador u;
			u= (Utilizador) request.getSession().getAttribute("utilizador");
			 DBconnection db = new DBconnection();
			 Connection c =db.conexao();	
			 
			 if(request.getParameter("marca")!="" || request.getParameter("modelo")!="") {
			 
				PreparedStatement ps = c.prepareStatement("insert into veiculo values (?,?,?,?,?)");
			
				ps.setString(1,request.getParameter("matricula").toUpperCase());
				ps.setString(2,u.getUsername());
				ps.setString(3,request.getParameter("marca"));
				ps.setString(4,request.getParameter("modelo"));
				ps.setInt(5,Integer.parseInt(request.getParameter("ano")));
				ps.execute();
			 }
				c.close();
				
				
		}catch (Exception e) {
			
		}
		
		
		response.sendRedirect("home?action=veiculos");
	}

}
