package br.com.tdv.builder;

import java.util.Calendar;
import java.util.Date;

import br.com.tdv.model.Aplicacao;
import br.com.tdv.model.AplicacaoPerfil;
import br.com.tdv.model.Perfil;

public class AplicacaoPerfilBuilder {

	private Aplicacao aplicacao;
	private Perfil perfil;
	private String usuario;
	private String ativo;
	private Calendar dataAlteracao;
	private Calendar dataCadastro;
	private String descricao;
	private String grupoCodigo;
	private String horario;
	private Date parad1;
	private Date parad2;
	private Date parad3;
	private Date parad4;
	private double paran1;
	private double paran2;
	private double paran3;
	private double paran4;
	private double paran5;
	private double paran6;
	private String parat;
	private String rota;
	private Calendar vigencia;
	private Calendar validade;
	private String usuarioCadastro;
	private String usuarioAlterou;
	
	public AplicacaoPerfilBuilder comAplicacao(Aplicacao aplicacao) {
		this.aplicacao = aplicacao;
		return this;
	}
	
	public AplicacaoPerfilBuilder comPerfil(Perfil perfil) {
		this.perfil = perfil;
		return this;
	}
	
	public AplicacaoPerfilBuilder comUsuario(String usuario) {
		this.usuario = usuario;
		return this;
	}
	
	public AplicacaoPerfilBuilder comRota(String rota) {
		this.rota = rota;
		return this;
	}
	
	public AplicacaoPerfilBuilder comAtivo(String ativo) {
		this.ativo = ativo;
		return this;
	}
	
	public AplicacaoPerfilBuilder comDataAlteracao(Calendar dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
		return this;
	}
	
	public AplicacaoPerfilBuilder comDataCadastro(Calendar dataCadastro) {
		this.dataCadastro = dataCadastro;
		return this;
	}
	
	public AplicacaoPerfilBuilder comDescricao(String descricao) {
		this.descricao = descricao;
		return this;
	}
	
	public AplicacaoPerfilBuilder comGrupoCodigo(String grupoCodigo) {
		this.grupoCodigo = grupoCodigo;
		return this;
	}

	public AplicacaoPerfilBuilder comHorario(String horario) {
		this.horario = horario;
		return this;
	}
	
	public AplicacaoPerfilBuilder comParad1(Date parad1) {
		this.parad1 = parad1;
		return this;
	}
	
	public AplicacaoPerfilBuilder comParad2(Date parad2) {
		this.parad2 = parad2;
		return this;
	}
	
	public AplicacaoPerfilBuilder comParad3(Date parad3) {
		this.parad3 = parad3;
		return this;
	}

	public AplicacaoPerfilBuilder comParad4(Date parad4) {
		this.parad4 = parad4;
		return this;
	}
	
	public AplicacaoPerfilBuilder comParan1(double paran1) {
		this.paran1 = paran1;
		return this;
	}
	
	public AplicacaoPerfilBuilder comParan2(double paran2) {
		this.paran2 = paran2;
		return this;
	}

	public AplicacaoPerfilBuilder comParan3(double paran3) {
		this.paran3 = paran3;
		return this;
	}

	public AplicacaoPerfilBuilder comParan4(double paran4) {
		this.paran4 = paran4;
		return this;
	}

	public AplicacaoPerfilBuilder comParan5(double paran5) {
		this.paran5 = paran5;
		return this;
	}

	public AplicacaoPerfilBuilder comParan6(double paran6) {
		this.paran6 = paran6;
		return this;
	}

	public AplicacaoPerfilBuilder comParat(String parat) {
		this.parat = parat;
		return this;
	}
	

	public AplicacaoPerfilBuilder comVigencia(Calendar vigencia) {
		this.vigencia = vigencia;
		return this;
	}	
	

	public AplicacaoPerfilBuilder comUsuariocadastro(String usuarioCadastro) {
		this.usuarioCadastro = usuarioCadastro;
		return this;
	}	

	public AplicacaoPerfilBuilder comValidade(Calendar validade) {
		this.validade = validade;
		return this;
	}	
	

	public AplicacaoPerfilBuilder comUsuarioAlterou(String usuarioAlterou) {
		this.usuarioAlterou = usuarioAlterou;
		return this;
	}	
	
	public AplicacaoPerfil build() {
		AplicacaoPerfil ap = new AplicacaoPerfil();
		ap.setAplicacao(aplicacao);
		ap.setPerfil(perfil);
		ap.setUsuario(usuario);
		ap.setRota(rota);
		ap.setAtivo(ativo);
		ap.setDataAlteracao(dataAlteracao);
		ap.setDataCadastro(dataCadastro);
		ap.setDescricao(descricao);
		ap.setGrupoCodigo(grupoCodigo);
		ap.setHorario(horario);
		ap.setParad1(parad1);
		ap.setParad2(parad2);
		ap.setParad3(parad3);
		ap.setParad4(parad4);
		ap.setParan1(paran1);
		ap.setParan2(paran2);
		ap.setParan3(paran3);
		ap.setParan4(paran4);
		ap.setParan5(paran5);
		ap.setParan6(paran6);
		ap.setParat(parat);
		ap.setVigencia(vigencia);
		ap.setValidade(validade);
		ap.setUsuarioCadastro(usuarioCadastro);
		ap.setUsuarioAlteracao(usuarioAlterou);
		return ap;
	}

	
}
