package br.com.tdv.controller;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.tdv.model.Aplicacao;
import br.com.tdv.service.AplicacaoService;

@Controller
@RequestMapping("/aplicacao")
public class AplicacaoController {

	@Autowired
	private AplicacaoService aplicacaoService;

	/**
	 * Busca aplicacao pelo codigo e retorna no corpo do response o mesmo em formto JSON
	 * @param codigo
	 * @return JSON
	 */
	@RequestMapping(value="/get/por/codigo/{codigo}", method=RequestMethod.GET, produces="application/json")
	public ResponseEntity<String> getPorCodigo(@PathVariable("codigo") String codigo) {
		try {
			Aplicacao aplicacao = this.aplicacaoService.get(codigo);
			return new ResponseEntity<String>(new ObjectMapper().writeValueAsString(aplicacao), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.OK);
		}
	}
	
}
