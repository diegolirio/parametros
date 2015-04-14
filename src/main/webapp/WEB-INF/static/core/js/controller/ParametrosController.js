/**
 * ParametrosController.js
 */
app.controller('ParametrosController', ['$filter', 'AplicacaoService', 'PerfilService', 'AplicacaoPerfilService', 
                                        function($filter, AplicacaoService, PerfilService, AplicacaoPerfilService) {

	var self = this;

	self.msgInfo = null;
	self.msgAplicacaoPerfilInfo = null;
	
	/*
	 * Codigo antigo do perfil para alteracao, caso o mesmo seja alterado!
	 */
	var codigoOld = null;	
	
	/*
	 * Usuario utilizado para atualizar AplicacaoPerfil
	 */
	//var usuarioOld = null;
	var appPerfilOld = {};
	var indexPerfilOld = {};
	
	var StatusTransaction = {
		    INSERT: 0, 
		    EDIT: 1,
		    POST: 2,
		    DELETE: 3
		};	
	
	// Transacao de Status do Perfil
	var statusTrans = 0;	

	// Transacao de Status da AplicacaoPerfil (usuario)
	var statusTransAppPerfil = 0;
	
	/*
	 * Status de Transacao
	 */
	self.setStatusTrans = function(stsTrans) {
		statusTrans = stsTrans;
		switch (statusTrans) {
		case StatusTransaction.INSERT:
			self.perfil = null;
			self.aplicacaoPerfil = null;
			break;
		case StatusTransaction.EDIT:
			//alert('ALTERAR');
			break;
		case StatusTransaction.POST:
			alert('SALVAR');
			break;
		case StatusTransaction.DELETE:
			alert('EXCLUIR');
			break;			
		}
		$('#idParamCodigo').focus();
	};		

	/*
	 * Status de Transacao
	 */
	self.setStatusTransAppPerfil = function(stsTrans) {
		statusTransAppPerfil = stsTrans;
		switch (statusTransAppPerfil) {
		case StatusTransaction.INSERT:
			self.aplicacaoPerfil = null;
			break;
		case StatusTransaction.EDIT:
			//alert('ALTERAR');
			break;
		case StatusTransaction.POST:
			alert('SALVAR');
			break;
		case StatusTransaction.DELETE:
			alert('EXCLUIR');
			break;			
		}
		$('#idParamCodigo').focus();
	};	
	
	/*
	 * Limpa a tela
	 */
	var clearUI = function() {
		self.aplicacao = null;
		self.perfil = null;
		self.perfis = null;
		self.aplicacaoPerfis = null;
		self.aplicacaoPerfil = null;
		self.msgInfo = null;
		var codigoOld = null;		
	};
	
	/*
	 * Convert Format data de ano/mes/dia para dia/mes/ano
	 */
	var toFormatDDMMYYYY = function(data) {
		if(data != null)
			return $filter('date')(new Date(data), "dd/MM/yyyy");
		return '';
	};
	/*
	 * Convert Format data de dia/mes/ano para ano-mes-dia
	 */
	var toFormatYYYY_MM_DD = function(data) {
		if(data != null)
			return $filter('date')(new Date(data), "yyyy-MM-dd");
		return '';
	};
	
	/*
	 * set atributo perfil
	 */
	var setPerfil = function(perfil) {
		self.perfil = perfil;
		console.log(self.perfil.vigencia);
		self.perfil.vigencia = toFormatYYYY_MM_DD(self.perfil.vigencia);
		//self.perfil.parad1 = toFormatDDMMYYYY(self.perfil.parad1);
		//self.perfil.parad2 = toFormatDDMMYYYY(self.perfil.parad2);
		//self.perfil.parad3 = toFormatDDMMYYYY(self.perfil.parad3);
		//self.perfil.parad4 = toFormatDDMMYYYY(self.perfil.parad4);		
		self.setStatusTrans(StatusTransaction.EDIT); 
		codigoOld = self.perfil.codigo;
	};
	
	/*
	 * set atributo aplicacaoPerfil
	 */
	var setAplicacaoPerfil = function(aplicacaoPerfil) {
		self.aplicacaoPerfil = aplicacaoPerfil;
		self.aplicacaoPerfil.vigencia = toFormatYYYY_MM_DD(self.aplicacaoPerfil.vigencia); 
		self.aplicacaoPerfil.validade = toFormatYYYY_MM_DD(self.aplicacaoPerfil.validade);			
		self.aplicacaoPerfil.dataCadastro = toFormatYYYY_MM_DD(self.aplicacaoPerfil.dataCadastro);			
		self.aplicacaoPerfil.dataAlteracao = toFormatYYYY_MM_DD(self.aplicacaoPerfil.dataAlteracao);			
		//self.aplicacaoPerfil.parad1 = toFormatDDMMYYYY(self.aplicacaoPerfil.parad1);
		//self.aplicacaoPerfil.parad2 = toFormatDDMMYYYY(self.aplicacaoPerfil.parad2);
		//self.aplicacaoPerfil.parad3 = toFormatDDMMYYYY(self.aplicacaoPerfil.parad3);
		//self.aplicacaoPerfil.parad4 = toFormatDDMMYYYY(self.aplicacaoPerfil.parad4);			
		self.setStatusTransAppPerfil(StatusTransaction.EDIT); 
	};	
	
	/*
	 * Evento que busca Aplicacao por codigo
	 */
	self.btnGetAplicao = function(codigo) {
		clearUI();
		if (codigo != undefined) {
			self.mgsGetApp = null;
			AplicacaoService.getPorCodigo(codigo.toLowerCase()).then(function(resp) {
				
				self.aplicacao = resp.data;
				if(self.aplicacao.codigo == null) { 
					self.mgsGetApp = 'Aplicação não existe';
					clearUI();
				} 
				else if(self.aplicacao != null) { 
					
					PerfilService.getListaPorAplicacao(self.aplicacao).then(function(respPerfis) {
						self.perfis = respPerfis.data;
						if(self.perfis.length > 0) 
							self.getPerfilPorCodigo(self.perfis[0].codigo);
						else
							self.mgsGetApp = 'Aplicação não contém parametros cadastrados';
					}, function(errorPerfis) {
						self.mgsGetApp = 'Erro ao buscar Lista de parametros: ' + errorPerfis.data;
						alert(self.msgGetApp); 
					});
					
				}
				
			}, function(error) {
				self.mgsGetApp = 'Erro ao buscar aplicacao: ' + error.data;
				alert(self.msgGetApp);
			});
			
		} else self.mgsGetApp = 'Digite o codigo da Aplicação';
	};
	
	/**
	 * Pega a aplicacaoPerfil no back-end
	 * @Param aplicacaoCodigo = codigo da aplicacao
	 * @Param perfilCodigo = codigo do Perfil
	 * @Param usuario = usuario do aplicacaoPerfil
	 * @param appPerfil = parametro a ser alterado, ficara guardado em uma outra var para realizar a alteracao
	 */
	self.getAplicacaoPerfil = function(aplicacaoCodigo, perfilCodigo, usuario, appPerfil) {
		AplicacaoPerfilService.getPorAppPerfilUsu(aplicacaoCodigo, perfilCodigo, usuario).then(function(resp) {
			setAplicacaoPerfil(resp.data);
			//alert(JSON.stringify(resp.data));
			//usuarioOld = usuario;
			appPerfilOld = appPerfil;
		}, function(error) {
			alert(error.data);
		});
	};
	
	/*
	 * Pega o perfil por codigo
	 */ 
	self.getPerfilPorCodigo = function(codigo) {
		PerfilService.getPorCodigo(codigo).then(function(resp) {
			setPerfil(resp.data);
			indexPerfilOld = self.perfis.indexOf(resp.data);

			AplicacaoPerfilService.getLista(self.aplicacao, self.perfil).then(function(resp) {
				self.aplicacaoPerfilUsuarios = resp.data;
			}, function(errorAP) {
				alert('Erro ao buscar Perfis da Aplicação: ' + errorAP.data);
			});			
			
		}, function(error) {
			alert(error.data);
		});
	};

			
	/*
	 * Buttons AplicacaoPerfil 
	 */
	self.salvarPerfil = function(perfil) {
		
		perfil.codigo = perfil.codigo.toUpperCase();
		
		//perfil.vigencia = toFormatYYYY_MM_DD(perfil.vigencia);
		//console.log(JSON.stringify(perfil));

		// Insert...
		if(StatusTransaction.INSERT == statusTrans) {		
		
			perfil.usuarioCadastro = 'jsantos';
			perfil.usuarioAlterou = 'jsantos';
			perfil.aplicacao = self.aplicacao;
			PerfilService.save(perfil).then(function(resp) { 
				self.perfis.push(resp.data);
				setPerfil(resp.data);
				self.setStatusTrans(StatusTransaction.EDIT);
				self.msgInfo = 'Perfil '+self.perfil.codigo+' gravado com sucesso!';
			}, function(error) {
				alert('Error ao gravar perfil: ' + error.data);
			});
			
		}
		// Update...
		else if(StatusTransaction.EDIT == statusTrans) {
			
			PerfilService.update(perfil, codigoOld).then(function(resp) {
				// busca o perfil e seta novamente.
				self.getPerfilPorCodigo(resp.data.codigo); //setPerfil(resp.data);
				self.setStatusTrans(StatusTransaction.EDIT);
				self.msgInfo = 'Perfil '+self.perfil.codigo+' alterado com sucesso!';
			}, function(error) {
				alert('Error ao alterar perfil:' + error.data); 
			});
			
		}
		
	};
//	
//	self.excluir = function(perfil) {
//		
//	};
//	
//	self.cancelar = function() {
//		
//	};
	
	self.novoPerfil = function() {
		self.setStatusTrans(StatusTransaction.INSERT);
	};
	
	/*
	 * Buttons AplicacaoPerfil
	 */
	self.saveAplicacaoPerfil = function(aplicacaoPerfil) {

		aplicacaoPerfil.usuarioAlteracao = 'jsantos'; 
		aplicacaoPerfil.usuarioCadastro = 'jsantos'; 
		aplicacaoPerfil.aplicacao = self.aplicacao;
		aplicacaoPerfil.perfil = self.perfil;
		
		console.log(JSON.stringify(aplicacaoPerfil));
		
		if(StatusTransaction.INSERT == statusTransAppPerfil) {		
			
			// TODO: horario chumbado do perfil, mudar para pegar do form aplicacaoPerfil
			aplicacaoPerfil.horario = aplicacaoPerfil.perfil.horario;
			
			AplicacaoPerfilService.save(self.aplicacaoPerfil).then(function(resp) {

				// busca o aplicacaoPerfil e popula novamente, seta o atributo self.aplicacaoPerfil
				self.getAplicacaoPerfil(self.aplicacao.codigo, self.perfil.codigo, self.aplicacaoPerfil.usuario, resp.data);
				// Add no json
				self.aplicacaoPerfilUsuarios.push(self.aplicacaoPerfil);
				self.msgAplicacaoPerfilInfo = 'Perfil do Usuario cadastro com sucesso!';
				alert('Perfil do Usuario cadastro com sucesso!');
				
			}, function(error) {
				alert(error.data);
			});
			
		} else if(StatusTransaction.EDIT == statusTransAppPerfil) {
			
			AplicacaoPerfilService.update(self.perfil, appPerfilOld.usuario, aplicacaoPerfil).then(function(resp) {
				
				// busca o aplicacaoPerfil e popula novamente, seta o atributo self.aplicacaoPerfil
				self.getAplicacaoPerfil(self.aplicacao.codigo, self.perfil.codigo, resp.data.usuario, resp.data);
				
				// Alterar a linha da grid
				var index = self.aplicacaoPerfilUsuarios.indexOf(appPerfilOld);
				self.aplicacaoPerfilUsuarios[index] = resp.data;
				// $scope.estados.splice(index, 1);
				
				self.msgAplicacaoPerfilInfo = 'Perfil do Usuario alterado com sucesso!';
				
			}, function(error) {
				alert(error.data);
			});
		}
	};
	
	self.novoAplicacaoPeril = function() {
		// alert('Desenvolvendo...');
		self.setStatusTransAppPerfil(StatusTransaction.INSERT);
	};
	
//	self.excluirAplicacaoPerfil = function(aplicacaoPerfil) {
//		
//	};
//	
//	self.cancelarAplicacaoPerfil = function() {
//		
//	};
//	
	
	self.closeMsgInfo = function() {
		self.msgInfo = null;
	};
	
	self.closeMsgAppPerfilInfo = function() {
		self.msgAplicacaoPerfilInfo = null;
	};
	
	/**
	 * Busca os perfis por descricao
	 */
	self.filterPerfis = function(descricao, aplicacaoCodigo) {
		if (descricao.length > 2 || descricao.length == 0) {
			PerfilService.getListContemDescricao(descricao, aplicacaoCodigo).then(function(resp) {
				self.perfis = resp.data;
				//alert(JSON.stringify(self.perfis));
			}, function(error) {
				alert(error.data);
			});
		} else if (descricao.length === 0) {
			//self.btnGetAplicao(self.codigo);
		}
	};
	
	/**
	 * Mostra o horario de permissao do usuario
	 */
	self.horarios = function() {
		alert('Em Desenvolvimento...');
	};
	
	
}]);
