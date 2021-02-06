package home;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
 * Servlet implementation class promover ou despromover utilizadorServlet
 */
@WebServlet("/MudarPassword")
public class MudarPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MudarPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utilizador user=(Utilizador) request.getSession().getAttribute("utilizador");
		
		if (user==null) {
			
			if (request.getParameter("inputK")!=null) {
				
				String k = request.getParameter("inputK");
				checkK(k,response,request);
			}else {
				response.sendRedirect("home");
			}
		}else {
		
		mudarERedirect(user,request,response);
		
		

		}
	
		
	
		
	}
	
	private boolean checkK(String k,HttpServletResponse response,HttpServletRequest request) throws IOException {
		DBconnection db = new DBconnection();
		Connection c=db.conexao();
		PreparedStatement ps;
		String uname=null;
		
		
		try {
			ps=c.prepareStatement("select * from forgotpassword fp, utilizador u where fp.key=? and fp.mail=u.email");
			ps.setString(1,k);
			ResultSet res=ps.executeQuery();
		
			if (res.next()==false) {
				response.sendRedirect("home");
			} else if (res.first()) {
					 uname = res.getString("username");
				updatePass(uname, request);
				response.sendRedirect("home?action=login");
			}
			
			ps=c.prepareStatement("delete from TP.forgotpassword where forgotpassword.key=?");
			ps.setString(1,k);
			ps.execute();
			
			
			c.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.toString());
		}
		
		
		return false;
		
	}
	
	private void mudarERedirect(Utilizador user,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=user.getUsername();
		String passwordAntiga= request.getParameter("passwordAntiga");
		String novaPassword= request.getParameter("novaPassword");
		String passwordBD = null;
		DBconnection db = new DBconnection();
		Connection c= db.conexao();
		PreparedStatement ps;
		try {
			ps = c.prepareStatement("SELECT PASSWORD FROM utilizador WHERE USERNAME=?");
			ps.setString(1, username);
			ResultSet resultado = ps.executeQuery();
			while (resultado.next()) { 
			passwordBD= resultado.getString("password");
		
			}
	

		Hashing h = new Hashing();
		novaPassword=h.hash(novaPassword);
		passwordAntiga=h.hash(passwordAntiga);

	
			if(passwordAntiga.equals(passwordBD)) {
				ps = c.prepareStatement("UPDATE utilizador SET password=? where username=?");
				ps.setString(1, novaPassword);
				ps.setString(2,username);
				 ps.execute(); 
			}
			c.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		response.sendRedirect("home?action=contapessoal");	
	}
	
	private void updatePass(String uname,HttpServletRequest request) throws UnsupportedEncodingException {
		Hashing h = new Hashing();
		
		DBconnection db = new DBconnection();
		Connection c= db.conexao();
		PreparedStatement ps;
	if (request.getParameter("passwordforgot").equals(request.getParameter("passwordforgotrepetida"))){
		String pass=h.hash(request.getParameter("passwordforgotrepetida"));
			try {
				ps = c.prepareStatement("UPDATE utilizador SET password=? where username=?");
				ps.setString(1,pass);
				ps.setString(2,uname);
				 ps.execute(); 
			
				 
				 
			c.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.toString());
		}	
			
	}else {
		//erro pass n sao iguais
	}
		
	}
	
	}


