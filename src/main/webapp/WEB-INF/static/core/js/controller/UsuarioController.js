/**
 * UsuarioController
 */
app.controller('UsuarioController', ['$window', 'UsuarioService', function($window, UsuarioService) {

	var self = this;
	
	/*
	 * isLoggedIn verifica no html se usuario esta logado
	 */
	self.isLoggedIn = false; 
	
	/*
	 * rotina UsuarioService.getSession executada ao estanciar UsuarioController, verifica se existe sessao(esta logado).
	 */
	UsuarioService.getSession().then(function(resp) {
		self.isLoggedIn = true;
		self.usuario = resp.data;
	}, function(error) {
		console.log(error.data); 
	});	
	
	self.logout = function() {
		UsuarioService.logout().then(function(resp) {
			$window.location.href = SERVER_APP;
		}, function(error) {
			alert(error.data);
		});
	};
	
	
}]);
