package br.com.tdv.model;

public class Usuario {
	
	private String codigo;
	
	private String senha;

	private String nome;
	
	public Usuario(){}

	public Usuario(String codigo) {
		this.codigo = codigo;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getNome() {
		return nome;
	}
	
	
	@Override
	public String toString() {
		return "Usuario [codigo=" + codigo + ", senha=" + senha + "]";
	}

	
	

}
