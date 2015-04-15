var app = angular.module('app', ['ngRoute']);

var SERVER_APP = '/parametros';

app.config(['$routeProvider', function($routeProvider) {
	
	$routeProvider
		.when('/', { templateUrl: SERVER_APP + '/parametros'})	
		
		.when('/login_post', { templateUrl: SERVER_APP + '/usuario/login?u=jsantos' } )
		
		.when('/show', { templateUrl: SERVER_APP + '/home'})	 
		.when('/widgets', { templateUrl: SERVER_APP + '/widgets'});		 
}]);  