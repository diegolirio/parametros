package br.com.tdv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Home Controller Classe para inicializacao da aplicacao Java Web e SPA
 */
@Controller
public class HomeController {
	
	/**
	 * Root pagina base da Aplicacao Web SPA
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String base() {
		return "index";
	}
	
	/**
	 * Pagina content home
	 * @return String
	 */
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String home() {
		return "home";
	}	   
	
	/**
	 * Pagina content parametros.jsp
	 * @return String
	 */
	@RequestMapping(value="/parametros", method=RequestMethod.GET)
	public String pageParametros() {
		return "parametros";
	}		
	
	@RequestMapping(value="/widgets", method=RequestMethod.GET)
	public String widgets() {
		return "widgets";
	}
}
