package br.com.tdv.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.internal.OracleTypes;

import org.springframework.stereotype.Repository;

import br.com.tdv.builder.AplicacaoBuilder;
import br.com.tdv.model.Aplicacao;

@Repository("aplicacaoDao")
public class AplicacaoDao {
	
	private Aplicacao toAplicacao(ResultSet rs) throws SQLException {
		AplicacaoBuilder appBuild = new AplicacaoBuilder();
		Aplicacao app = appBuild
							.comCodigo(rs.getString("USU_APLICACAO_CODIGO"))
							.comDescricao(rs.getString("USU_APLICACAO_DESCRICAO"))
							.build();
		return app;
	}

	/**
	 * Pega Aplicacao no Oracle por Codigo
	 * @param codigo
	 * @return Aplicacao
	 */
	public Aplicacao get(String codigo) {
        Aplicacao aplicacao = null;
        Connection conn = null; 
        CallableStatement stmt = null;
        ResultSet rs = null; 
        try {
            conn = FactorConnection.getConnection();
            stmt = conn.prepareCall("{call tdvadm.Pkg_Usu_Parametros.Sp_Get_Aplicacao(:codigo, :cursor, :status, :message)}");
            
            stmt.setString(1, codigo);
            stmt.registerOutParameter(2, OracleTypes.CURSOR);
            stmt.registerOutParameter(3, OracleTypes.CHAR);
            stmt.registerOutParameter(4, OracleTypes.VARCHAR);
            stmt.execute();		            
            
            if(stmt.getString(3).charAt(0) != 'N') 
            	throw new RuntimeException(stmt.getString(4));
            
            rs = ((OracleCallableStatement)stmt).getCursor(2);
            
            if(rs.next()) 
            	aplicacao = this.toAplicacao(rs);            
        } catch(Exception e) {
            throw new RuntimeException(e);
        } finally {
            FactorConnection.close(conn, stmt, rs);
        } 		
		return aplicacao;
	}

}
