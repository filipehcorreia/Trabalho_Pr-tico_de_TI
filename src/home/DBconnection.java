package home;

import java.sql.*;


public class DBconnection{
    private static String url = "jdbc:mysql://localhost:3306/TP?autoReconnect=true&useSSL=false"; 
    private static String utilizador = "root";                  
    private static String password = "123";       

/*
  public static void main(String args[]) throws SQLException{
   
	
     ResultSet res= query("select * from utilizador");
      try {
		while(res.next()) {
			String util = res.getString("username");
            String pass = res.getString("password");
           
            System.out.println("utilizador: "+util+" password: "+pass);
		  }
	} catch (SQLException e) {
		e.toString();
	}
      
	  
	 
	  DBconnection db = new DBconnection();
		
		int res = db.queryUpdate("insert into utilizador values ('a',1,'b','c',1,'d','e')");
		System.out.println("sadfd"+res);
        } 

     
	  DBconnection db = new DBconnection();
		
		Connection c =db.conexao();
		PreparedStatement ps = c.prepareStatement("insert into utilizador(username,tipo,email,nome,password) values (?,?,?,?,?)");
	
		ps.setString(1, "bgfdggtf");
		ps.setInt(2,1 );
		ps.setString(3, "a");
		ps.setString(4, "a");
		ps.setString(5,"a");
		ps.execute();
  }
  */
  
    public Connection conexao(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection(url, utilizador, password);
            return con;
            }
        catch(ClassNotFoundException e){
            System.out.println("Erro na driver.");
            }
        catch(SQLException e){
            System.out.println("Erro na BD.");
            }
		return null;
        }
    
    
    public  ResultSet query(String query){
        try{
           Statement s = conexao().createStatement();
          ResultSet  result = s.executeQuery(query);
          
          return result;
          
            }
        catch(SQLException e){
            System.out.println("Erro na Query --> "+e.toString());
            }
        catch(NullPointerException e){
            System.out.println("Elemento não encontrado.");
            }
		return null;
        }
    
    
    public  int queryUpdate(String query){
        try{
           PreparedStatement s = conexao().prepareStatement(query);
          int  result = s.executeUpdate(query);
          
          return result;
            }
        catch(SQLException e){
            System.out.println("Erro na Query --> "+e.toString());
            }
        catch(NullPointerException e){
            System.out.println("Elemento não encontrado.");
            }
		return -1;
        }

}
