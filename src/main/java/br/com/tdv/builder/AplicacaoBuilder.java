package br.com.tdv.builder;

import br.com.tdv.model.Aplicacao;

public class AplicacaoBuilder {
	
	private String codigo;
	private String descricao;

	public AplicacaoBuilder comCodigo(String codigo) {
		this.codigo = codigo;
		return this;
	}
	public AplicacaoBuilder comDescricao(String descricao) {
		this.descricao = descricao;
		return this;
	}
	
	public Aplicacao build() {
		return new Aplicacao(codigo, descricao);
	}


}
