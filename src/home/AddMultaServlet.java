package home;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddMultaServlet
 */
@WebServlet("/AddMultaServlet")
public class AddMultaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMultaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Utilizador u;
			u= (Utilizador) request.getSession().getAttribute("utilizador");
			 DBconnection db = new DBconnection();
				
				Connection c =db.conexao();
				PreparedStatement ps = c.prepareStatement("insert into multas values (?,?,?,?,?,?,?,?,?)");
			
				ps.setString(1,getNextId());
				ps.setInt(2,Integer.parseInt(request.getParameter("tipo_multa")));
				ps.setString(3, request.getParameter("latitude"));
				ps.setString(4, request.getParameter("longitude"));
				ps.setString(5,request.getParameter("localidade"));
				ps.setString(6,request.getParameter("distrito"));
				ps.setString(7,request.getParameter("matricula"));
				ps.setString(8,"Não Pago");
				ps.setDate(9,java.sql.Date.valueOf(java.time.LocalDate.now().plusYears(1)));
				ps.execute();
			
				c.close();
		}catch (Exception e) {
			System.out.println(e.toString());
				e.getStackTrace();
		}
		
		
		response.sendRedirect("home?action=addmultas");
	}
	
	
	public String getNextId() {
		String res="MU-";
		int num=0;
		DBconnection db = new DBconnection();
		
		ResultSet resu= db.query("select id_multa from multas order by id_multa");
		
		try {
			while (resu.next()) {
				
				if (Integer.parseInt(resu.getString("id_multa").substring(3))>num) {
					num=Integer.parseInt(resu.getString("id_multa").substring(3));
				}
				db.conexao().close();
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		num=num+1;
		res=res+num;
		return res;
	}

}
