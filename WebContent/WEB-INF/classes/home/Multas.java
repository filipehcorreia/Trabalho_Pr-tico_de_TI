package home;

import java.sql.Connection;
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
	private boolean estado_multa;
	private String validade;

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

	public boolean isEstado_multa() {
		return estado_multa;
	}

	public void setEstado_multa(boolean estado_multa) {
		this.estado_multa = estado_multa;
	}

	public String getValidade() {
		return validade;
	}

	public void setValidade(String validade) {
		this.validade = validade;
	}

	public Multas(String multa, int id_tipo_multa, double latitude, double longitude, String localidade,
			String distrito, String matricula, boolean estado_multa, String validade) {
		super();
		this.id_multa = multa;
		this.id_tipo_multa = id_tipo_multa;
		this.latitude = latitude;
		this.longitude = longitude;
		this.localidade = localidade;
		this.distrito = distrito;
		this.matricula = matricula;
		this.estado_multa = estado_multa;
		this.validade = validade;
	}

	public void visualizarMultas(Utilizador user) throws ClassNotFoundException {
		try {
			DBconnection db = new DBconnection();
			ResultSet resultado = db.query("select m.* from multas m, veiculo v where "
					+ "m.matricula=v.matricula and v.username=" + user.getUsername() + "" + id_multa + "'");

			while (resultado.next()) {
				System.out.println("Id Multa: " + resultado.getString("ID_MULTA"));
				System.out.println("Id Tipo de Multa: " + resultado.getString("ID_TIPO_MULTA"));
				System.out.println("Latitude: " + resultado.getDouble("LATITUDE"));
				System.out.println("Longitude: " + resultado.getDouble("LONGITUDE"));
				System.out.println("Latitude: " + resultado.getString("LOCALIDADE"));
				System.out.println("Latitude: " + resultado.getString("DISTRITO"));
				System.out.println("Matricula: " + resultado.getString("MATRICULA"));
				System.out.println("Estado da Multa: " + resultado.getString("ESTADO_MULTA"));
				System.out.println("Validade: " + resultado.getString("VALIDADE"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
