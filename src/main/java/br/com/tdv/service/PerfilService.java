package br.com.tdv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.tdv.dao.PerfilDao;
import br.com.tdv.model.Aplicacao;
import br.com.tdv.model.Perfil;

@Service("perfilService")
public class PerfilService {
	
	@Autowired
	private PerfilDao perfilDao;

	public List<Perfil> getListaPorAplicacao(Aplicacao aplicacao) {
		return this.perfilDao.getList(aplicacao);
	}

	public Perfil getPorCodigo(String codigo) {
		return this.perfilDao.get(codigo);
	}

	public void save(Perfil perfil) {
		this.perfilDao.save(perfil);
	}

	public void update(Perfil perfil, String codigoOld) {
		this.perfilDao.update(perfil, codigoOld);
	}

	public List<Perfil> getListContemDescricao(String descricao, String aplicacaoCodigo) {
		return this.perfilDao.getListContemDescricao(descricao, aplicacaoCodigo);
	}

}


