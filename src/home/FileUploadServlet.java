package home;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;




/**
 *
 * @author John Yeary
 * @version 1.0 http://docs.oracle.com/javaee/6/tutorial/doc/glraq.html
 */
@WebServlet("/FileUploadService")
@MultipartConfig
public class FileUploadServlet extends HttpServlet {
	private String location = "/";
	private String filesDir = "ficheiros";
	private static final long serialVersionUID = -264635933294175731L;

	// ------------------------------------------------------------------------------------------------------

	public void init(ServletConfig servletConfig) throws ServletException {
	    /* NOTA: modificar a path para a localização da pasta webcontent do seu pc
	     * Para distribuição da aplicação em ficheiro .WAR  comente a primeira linha e descomente a segunda.      
	     * */
		String absolutePath="/home/tdi/eclipse-workspace/TP/WebContent/";
		//String absolutePath= servletConfig.getServletContext().getRealPath("/") + "/";
		this.location = absolutePath + this.filesDir;

	}
	// ------------------------------------------------------------------------------------------------------

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		
		PrintWriter out = response.getWriter();

		Part part = request.getPart("file");
		String filename = "";

		for (String s : part.getHeader("content-disposition").split(";")) {
			if (s.trim().startsWith("filename")) {
				filename = s.split("=")[1].replaceAll("\"", "");
			}
		}

		// normaliza��o do nome do ficheiro por causa do IE
		Path p = Paths.get(filename);
		Date d = new Date();

		
		
		
		
		
		
		
		filename = d.getTime() + "_" + p.getFileName().toString();
		
		
		Utilizador u;
		u= (Utilizador) request.getSession().getAttribute("utilizador");
		
		
		File file = new File(this.location + "/" + u.getFoto());
		file.delete();
		
		DBconnection db = new DBconnection();
		Connection c= db.conexao();
		PreparedStatement ps;
		try {
			ps = c.prepareStatement("UPDATE utilizador SET foto=? WHERE username=?");
			ps.setString(1, filename);
			ps.setString(2,u.getUsername());
			ps.execute();
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		//
		
		
		

		File outputDir = new File(this.location);
		if (!outputDir.exists()) {
			boolean result = outputDir.mkdir();
		}
		System.out.println("escreveu aqui:  "+this.location + "/" + filename);
		part.write(this.location + "/" + filename);
	
		

		String resultado = "{\"result\":_RES_," + "\"path\":\"_PATH_\"}";
		resultado = resultado.replace("_RES_", "1");
		resultado = resultado.replace("_PATH_", this.filesDir + "/" + filename);
		out.write(resultado);

	}// doPost()

	// ------------------------------------------------------------------------------------------------------
} // class