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
 * Servlet implementation class EnviarMailServlet
 */
@WebServlet("/EnviarMailServlet")
public class EnviarMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnviarMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mailadr=request.getParameter("email");
		Hashing h = new Hashing();
		String key=h.hash(mailadr);
		
		DBconnection db = new DBconnection();
		
		Connection c =db.conexao(); 
		  
		  PreparedStatement ps;
	
		//id key mail
		try {
			ps=c.prepareStatement("insert into forgotpassword values (?,?)");
			ps.setString(1,key);
			ps.setString(2,mailadr);
			ps.execute();
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.toString());
		}
		
		
		
		Email email = new Email();
		email.enviarMail(mailadr,key);
		
		response.sendRedirect("home?action=login");
		
	}

	private int getNextId() {
DBconnection db = new DBconnection();
		
		Connection c =db.conexao(); 
		  
		  PreparedStatement ps;
	int i=0;
		//id key mail
		try {
			ps=c.prepareStatement("select idforgotpassword from TP.forgotpassword order by idforgotpassword desc");
			ResultSet res = ps.executeQuery();
			
			if (res.first()) {
				 i = res.getInt("idforgotpassword");
			
			}
			i=i+1;
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.toString());
		}
		
		return i;
	}

}
