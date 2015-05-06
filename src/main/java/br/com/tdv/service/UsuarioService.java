package br.com.tdv.service;

import org.springframework.stereotype.Service;

import br.com.tdv.model.Usuario;

@Service("usuarioService")
public class UsuarioService {

	public boolean login(Usuario usuario) {
		return "jsantos".equals(usuario.getCodigo()) && "stopdedo".equals(usuario.getSenha());
	}

}
