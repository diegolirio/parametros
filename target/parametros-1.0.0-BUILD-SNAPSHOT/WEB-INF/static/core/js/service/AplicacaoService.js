/**
 * AplicacaoService
 */
app.factory('AplicacaoService', ['$http', function($http) {
	
	var _getPorCodigo = function(codigo) {
		return $http.get(SERVER_APP + '/aplicacao/get/por/codigo/'+codigo);
	};
	
	return {
		
		getPorCodigo : _getPorCodigo
		
	};
	
}]);