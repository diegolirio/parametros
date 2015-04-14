/**
 * AplicacaoPerfilService
 */
app.factory('AplicacaoPerfilService', ['$http', function($http) {
	
	var _getListaPorAplicacao = function(aplicacao) {
		return $http.get(SERVER_APP + '/aplicacao_perfil/get/list/por/aplicacao/'+aplicacao.codigo);
	};
	
	var _getLista = function(aplicacao, perfil) {
		return $http.get(SERVER_APP + '/aplicacao_perfil/get/list/aplicacao/'+aplicacao.codigo+'/perfil/'+perfil.codigo);
	};
	
	var _getPorAppPerfilUsu = function(aplicacao, perfil, usuario) {
		return $http.get(SERVER_APP + '/aplicacao_perfil/get/aplicacao/'+aplicacao+'/perfil/'+perfil+'/usuario/'+usuario);
	};
	
	var _update = function(perfil, usuario, aplicacaoPerfil) {
		return $http.post(SERVER_APP + '/aplicacao_perfil/update/perfil/'+perfil.codigo+'/aplicacao/'+$.trim(perfil.aplicacao.codigo)+'/usuario/'+usuario, aplicacaoPerfil);
	};
	
	var _save = function(aplicacaoPerfil) {
		return $http.post(SERVER_APP + '/aplicacao_perfil/save', aplicacaoPerfil);
	};
	
	return {
		
		getListaPorAplicacao : _getListaPorAplicacao,
		
		getLista : _getLista,
		
		getPorAppPerfilUsu : _getPorAppPerfilUsu,
		
		update : _update,
		
		save : _save
			
	};
	
}]);