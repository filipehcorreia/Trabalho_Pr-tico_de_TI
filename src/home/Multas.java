package home;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Multas {
	private String id_multa;
	private int id_tipo_multa;
	private double latitude;
	private double longitude;
	private String localidade;
	private String distrito;
	private String matricula;
	private String estado_multa;
	private String validade;
	private Date datasql;




	public String getMulta() {
		return id_multa;
	}

	public void setMulta(String multa) {
		this.id_multa = multa;
	}

	public int getId_tipo_multa() {
		return id_tipo_multa;
	}

	public void setId_tipo_multa(int id_tipo_multa) {
		this.id_tipo_multa = id_tipo_multa;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public String getLocalidade() {
		return localidade;
	}

	public void setLocalidade(String localidade) {
		this.localidade = localidade;
	}

	public String getDistrito() {
		return distrito;
	}

	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	

	public String getId_multa() {
		return id_multa;
	}

	public void setId_multa(String id_multa) {
		this.id_multa = id_multa;
	}

	public String getEstado_multa() {
		return estado_multa;
	}

	public void setEstado_multa(String estado_multa) {
		this.estado_multa = estado_multa;
	}

	public String getValidade() {
		return validade;
	}

	public void setValidade(String validade) {
		this.validade = validade;
	}

	public Multas() {
		super();
	}
	
	public Multas(String query) {
	
	
		super();
		DBconnection db= new DBconnection();
		ResultSet resultado=db.query(query);
		
		
		
		try {
			while (resultado.next()) { 

			
				this.id_multa =	resultado.getString("ID_MULTA");
				this.id_tipo_multa =resultado.getInt("ID_TIPO_MULTA");
				this.latitude =resultado.getDouble("LATITUDE");
				this.longitude =resultado.getDouble("LONGITUDE");
				this.localidade =resultado.getString("LOCALIDADE");
				this.distrito =resultado.getString("DISTRITO");
				this.matricula =resultado.getString("MATRICULA");
				this.estado_multa =resultado.getString("ESTADO_MULTA");
				this.validade =resultado.getString("VALIDADE");
				this.datasql=resultado.getDate("VALIDADE");
				
			
			}
			db.conexao().close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	
}

	public Date getDatasql() {
		return datasql;
	}

	@Override
	public String toString() {
		return "Multas [id_multa=" + id_multa + ", id_tipo_multa=" + id_tipo_multa + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", localidade=" + localidade + ", distrito=" + distrito + ", matricula="
				+ matricula + ", estado_multa=" + estado_multa + ", validade=" + validade + "]";
	}
	
}