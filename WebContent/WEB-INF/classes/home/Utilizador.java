package home;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Utilizador {
private String user;
private int tipo;
private String mail;
private String nome;
private int nif;
private String morada;
private String foto;
private String password;
private boolean logged=false;


public boolean isLogged() {
	return logged;
}


public Utilizador(String username, String password) {
	super();
	this.user = username;
	this.password = password;
}




public Utilizador(String user, String mail, String nome, String password) {
	super();
	this.tipo=1;
	this.user = user;
	this.mail = mail;
	this.nome = nome;
	this.password = password;
}


public String getMail() {
	return mail;
}


public void setMail(String mail) {
	this.mail = mail;
}


public String getNome() {
	return nome;
}


public void setNome(String nome) {
	this.nome = nome;
}


public int getNif() {
	return nif;
}


public void setNif(int nif) {
	this.nif = nif;
}


public String getMorada() {
	return morada;
}


public void setMorada(String morada) {
	this.morada = morada;
}


public String getUsername() {
	return user;
}


public int getTipo() {
	return tipo;

}


public void validar2() {
	try {
		DBconnection db = new DBconnection();
		
			
	ResultSet	res=	db.query("select * from utilizador where username='" + user + "'");
		while (res.next()) {
			String util = res.getString("username");
			String pass = res.getString("password");
			nome=res.getString("nome");
			tipo=res.getInt("tipo");
			System.out.println("DB:"+util+pass);
			if (password.equals(pass)) {
				logged = true;
				System.out.println("validado");
			}
		}
	} catch (Exception e) {

	}
	
}

public Utilizador() {
	super();
}


public void registar() {
	
	if(!logged) {
	try {
		
		 DBconnection db = new DBconnection();
			
			Connection c =db.conexao();
			PreparedStatement ps = c.prepareStatement("insert into utilizador(username,tipo,email,nome,password) values (?,?,?,?,?)");
		
			ps.setString(1, user);
			ps.setInt(2,1 );
			ps.setString(3, mail);
			ps.setString(4, nome);
			ps.setString(5,password);
			ps.execute();
		
	}catch (Exception e) {

	}
	
	}
}

}




