package br.com.tdv.controller;

import java.util.Calendar;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.tdv.model.Aplicacao;
import br.com.tdv.model.AplicacaoPerfil;
import br.com.tdv.model.Perfil;
import br.com.tdv.service.AplicacaoPerfilService;

@Controller
@RequestMapping("/aplicacao_perfil")
public class AplicacaoPerfilController {

	@Autowired
	private AplicacaoPerfilService aplicacaoPerfilService;

	/**
	 * Busca lista de aplicacaoPerfil por aplicacao
	 * @param aplicacaoCodigo
	 * @return JSON
	 */
	@RequestMapping(value="/get/list/por/aplicacao/{aplicacaoCodigo}", method=RequestMethod.GET, produces="application/json")
	public ResponseEntity<String> getPorAplicacao(@PathVariable("aplicacaoCodigo") String aplicacaoCodigo) {
		try {
			List<AplicacaoPerfil> aplicacaoPerfis = this.aplicacaoPerfilService.getPorAplicacao(new Aplicacao(aplicacaoCodigo));
			return new ResponseEntity<String>(new ObjectMapper().writeValueAsString(aplicacaoPerfis ), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * Busca lista de aplicacaoPerfil por aplicacao e perfil
	 * @param aplicacaoCodigo
	 * @param perfilCodigo
	 * @return JSON
	 */
	@RequestMapping(value="/get/list/aplicacao/{aplicacaoCodigo}/perfil/{perfilCodigo}", method=RequestMethod.GET, produces="application/json")
	public ResponseEntity<String> getLista(@PathVariable("aplicacaoCodigo") String aplicacaoCodigo, @PathVariable("perfilCodigo") String perfilCodigo) {
		try {
			List<AplicacaoPerfil> aplicacaoPerfis = this.aplicacaoPerfilService.getLista(new Aplicacao(aplicacaoCodigo), new Perfil(perfilCodigo));
			return new ResponseEntity<String>(new ObjectMapper().writeValueAsString(aplicacaoPerfis ), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR); 
		}
	}
	
	/**
	 * Busca AplicacaoPerfil por Aplicacao, perfil e usuario retornando JSON no corpo do response
	 * @param aplicacaoCodigo
	 * @param perfilCodigo
	 * @param usuario
	 * @return JSON
	 */
	@RequestMapping(value="/get/aplicacao/{aplicacaoCodigo}/perfil/{perfilCodigo}/usuario/{usuario}", method=RequestMethod.GET, produces="application/json")
	public ResponseEntity<String> getPorAppPerfilUsu(@PathVariable("aplicacaoCodigo") String aplicacaoCodigo, @PathVariable("perfilCodigo") String perfilCodigo, @PathVariable("usuario") String usuario) {
		try {
			AplicacaoPerfil aplicacaoPerfil = this.aplicacaoPerfilService.getPorAplicacaoPerfilUsuario(aplicacaoCodigo, perfilCodigo, usuario);
			return new ResponseEntity<String>(new ObjectMapper().writeValueAsString(aplicacaoPerfil ), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * Altera o AplicacaoPerfil pela api Rest, consume (consumes) um aplicacaoPerfil em formato JSON e retorna (produces) o mesmo alterado em formato JSON
	 *  url: /paramettros/aplicacao_perfil/update/perfil/{perfilCodigo}/aplicacao/{aplicacaoCodigo}/usuario/{usuario}
	 *  method: POST 
	 *  consumes: application/json
	 *  produces: application/json
	 * @param perfilCodigo
	 * @param aplicacaoCodigo
	 * @param usuario
	 * @param aplicacaoPerfil
	 * @return JSON
	 */
	@RequestMapping(value="/update/perfil/{perfilCodigo}/aplicacao/{aplicacaoCodigo}/usuario/{usuario}", method=RequestMethod.POST, consumes="application/json", produces="application/json")
	public ResponseEntity<String> update(@PathVariable("perfilCodigo") String perfilCodigo, @PathVariable("aplicacaoCodigo") String aplicacaoCodigo, @PathVariable("usuario") String usuario, @RequestBody AplicacaoPerfil aplicacaoPerfil) {
		try {
			// TODO: Add um dia pelo fato de na hora do transporte para controller back-end esta chegando c/ 1 dia a menos (resolver)
			aplicacaoPerfil.getValidade().add(Calendar.DATE, 1); 
			this.aplicacaoPerfilService.update(aplicacaoPerfil, perfilCodigo, aplicacaoCodigo, usuario); 
			AplicacaoPerfil aplicacaoPerfilAlterado = this.aplicacaoPerfilService.getPorAplicacaoPerfilUsuario(aplicacaoPerfil.getAplicacao().getCodigo(), aplicacaoPerfil.getPerfil().getCodigo(), aplicacaoPerfil.getUsuario());
			return new ResponseEntity<String>(new ObjectMapper().writeValueAsString(aplicacaoPerfilAlterado), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * Grava AplicacaoPerfil pela api rest, consume (consumes) um aplicacaoPerfil em formato JSON e retorna (produces) o mesmo em formato JSON
	 *   url: /parametros/aplicacao_perfil/save
	 *   method: POST
	 *  consumes: application/json
	 *  produces: application/json
	 * @param aplicacaoPerfil = recebe um JSON e deserializa para um objeto AplicacaoPerfil
	 * @return JSON
	 */
	@RequestMapping(value="/save", method=RequestMethod.POST, consumes="application/json", produces="application/json")
	public ResponseEntity<String> save(@RequestBody AplicacaoPerfil aplicacaoPerfil) {
		try {
			// TODO: Add um dia pelo fato de na hora do transporte para controller back-end esta chegando c/ 1 dia a menos (resolver)
			aplicacaoPerfil.getValidade().add(Calendar.DATE, 1); 
			this.aplicacaoPerfilService.save(aplicacaoPerfil);
			AplicacaoPerfil aplicacaoPerfilSaved = this.aplicacaoPerfilService.getPorAplicacaoPerfilUsuario(aplicacaoPerfil.getAplicacao().getCodigo(), 
																											aplicacaoPerfil.getPerfil().getCodigo(), 
																											aplicacaoPerfil.getUsuario());
			return new ResponseEntity<String>(new ObjectMapper().writeValueAsString(aplicacaoPerfilSaved ), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
