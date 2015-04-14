package br.com.tdv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.tdv.dao.AplicacaoPerfilDao;
import br.com.tdv.model.Aplicacao;
import br.com.tdv.model.AplicacaoPerfil;
import br.com.tdv.model.Perfil;

@Service("aplicacaoPerfilService")
public class AplicacaoPerfilService {

	@Autowired
	private AplicacaoPerfilDao aplicacaoPerfilDao;

	public List<AplicacaoPerfil> getPorAplicacao(Aplicacao aplicacao) {
		return this.aplicacaoPerfilDao.getPorAplicacao(aplicacao);
	}

	public List<AplicacaoPerfil> getLista(Aplicacao aplicacao, Perfil perfil) {
		return this.aplicacaoPerfilDao.getLista(aplicacao, perfil);
	}

	public AplicacaoPerfil getPorAplicacaoPerfilUsuario(String aplicacaoCodigo, String perfilCodigo, String usuario) {
		return this.aplicacaoPerfilDao.getPorAplicacaoPerfilUsuario(aplicacaoCodigo, perfilCodigo, usuario);
	}

	public void update(AplicacaoPerfil aplicacaoPerfil, String perfil, String aplicacao, String usuario) {
		this.aplicacaoPerfilDao.update(aplicacaoPerfil, perfil, aplicacao, usuario);
	}

	public void save(AplicacaoPerfil aplicacaoPerfil) {
		this.aplicacaoPerfilDao.save(aplicacaoPerfil);
	}

	
	
}
