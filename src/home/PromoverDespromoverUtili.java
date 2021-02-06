package home;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class promover ou despromover utilizadorServlet
 */
@WebServlet("/PromoverDespromoverUtili")
public class PromoverDespromoverUtili extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PromoverDespromoverUtili() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String username=request.getParameter("username");
		int tipo= Integer.parseInt(request.getParameter("tipo"));
		int novoTipo;
		
		if(tipo ==0) {
			novoTipo=1;
		}else {
			novoTipo=0;
		}
		
		DBconnection db = new DBconnection();
		db.queryUpdate("update utilizador set tipo =\""+novoTipo+"\" where username =\""+ username + "\"");	
		
		try {
			db.conexao().close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	
	response.sendRedirect("home?action=gerirutili");
	
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			
	}

}
