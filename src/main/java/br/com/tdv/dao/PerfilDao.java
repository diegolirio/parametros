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

import br.com.tdv.builder.Common;
import br.com.tdv.builder.PerfilBuilder;
import br.com.tdv.helper.PerfilHelper;
import br.com.tdv.model.Aplicacao;
import br.com.tdv.model.Perfil;

@Repository("perfilDao")
public class PerfilDao {

	/**
	 * Constroi um objeto perfil atraves do ResultSet
	 * @param rs
	 * @return Perfil
	 * @throws SQLException
	 * @throws ParseException
	 */
	private Perfil toPerfil(ResultSet rs) throws SQLException, ParseException {
		PerfilBuilder perfilBuild = new PerfilBuilder();
		Perfil p = perfilBuild
				.comAplicacao(new Aplicacao(rs.getString("USU_APLICACAO_CODIGO")))
				.comCodigo(rs.getString("USU_PERFIL_CODIGO"))
				.comDescricao(rs.getString("USU_PERFIL_DESCRICAO"))
				.comDescricaoResumidad(rs.getString("USU_PERFIL_DESCRICAORESUMIDA"))
				.comVigencia(Common.toCalendar(rs.getString("USU_PERFIL_VIGENCIA")))
				.comParat(rs.getString("USU_PERFIL_PARAT"))
				.comObservacao(rs.getString("USU_PERFIL_OBSERVACAO"))					
				.comHorario(rs.getString("USU_PERFIL_HORARIO"))
				.comParad1(Common.toCalendar(rs.getString("USU_PERFIL_PARAD1")))
				.comParad2(Common.toDate(rs.getString("USU_PERFIL_PARAD2")))
				.comParad3(Common.toDate(rs.getString("USU_PERFIL_PARAD3")))
				.comParad4(Common.toDate(rs.getString("USU_PERFIL_PARAD4")))
				.comParan1(rs.getDouble("USU_PERFIL_PARAN1"))
				.comParan2(rs.getDouble("USU_PERFIL_PARAN2"))
				.comParan3(rs.getDouble("USU_PERFIL_PARAN3"))
				.comParan4(rs.getDouble("USU_PERFIL_PARAN4"))
				.comParan5(rs.getDouble("USU_PERFIL_PARAN5"))
				.comParan6(rs.getDouble("USU_PERFIL_PARAN6"))
				.build();
		return p;
	}
	
	/**
	 * Busca Lista de Perfis(Parametros) de uma aplicacao no Oracle
	 * @param aplicacao
	 * @return @Code { List<Perfil> }
	 */
	public List<Perfil> getList(Aplicacao aplicacao) {
        List<Perfil> perfis = null;
        Connection conn = null; 
        CallableStatement stmt = null;
        ResultSet rs = null; 
        System.out.println(aplicacao.getCodigo());
        try {
            conn = FactorConnection.getConnection();
            stmt = conn.prepareCall("{call tdvadm.Pkg_Usu_Parametros.Sp_Get_Perfis(:aplicacao, :cursor, :status, :message)}");
            
            stmt.setString(1, aplicacao.getCodigo());
            stmt.registerOutParameter(2, OracleTypes.CURSOR);
            stmt.registerOutParameter(3, OracleTypes.CHAR);
            stmt.registerOutParameter(4, OracleTypes.VARCHAR);
            stmt.execute();		            
            
            if(stmt.getString(3).charAt(0) != 'N') 
            	throw new RuntimeException(stmt.getString(4));
            
            rs = ((OracleCallableStatement)stmt).getCursor(2);
            
            perfis = new ArrayList<Perfil>();                                  
            while(rs.next()) {
            	Perfil p = this.toPerfil(rs);
            	perfis.add(p);
            }
            System.out.println(perfis.size());
        } catch(Exception e) {
            throw new RuntimeException(e);
        } finally {
            FactorConnection.close(conn, stmt, rs);
        } 
        return perfis;
    }

	/**
	 * Executa proc para pegar Perfil por codigo
	 * @param codigo
	 * @return Perfil
	 */
	public Perfil get(String codigo) {
        Perfil perfil = null;
        Connection conn = null; 
        CallableStatement stmt = null;
        ResultSet rs = null; 
        try {
            conn = FactorConnection.getConnection();
            stmt = conn.prepareCall("{call tdvadm.Pkg_Usu_Parametros.Sp_Get_Perfil(:codigo, :cursor, :status, :message)}");
            
            stmt.setString(1, codigo);
            stmt.registerOutParameter(2, OracleTypes.CURSOR);
            stmt.registerOutParameter(3, OracleTypes.CHAR);
            stmt.registerOutParameter(4, OracleTypes.VARCHAR);
            stmt.execute();		            
            
            if(stmt.getString(3).charAt(0) != 'N') 
            	throw new RuntimeException(stmt.getString(4));
            
            rs = ((OracleCallableStatement)stmt).getCursor(2);
            
            if(rs.next())
            	perfil = this.toPerfil(rs);            
    
        } catch(Exception e) {
            throw new RuntimeException(e);
        } finally {
            FactorConnection.close(conn, stmt, rs);
        } 		
		return perfil;
	}

	/**
	 * Executa Proc de Update de Perfil 
	 * @param perfil
	 * @param codigoOld 
	 */
	public void update(Perfil perfil, String codigoOld) {
		Connection conn = null;
		CallableStatement stmt = null;
		try {
			conn = FactorConnection.getConnection();
			stmt = conn.prepareCall("{call tdvadm.Pkg_Usu_Parametros.Sp_Set_UpdatePerfil(:xmlIn, :codigoOld, :status, :message)}");
			stmt.setString(1, PerfilHelper.toXml(perfil));
			stmt.setString(2, codigoOld); 
			stmt.registerOutParameter(3, OracleTypes.CHAR);
			stmt.registerOutParameter(4, OracleTypes.VARCHAR);
			
			stmt.execute();

			if(stmt.getString(3).charAt(0) != 'N')
				throw new RuntimeException(stmt.getString(4));
			
		} catch(Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			FactorConnection.close(conn, stmt);
		}
	}

	public void save(Perfil perfil) {
		Connection conn = null;
		CallableStatement stmt = null;
		try {
			conn = FactorConnection.getConnection();
			stmt = conn.prepareCall("{call tdvadm.Pkg_Usu_Parametros.Sp_Set_InsertPerfil(:xmlIn, :status, :message)}");
			stmt.setString(1, PerfilHelper.toXml(perfil));
			stmt.registerOutParameter(2, OracleTypes.CHAR);
			stmt.registerOutParameter(3, OracleTypes.VARCHAR);
			
			stmt.execute();

			if(stmt.getString(2).charAt(0) != 'N')
				throw new RuntimeException(stmt.getString(3));
			
		} catch(Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			FactorConnection.close(conn, stmt);
		}
	}

	/**
	 * Busca lista de perfil no BD que contem a descricao de uma determinada aplicacao
	 * @param descricao
	 * @param aplicacaoCodigo
	 * @return List<Perfil>
	 */
	public List<Perfil> getListContemDescricao(String descricao, String aplicacaoCodigo) {
		Connection conn = null;
		CallableStatement stmt = null;
		ResultSet rs = null;
		List<Perfil> list = null;
		try {
			conn = FactorConnection.getConnection();
			stmt = conn.prepareCall("{call tdvadm.Pkg_Usu_Parametros.Sp_Get_PerfisContemDescricao(:descricao, :aplicacaoCodigo, :cursor, :status, :message)}");
			stmt.setString(1, descricao);
			stmt.setString(2, aplicacaoCodigo);
			stmt.registerOutParameter(3, OracleTypes.CURSOR);
			stmt.registerOutParameter(4, OracleTypes.CHAR);
			stmt.registerOutParameter(5, OracleTypes.VARCHAR);
			stmt.execute();
			if(stmt.getString(4).charAt(0) != 'N')
				throw new RuntimeException(stmt.getString(5));
			rs = ((OracleCallableStatement) stmt).getCursor(3);
			list = new ArrayList<Perfil>();
			while (rs.next()) {
				list.add(this.toPerfil(rs));
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			FactorConnection.close(conn, stmt, rs);
		}
		return list;
	}

}
