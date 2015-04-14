package br.com.tdv.service;

import org.springframework.stereotype.Service;

import br.com.tdv.model.Usuario;

@Service("usuarioService")
public class UsuarioService {

	public boolean login(Usuario usuario) {
		if("jsantos".equals(usuario.getCodigo())) return true;
		return false;
	}

}
