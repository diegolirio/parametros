package br.com.tdv.builder;

import java.util.Calendar;
import java.util.Date;

import br.com.tdv.model.Aplicacao;
import br.com.tdv.model.Perfil;

public class PerfilBuilder {
	
	private String codigo;
	private String descricao;
	private Aplicacao aplicacao;
	private Date dataCadastro;
	private String usuarioCadastro;
	private Date dataAlteracao;
	private String usuarioAlterou;
	private String parat;
	private double paran1;
	private double paran2;
	private Calendar parad1;
	private Date parad2;
	private String descricaoResumida;
	private String horario;
	private double paran3;
	private double paran4;
	private double paran5;
	private Date parad3;
	private Date parad4;
	private double paran6;
	private String observacao;
	private Calendar vigencia;
	
	public PerfilBuilder comCodigo(String codigo) {
		this.codigo = codigo;
		return this;
	}
	
	public PerfilBuilder comDescricao(String descricao) {
		this.descricao = descricao;
		return this;
	}
	public PerfilBuilder comAplicacao(Aplicacao aplicacao) {
		this.aplicacao = aplicacao;
		return this;
	}
	public PerfilBuilder comDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
		return this;
	}
	public PerfilBuilder comUsuarioCadastro(String usuarioCadastro) {
		this.usuarioCadastro = usuarioCadastro;
		return this;
	}
	public PerfilBuilder comDataAlterou(Date dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
		return this;
	}
	public PerfilBuilder comUsuarioAlterou(String usuarioAlterou) {
		this.usuarioAlterou = usuarioAlterou;
		return this;
	}
	public PerfilBuilder comParat(String parat) {
		this.parat = parat;
		return this;
	}
	public PerfilBuilder comParan1(double paran1) {
		this.paran1 = paran1;
		return this;
	}
	public PerfilBuilder comParan2(double paran2) {
		this.paran2 = paran2;
		return this;
	}
	public PerfilBuilder comParad1(Calendar parad1) {
		this.parad1 = parad1;
		return this;
	}
	public PerfilBuilder comParad2(Date parad2) {
		this.parad2 = parad2;
		return this;
	}
	public PerfilBuilder comDescricaoResumidad(String descricaoResumida) {
		this.descricaoResumida = descricaoResumida;
		return this;
	}
	public PerfilBuilder comParan3(double paran3) {
		this.paran3 = paran3;
		return this;
	}
	public PerfilBuilder comParan4(double paran4) {
		this.paran4 = paran4;
		return this;
	}
	public PerfilBuilder comParan5(double paran5) {
		this.paran5 = paran5;
		return this;
	}
	public PerfilBuilder comParad3(Date parad3) {
		this.parad3 = parad3;
		return this;
	}
	public PerfilBuilder comParad4(Date parad4) {
		this.parad4 = parad4;
		return this;
	}
	public PerfilBuilder comParan6(double paran6) {
		this.paran6 = paran6;
		return this;
	}
	public PerfilBuilder comObservacao(String observacao) {
		this.observacao = observacao;
		return this;
	}
	public PerfilBuilder comVigencia(Calendar vigencia) {
		this.vigencia = vigencia;
		return this;
	}
	public PerfilBuilder comHorario(String horario) {
		this.horario = horario;
		return this;
	}

	public Perfil build() {
		Perfil p = new Perfil();
		p.setCodigo(codigo);
		p.setDescricao(descricao);
		p.setAplicacao(aplicacao);
		p.setDataCadastro(dataCadastro);
		p.setUsuarioCadastro(usuarioCadastro);
		p.setDataAlteracao(dataAlteracao);
		p.setUsuarioAlterou(usuarioAlterou);
		p.setParat(parat);
		p.setParan1(paran1);
		p.setParan2(paran2);
		p.setParad1(parad1);
		p.setParad2(parad2);
		p.setDescricaoResumida(descricaoResumida);
		p.setHorario(horario); 
		p.setParan3(paran3);
		p.setParan4(paran4);
		p.setParan5(paran5); 
		p.setParad3(parad3);
		p.setParad4(parad4);
		p.setParan6(paran6);
		p.setObservacao(observacao);
		p.setVigencia(vigencia);
		return p;
	}

}
