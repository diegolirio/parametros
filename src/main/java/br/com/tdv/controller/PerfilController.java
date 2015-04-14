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
import br.com.tdv.model.Perfil;
import br.com.tdv.service.PerfilService;

@Controller
@RequestMapping("/perfil")
public class PerfilController {
	
	@Autowired
	private PerfilService perfilService;

	/**
	 * Retorna lista de perfil(JSON) por aplicacao no corpo do response
	 * @param aplicacaoCodigo
	 * @return JSON
	 */
	@RequestMapping(value="/get/lista/por/aplicacao/{aplicacaoCodigo}", method=RequestMethod.GET, produces="application/json")
	public ResponseEntity<String> getListaPorAplicacao(@PathVariable("aplicacaoCodigo") String aplicacaoCodigo) { 
		try {
			List<Perfil> perfis = this.perfilService.getListaPorAplicacao(new Aplicacao(aplicacaoCodigo, null));
			return new ResponseEntity<String>(new ObjectMapper().writeValueAsString(perfis ), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * retorna o perfil/parametro(JSON) por codigo no corpo do response
	 * @param codigo
	 * @return JSON
	 */
	@RequestMapping(value="/get/por/codigo/{codigo}", method=RequestMethod.GET, produces="application/json")
	public ResponseEntity<String> getPorCodigo(@PathVariable("codigo") String codigo) {
		try {
			Perfil peril = this.perfilService.getPorCodigo(codigo);
			return new ResponseEntity<String>(new ObjectMapper().writeValueAsString(peril ), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * Busca lista de Perfil que contem a descricao passada por parametro
	 * @param descricao
	 * @return JSON
	 */
	@RequestMapping(value="/get/list/contem/descricao/", method=RequestMethod.GET, produces="application/json")
	public ResponseEntity<String> getListContemDescricao(String descricao, String aplicacaoCodigo) {
		try {
			List<Perfil> perfis = this.perfilService.getListContemDescricao(descricao, aplicacaoCodigo);
			return new ResponseEntity<String>(new ObjectMapper().writeValueAsString(perfis), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST, consumes="application/json", produces="application/json")
	public ResponseEntity<String> save(@RequestBody Perfil perfil) {
		
		System.out.println(perfil);
		
		try {
			// TODO: Add um dia pelo fato de na hora do transporte para controller back-end esta chegando c/ 1 dia a menos (resolver)
			perfil.getVigencia().add(Calendar.DATE, 1); 
			this.perfilService.save(perfil);
			Perfil perfilSaved = this.perfilService.getPorCodigo(perfil.getCodigo());
			return new ResponseEntity<String>(new ObjectMapper().writeValueAsString(perfilSaved), HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	 
	@RequestMapping(value="/update/{codigoOld}", method=RequestMethod.POST, consumes="application/json", produces="application/json")
	public ResponseEntity<String> update_(@RequestBody Perfil perfil, @PathVariable("codigoOld") String codigoOld) {
		try {
			// TODO: Add um dia pelo fato de na hora do transporte para controller back-end esta chegando c/ 1 dia a menos (resolver)
			perfil.getVigencia().add(Calendar.DATE, 1); 
			this.perfilService.update(perfil, codigoOld);
			Perfil perfilAlterado = this.perfilService.getPorCodigo(perfil.getCodigo());
			return new ResponseEntity<String>(new ObjectMapper().writeValueAsString(perfilAlterado), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
}
