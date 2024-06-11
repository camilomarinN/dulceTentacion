package service;

import config.Security;
import models.usuario;
import repository.usuarioRepository;

public class usuarioService {

	private usuarioRepository UserRepo = new usuarioRepository();
	private Security segurityBase = new Security();
	private usuario user = new usuario();
	
	public usuario LoginUser(String email, String pass) {
		
		UserRepo = new usuarioRepository();
		
		if(email == null || email.isEmpty() || pass == null || pass.isEmpty())
			return null;
		
		String AuxPass = segurityBase.EncryptToAES(pass);
		return user = UserRepo.SearchLogin(email, AuxPass);
	} 
	
	public Integer saveUserData(usuario user, String Action) {
		
		if(user == null)
			return 0;
		
		if(user.getContrasenia() != null && !user.getContrasenia().isEmpty())
			user.setContrasenia(segurityBase.EncryptToAES(user.getContrasenia()));
		
		if(Action.contentEquals("add"))
			return UserRepo.save(user);
		else if(Action.equals("update"))
			return UserRepo.update(user);
		else
			return 0;
	}
}
