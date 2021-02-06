package home;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PagarMultaServlet
 */
@WebServlet("/PagarMultaServlet")
public class PagarMultaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PagarMultaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utilizador u = (Utilizador) request.getSession().getAttribute("utilizador");
		DBconnection db = new DBconnection();
		String met=request.getParameter("met");
		String query;
		
	
		Multas mu = new Multas("Select * from multas where id_multa=\""+request.getParameter("id")+"\"");
		Date date = new java.sql.Date(System.currentTimeMillis());
		
		
		Connection c =db.conexao(); 
		  String calId=getNextId();
		  
		  PreparedStatement ps;
		try {
			ps = c.prepareStatement("insert into multas_pagas values (?,?,?,?,?,?,?,?,?,?)");
			
			ps.setString(1, calId);
			  ps.setInt(2,mu.getId_tipo_multa());
			  ps.setDouble(3,mu.getLatitude());
			  ps.setDouble(4, mu.getLongitude()); 
			  ps.setString(5,mu.getLocalidade()); 
			  ps.setString(6,mu.getDistrito());
			  ps.setString(7,mu.getMatricula());
			  if (met.equals("mb")) {
				  if (mu.getDatasql().after(date)) {
					  ps.setString(8,"Pago por MB");
					}else {
						ps.setString(8,"Pago por MB fora da validade");
					}
				 
			  }else {
				  if (mu.getDatasql().after(date)) {
					  ps.setString(8,"Pago por MBWay");
					}else {
						ps.setString(8,"Pago por MBWay fora da validade");
					}
				 
			  }
			  ps.setDate(9,date);
			  ps.setString(10,u.getUsername());
			  
			  ps.execute();
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  
		try {
			ps=c.prepareStatement("delete from multas where id_multa = ? ");
			ps.setString(1,mu.getId_multa());
			
			ps.execute();
			 c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		response.sendRedirect("home?action=multas");
		
	}
		
	

	public String getNextId() {
		String res="PA-";
		int num=0;
		DBconnection db = new DBconnection();
		
		ResultSet resu= db.query("select idmultas_pagas from multas_pagas order by idmultas_pagas");
		

		try {
			while (resu.next()) {
				
				if (Integer.parseInt(resu.getString("idmultas_pagas").substring(3))>num) {
					num=Integer.parseInt(resu.getString("idmultas_pagas").substring(3));
				}
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
