/**
 * PerfilService: Classe que faz a comunicacao com o back-end do Perfil
 */
app.factory('PerfilService', ['$http', function($http) {
	
	var _getListaPorAplicacao = function(aplicacao) {
		return $http.get(SERVER_APP + '/perfil/get/lista/por/aplicacao/'+ aplicacao.codigo);
	};
	
	var _getPorCodigo = function(codigo) {
		return $http.get(SERVER_APP + '/perfil/get/por/codigo/'+codigo);
	};
	
	var _update = function(perfil, codigoOld) {
		return $http.post(SERVER_APP + '/perfil/update/'+codigoOld, perfil);
	};
	
	var _save = function(perfil) {
		return $http.post(SERVER_APP + '/perfil/save', perfil);
	};	
	
	/**
	 * Busca Lista que contem descricao do perfil(parametro).
	 */
	var _getListContemDescricao = function(descricao, aplicacaoCodigo) {
		return $http.get(SERVER_APP + '/perfil/get/list/contem/descricao/?descricao='+descricao+'&aplicacaoCodigo='+aplicacaoCodigo );
	};
	
	return {
		
		getListaPorAplicacao : _getListaPorAplicacao,
		
		getPorCodigo : _getPorCodigo,
		
		getListContemDescricao : _getListContemDescricao,
		
		update : _update,
		
		save : _save
		
	};
	
}]);