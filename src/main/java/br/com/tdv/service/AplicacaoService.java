package br.com.tdv.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.tdv.dao.AplicacaoDao;
import br.com.tdv.model.Aplicacao;

@Service("aplicacaoService")
public class AplicacaoService {

	@Autowired
	private AplicacaoDao aplicacaoDao;

	public Aplicacao get(String codigo) {
		return this.aplicacaoDao.get(codigo);
	}

	
	
}
