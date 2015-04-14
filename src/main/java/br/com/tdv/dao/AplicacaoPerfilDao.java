package br.com.tdv.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.internal.OracleTypes;

import org.springframework.stereotype.Repository;

import br.com.tdv.builder.AplicacaoPerfilBuilder;
import br.com.tdv.builder.Common;
import br.com.tdv.helper.AplicacaoPerfilHelper;
import br.com.tdv.model.Aplicacao;
import br.com.tdv.model.AplicacaoPerfil;
import br.com.tdv.model.Perfil;

@Repository("aplicacaoPerfilDao")
public class AplicacaoPerfilDao {
	
	private AplicacaoPerfil toAplicacaoPerfil(ResultSet rs) throws SQLException, ParseException {
		AplicacaoPerfilBuilder apb = new AplicacaoPerfilBuilder();
		AplicacaoPerfil ap = apb
								.comAplicacao(new Aplicacao(rs.getString("USU_APLICACAO_CODIGO")))
								.comPerfil(new Perfil(rs.getString("USU_PERFIL_CODIGO")))
								.comUsuario(rs.getString("USU_USUARIO_CODIGO"))
								.comRota(rs.getString("GLB_ROTA_CODIGO"))
								.comGrupoCodigo(rs.getString("USU_GRUPO_CODIGO"))
								.comAtivo(rs.getString("USU_APLICACAOPERFIL_ATIVO"))
								.comDataAlteracao(Common.toCalendar(rs.getString("USU_APLICACAOPERFIL_DTALT")))
								.comDataCadastro(Common.toCalendar(rs.getString("USU_APLICACAOPERFIL_DTCAD")))
								.comVigencia(Common.toCalendar(rs.getString("USU_APLICACAOPERFIL_VIGENCIA")))
								.comValidade(Common.toCalendar(rs.getString("USU_APLICACAOPERFIL_VALIDADE")))
								//.comDescricao(rs.getString("USU_APLICACAOPERFIL_DESCRICAO"))
								.comHorario(rs.getString("USU_APLICACAOPERFIL_HORARIO"))
								//.comParad1(Common.toDate(rs.getString("USU_APLICACAOPERFIL_PARAD1")))
								//.comParad2(Common.toDate(rs.getString("USU_APLICACAOPERFIL_PARAD2")))
								//.comParad3(Common.toDate(rs.getString("USU_APLICACAOPERFIL_PARAD3")))
								//.comParad4(Common.toDate(rs.getString("USU_APLICACAOPERFIL_PARAD4")))
								.comParan1(rs.getDouble("USU_APLICACAOPERFIL_PARAN1")) 
								.comParan2(rs.getDouble("USU_APLICACAOPERFIL_PARAN2"))
								.comParan3(rs.getDouble("USU_APLICACAOPERFIL_PARAN3"))
								.comParan4(rs.getDouble("USU_APLICACAOPERFIL_PARAN4"))
								.comParan5(rs.getDouble("USU_APLICACAOPERFIL_PARAN5"))
								.comParan6(rs.getDouble("USU_APLICACAOPERFIL_PARAN6"))
								.comParat(rs.getString("USU_APLICACAOPERFIL_PARAT"))
								.comUsuariocadastro(rs.getString("USU_USUARIO_CODIGOCAD"))
								.comUsuarioAlterou(rs.getString("USU_USUARIO_CODIGOALT"))
								.build();
		return ap;
	}

	public List<AplicacaoPerfil> getPorAplicacao(Aplicacao aplicacao) {
		List<AplicacaoPerfil> aplicacaoPerfis = null;
		Connection conn = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = FactorConnection.getConnection();
			stmt = conn.prepareCall("{call tdvadm.Pkg_Usu_Parametros.Sp_Get_AplicacaoPerfis(:aplicacao, :cursor, :status, :message)}");
			stmt.setString(1, aplicacao.getCodigo());
            stmt.registerOutParameter(2, OracleTypes.CURSOR);
            stmt.registerOutParameter(3, OracleTypes.CHAR);
            stmt.registerOutParameter(4, OracleTypes.VARCHAR);
            stmt.execute();
            if(stmt.getString(3).charAt(0) != 'N') 
            	throw new RuntimeException(stmt.getString(4));
            
            aplicacaoPerfis = new ArrayList<AplicacaoPerfil>();
            rs = ((OracleCallableStatement)stmt).getCursor(2);
            while (rs.next()) {
            	AplicacaoPerfil ap = this.toAplicacaoPerfil(rs);
            	aplicacaoPerfis.add(ap);
			}
            
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		return aplicacaoPerfis;
	}

	public List<AplicacaoPerfil> getLista(Aplicacao aplicacao, Perfil perfil) {
		List<AplicacaoPerfil> aplicacaoPerfis = null;
		Connection conn = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = FactorConnection.getConnection();
			stmt = conn.prepareCall("{call tdvadm.Pkg_Usu_Parametros.Sp_Get_AplicacaoPerfilUsuarios(:aplicacao, :perfil, :cursor, :status, :message)}");
			stmt.setString(1, aplicacao.getCodigo());
			stmt.setString(2, perfil.getCodigo());
            stmt.registerOutParameter(3, OracleTypes.CURSOR);
            stmt.registerOutParameter(4, OracleTypes.CHAR);
            stmt.registerOutParameter(5, OracleTypes.VARCHAR);
            stmt.execute();
            if(stmt.getString(4).charAt(0) != 'N') 
            	throw new RuntimeException(stmt.getString(5));
            
            aplicacaoPerfis = new ArrayList<AplicacaoPerfil>();
            rs = ((OracleCallableStatement)stmt).getCursor(3);
            while (rs.next()) {
            	AplicacaoPerfil ap = this.toAplicacaoPerfil(rs);
            	aplicacaoPerfis.add(ap);
			}
            
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		return aplicacaoPerfis;
	}

	public AplicacaoPerfil getPorAplicacaoPerfilUsuario(String aplicacaoCodigo, String perfilCodigo, String usuario) {
		AplicacaoPerfil aplicacaoPerfil = null;
		Connection conn = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = FactorConnection.getConnection();
			stmt = conn.prepareCall("{call tdvadm.Pkg_Usu_Parametros.Sp_Get_AplicacaoPerfil(:aplicacao, :perfil, :usuario, :cursor, :status, :message)}");
			stmt.setString(1, aplicacaoCodigo);
			stmt.setString(2, perfilCodigo);
			stmt.setString(3, usuario);
            stmt.registerOutParameter(4, OracleTypes.CURSOR);
            stmt.registerOutParameter(5, OracleTypes.CHAR);
            stmt.registerOutParameter(6, OracleTypes.VARCHAR);
            stmt.execute();
            if(stmt.getString(5).charAt(0) != 'N') 
            	throw new RuntimeException(stmt.getString(6));
            
            aplicacaoPerfil = new AplicacaoPerfil();
            rs = ((OracleCallableStatement)stmt).getCursor(4);
            if(rs.next()) {
            	aplicacaoPerfil = this.toAplicacaoPerfil(rs);
			}
            
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			FactorConnection.close(conn, stmt, rs);
		}
		return aplicacaoPerfil;
	}

	public void update(AplicacaoPerfil aplicacaoPerfil, String perfil, String aplicacao, String usuario) {
		Connection conn = null;
		CallableStatement stmt = null;
		try {
			conn = FactorConnection.getConnection();
			stmt = conn.prepareCall("{call tdvadm.Pkg_Usu_Parametros.Sp_Set_UpdateAplicacaoPerfil(:appPerfilXmlIn, :perfil, :aplicacao, :usuario, :status, :message)}");
			stmt.setString("appPerfilXmlIn", AplicacaoPerfilHelper.toXml(aplicacaoPerfil));
			stmt.setString("perfil", perfil);
			stmt.setString("aplicacao", aplicacao);
			stmt.setString("usuario", usuario);
			stmt.registerOutParameter("status", OracleTypes.CHAR);
			stmt.registerOutParameter("message", OracleTypes.VARCHAR);
			
			stmt.execute();
			
            if(stmt.getString("status").charAt(0) != 'N') 
            	throw new RuntimeException(stmt.getString("message"));			
			
		} catch(Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			FactorConnection.close(conn, stmt);
		}
		
	}

	/**
	 * 
	 * @param aplicacaoPerfil
	 */
	public void save(AplicacaoPerfil aplicacaoPerfil) {
		Connection conn = null;
		CallableStatement stmt = null;
		try {
			conn = FactorConnection.getConnection();
			stmt = conn.prepareCall("{call tdvadm.Pkg_Usu_Parametros.Sp_Set_InsertAplicacaoPerfil(:appPerfilXmlIn, :status, :message)}");
			stmt.setString("appPerfilXmlIn", AplicacaoPerfilHelper.toXml(aplicacaoPerfil));
			stmt.registerOutParameter("status", OracleTypes.CHAR);
			stmt.registerOutParameter("message", OracleTypes.VARCHAR);
			
			stmt.execute();
			
			if(stmt.getString("status").charAt(0) != 'N')
				throw new RuntimeException(stmt.getString("message"));
			
		} catch(Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	
	
}
