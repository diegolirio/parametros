package br.com.tdv.model;

import java.util.Calendar;
import java.util.Date;

/**
 * @author desenv
 *
 */
public class Perfil {

	private Aplicacao aplicacao; //	usu_aplicacao_codigo	char(10)
	private String codigo; //	usu_perfil_codigo	varchar2(25)
	private String descricao; //	usu_perfil_descricao	varchar2(75)
	private Date dataCadastro; //	usu_perfil_dtcad	date
	private String usuarioCadastro; //	usu_usuario_codigocad	char(10)
	private Date dataAlteracao; //	usu_perfil_dtalt	date
	private String usuarioAlterou; //	usu_usuario_codigoalt	char(10)
	private String parat; //	usu_perfil_parat	varchar2(1000)
	private String descricaoResumida; //	usu_perfil_descricaoresumida	varchar2(30)
	private String horario; //	usu_perfil_horario	char(192)
	private double paran1; //	usu_perfil_paran1	number
	private double paran2; //	usu_perfil_paran2	number
	private double paran3; //	usu_perfil_paran3	number
	private double paran4; //	usu_perfil_paran4	number
	private double paran5; //	usu_perfil_paran5	number
	private double paran6; //	usu_perfil_paran6	number
	private Calendar parad1; //	usu_perfil_parad1	date
	private Date parad2; //	usu_perfil_parad2	date
	private Date parad3; //	usu_perfil_parad3	date
	private Date parad4; //	usu_perfil_parad4	date
	private String observacao; //	usu_perfil_observacao	varchar2(2000)
	private Calendar vigencia; //	usu_perfil_vigencia	date
	
	public Perfil(){}
	
	public Perfil(String codigo) {
		this.codigo = codigo;
	}
	public Aplicacao getAplicacao() {
		return aplicacao;
	}
	public void setAplicacao(Aplicacao aplicacao) {
		this.aplicacao = aplicacao;
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
	public Date getDataCadastro() {
		return dataCadastro;
	}
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	public String getUsuarioCadastro() {
		return usuarioCadastro;
	}
	public void setUsuarioCadastro(String usuarioCadastro) {
		this.usuarioCadastro = usuarioCadastro;
	}
	public Date getDataAlteracao() {
		return dataAlteracao;
	}
	public void setDataAlteracao(Date dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}
	public String getUsuarioAlterou() {
		return usuarioAlterou;
	}
	public void setUsuarioAlterou(String usuarioAlterou) {
		this.usuarioAlterou = usuarioAlterou;
	}
	public String getParat() {
		return parat;
	}
	public void setParat(String parat) {
		this.parat = parat;
	}
	public double getParan1() {
		return paran1;
	}
	public void setParan1(double paran1) {
		this.paran1 = paran1;
	}
	public double getParan2() {
		return paran2;
	}
	public void setParan2(double paran2) {
		this.paran2 = paran2;
	}
	public Calendar getParad1() {
		return parad1;
	}
	public void setParad1(Calendar parad1) {
		this.parad1 = parad1;
	}
	public Date getParad2() {
		return parad2;
	}
	public void setParad2(Date parad2) {
		this.parad2 = parad2;
	}
	public String getDescricaoResumida() {
		return descricaoResumida;
	}
	public void setDescricaoResumida(String descricaoResumida) {
		this.descricaoResumida = descricaoResumida;
	}
	public String getHorario() {
		return horario;
	}
	public void setHorario(String horario) {
		this.horario = horario;
	}
	public double getParan3() {
		return paran3;
	}
	public void setParan3(double paran3) {
		this.paran3 = paran3;
	}
	public double getParan4() {
		return paran4;
	}
	public void setParan4(double paran4) {
		this.paran4 = paran4;
	}
	public double getParan5() {
		return paran5;
	}
	public void setParan5(double paran5) {
		this.paran5 = paran5;
	}
	public Date getParad3() {
		return parad3;
	}
	public void setParad3(Date parad3) {
		this.parad3 = parad3;
	}
	public Date getParad4() {
		return parad4;
	}
	public void setParad4(Date parad4) {
		this.parad4 = parad4;
	}
	public double getParan6() {
		return paran6;
	}
	public void setParan6(double paran6) {
		this.paran6 = paran6;
	}
	public String getObservacao() {
		return observacao;
	}
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	public Calendar getVigencia() {
		return vigencia;
	}
	public void setVigencia(Calendar vigencia) {
		this.vigencia = vigencia;
	}

	@Override
	public String toString() {
		return "Perfil [aplicacao=" + aplicacao + ", codigo=" + codigo
				+ ", descricao=" + descricao + ", dataCadastro=" + dataCadastro
				+ ", usuarioCadastro=" + usuarioCadastro + ", dataAlteracao="
				+ dataAlteracao + ", usuarioAlterou=" + usuarioAlterou
				+ ", parat=" + parat + ", paran1=" + paran1 + ", paran2="
				+ paran2 + ", parad1=" + parad1 + ", parad2=" + parad2
				+ ", descricaoResumida=" + descricaoResumida + ", horario="
				+ horario + ", paran3=" + paran3 + ", paran4=" + paran4
				+ ", paran5=" + paran5 + ", parad3=" + parad3 + ", parad4="
				+ parad4 + ", paran6=" + paran6 + ", observacao=" + observacao
				+ ", vigencia=" + vigencia + "]";
	}

	
	
	
}
