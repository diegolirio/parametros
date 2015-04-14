package br.com.tdv.model;

/**
 * @author desenv
 *
 */
public class Aplicacao {
	
	private String codigo;
	private String descricao;

	public Aplicacao(){}
	
	public Aplicacao(String codigo) {
		this.codigo = codigo;
	}
	
	public Aplicacao(String codigo, String descricao) {
		this(codigo);
		this.descricao = descricao;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	@Override
	public String toString() {
		return "Aplicacao [codigo=" + codigo + ", descricao=" + descricao + "]";
	}

	

}
