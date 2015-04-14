package br.com.tdv.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import br.com.tdv.builder.AplicacaoBuilder;
import br.com.tdv.model.Aplicacao;
import br.com.tdv.service.AplicacaoService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath*:spring-context.xml" })
public class AplicacaoControllerTest {
	
	@InjectMocks
	private AplicacaoController controller;

	private MockMvc mockMvc;
		
	private Aplicacao aplicacao;
	
	@Mock
	private AplicacaoService aplicacaoService; 

	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);
		mockMvc = MockMvcBuilders.standaloneSetup(controller).build();	
		AplicacaoBuilder appBuild = new AplicacaoBuilder();
		aplicacao = appBuild.comCodigo("carreg").build();
	}

	@Test
	public void pegaAplicacaoPorCodigoERetornaJSON() throws Exception {
		mockMvc.perform(get("/aplicacao/get/por/codigo/"+aplicacao.getCodigo()))
				  .andExpect(status().isOk())
				  .andExpect(content().contentType(MediaType.APPLICATION_JSON));
	}

}
