package home;


import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.*;

public class Hashing {



public String hash(String pass) throws UnsupportedEncodingException {
	String hashtext="";
			  try {
				//Classe do java.security q permite encriptação md5 e sha's
				  //O get instace define o tipo de encriptação
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				
				
				
				 byte[] messageDigest = md.digest(pass.getBytes("UTF-8")); 
				 
				 
				 
		            BigInteger no = new BigInteger(1, messageDigest); 

		            
		            //tostring(16) retorna em formato hexadecimal
		             hashtext = no.toString(16); 
		           
		            while (hashtext.length() < 32) { 
		                hashtext = "0" + hashtext; 
		            } 
		       return hashtext;
				 
				 
			} catch (NoSuchAlgorithmException e) {
				
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return hashtext; 
	
	
	
}


}
