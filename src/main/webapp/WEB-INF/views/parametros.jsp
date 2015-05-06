'''''''''''''''''''''''''      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper" ng-hide="usuarioCtrl.isLoggedIn">
<!--       	<h1 class="text-center"><a href="#/">Realize o Login...</a></h1><br/><br/><br/><br/><br/> -->

			    <div class="login-box">
				      <div class="login-box-body">
<!-- 				        <p class="login-box-msg">Sign in to start your session</p> --> 
				        <form ng-submit="usuarioCtrl.login(usuarioCtrl.usuario.codigo, usuarioCtrl.usuario.senha)" >
				          <div class="form-group has-feedback">
				            <input type="text" class="form-control" placeholder="Usuario" ng-model="usuarioCtrl.usuario.codigo"/>
				            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				          </div>
				          <div class="form-group has-feedback">
				            <input type="password" class="form-control" placeholder="Senha" ng-model="usuarioCtrl.usuario.senha"/>
				            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
				          </div>
				          <div class="row">
				            <div class="col-xs-8">    
				            </div><!-- /.col -->
				            <div class="col-xs-4">
				              <button type="submit" class="btn btn-primary btn-block btn-flat">Entrar</button>
				            </div><!-- /.col -->
				          </div>
				        </form>
				      </div><!-- /.login-box-body -->	
		    </div><!-- /.login-box -->
		    <br/><br/><br/><br/><br/><br/>
      	</div>
      
      <div class="content-wrapper" ng-show="usuarioCtrl.isLoggedIn" ng-controller="ParametrosController as paramsCtrl">
	        <!-- Content Header (Page header) -->
	        <section class="content-header">
	          <h1 class="text-info">
	            Aplicação  
	            <!-- <small>Preview page</small>  -->
	            <small>
	            	<input type="text" ng-model="paramsCtrl.codigo" maxlength="10">
	            	<a href ng-click="paramsCtrl.btnGetAplicao(paramsCtrl.codigo)"><i class="glyphicon glyphicon-search"></i></a>
	            	<span class="text-muted">&nbsp; {{ paramsCtrl.aplicacao.descricao }}</span>
	            	<span class="text-danger"> {{paramsCtrl.mgsGetApp}}</span>
	            </small>
	          </h1> 
	          <ol class="breadcrumb">
	            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	            <li class="active">Parametros</li>
	          </ol>
	        </section>

	        <!-- Main content -->
	        <section class="content" >
	        
		          <!-- START CUSTOM TABS -->
		          <h2 class="page-header">Parametro: <span class="text-danger">{{paramsCtrl.perfil.codigo}}</span> </h2>
		          <div class="row" ng-show="paramsCtrl.aplicacao != null">
		          
		            <div class="col-md-12">
		              <!-- Custom Tabs -->
		              <div class="nav-tabs-custom"> 
		                <ul class="nav nav-tabs">
		                  <li class="active"><a href="?#tab_1" data-toggle="tab">Parametros</a></li>
		                  <li ng-show="paramsCtrl.perfil != null"><a href="?#tab_2" data-toggle="tab">Usuarios</a></li>
		                  <li ng-show="paramsCtrl.perfil != null"><a href="?#tab_3" data-toggle="tab">Grupo</a></li>
		                </ul>
		                <div class="tab-content">
		                  <div class="tab-pane active" id="tab_1">
		                    
		                    <div class="row">
			                  	  <div class="col-md-6" style="overflow-y: scroll; height:470px;">
			                  	  
			                  	  		<input ng-change="paramsCtrl.filterPerfis(paramsCtrl.descricao, paramsCtrl.aplicacao.codigo)" ng-model="paramsCtrl.descricao" type="search" placeholder="Pesquisar" class="form-control">
			                  	  
										<table class="table table-striped">
						                    <tr>
						                      <th style="width: 10px">#</th>
						                      <th>Nome do Parametro</th>
						                      <th>Descrição</th>
<!-- 						                      <th>Texto</th> -->
						                    </tr>
						                    <tr ng-repeat="p in paramsCtrl.perfis">
						                      <td><a href ng-click="paramsCtrl.getPerfilPorCodigo(p.codigo)"><span class="glyphicon glyphicon-pencil"></span></a></td>
						                      <td><a href ng-click="paramsCtrl.getPerfilPorCodigo(p.codigo)">{{p.codigo}}</a></td>
						                      <td>{{p.descricao}}</td>
<!-- 						                      <td>{{p.parat}}</td> -->
						                    </tr>
						                  </table> 
				                  	</div> 
				                  	<div class="col-md-6">
				                  	
						                  <div ng-show="paramsCtrl.msgInfo != null" class="alert alert-info alert-dismissable">
						                    <button type="button" class="close" ng-click="paramsCtrl.closeMsgInfo()">&times;</button>
						                    <h4><i class="icon fa fa-info"></i> {{paramsCtrl.msgInfo}}</h4>
						                  </div>				                  	
				                  	
						                  <form ng-submit="paramsCtrl.salvarPerfil(paramsCtrl.perfil)">
						                  
						                    <!-- text input -->
						                    <div class="form-group col-md-4">
						                      <label>Parametro</label>
						                      <input type="text" maxlength="25" class="form-control input-sm" id="idParamCodigo" ng-model="paramsCtrl.perfil.codigo" />
						                    </div>
						                    <div class="form-group col-md-8">
						                      <label>Descricao</label>
						                      <input type="text" maxlength="75" class="form-control input-sm" ng-model="paramsCtrl.perfil.descricao"/>
						                    </div>
						                    <div class="form-group col-md-6">
						                      <label>Resumida</label>
						                      <input type="text" maxlength="30" class="form-control input-sm" ng-model="paramsCtrl.perfil.descricaoResumida" maxlength="30"/>
						                    </div>
						                    
							                  <div class="form-group col-md-6">
							                    <label>Vigencia: {{paramsCtrl.perfil.vigencia}}</label>
							                    <div class="input-group">
							                      <div class="input-group-addon">
							                        <i class="fa fa-calendar"></i>
							                      </div> 
							                      <input type="date" class="form-control pull-right input-sm" ng-model="paramsCtrl.perfil.vigencia" value="{{paramsCtrl.perfil.vigencia}}" />
							                    </div><!-- /.input group -->
							                  </div><!-- /.form group -->					                    
							                  
							                  <div class="form-group col-md-3">
							                    <label>Datas (1):</label>
							                    <div class="input-group">
							                      <div class="input-group-addon">
							                        <i class="fa fa-calendar"></i>
							                      </div>
							                      <input type="text" class="form-control pull-right input-sm" ng-model="paramsCtrl.perfil.parad1" disabled="disabled"/>
							                    </div><!-- /.input group -->
							                  </div><!-- /.form group -->	
							                  <div class="form-group col-md-3">
							                    <label>(2):</label>
							                    <div class="input-group">
							                      <div class="input-group-addon">
							                        <i class="fa fa-calendar"></i>
							                      </div>
							                      <input type="text" class="form-control pull-right input-sm" ng-model="paramsCtrl.perfil.parad2" disabled="disabled"/>
							                    </div><!-- /.input group -->
							                  </div><!-- /.form group -->	
							                  <div class="form-group col-md-3">
							                    <label>(3):</label>
							                    <div class="input-group">
							                      <div class="input-group-addon">
							                        <i class="fa fa-calendar"></i>
							                      </div>
							                      <input type="text" class="form-control pull-right input-sm" ng-model="paramsCtrl.perfil.parad3" disabled="disabled"/>
							                    </div><!-- /.input group -->
							                  </div><!-- /.form group -->	
							                  <div class="form-group col-md-3">
							                    <label>(4):</label>
							                    <div class="input-group">
							                      <div class="input-group-addon">
							                        <i class="fa fa-calendar"></i>
							                      </div>
							                      <input type="text" class="form-control pull-right input-sm" ng-model="paramsCtrl.perfil.parad4" disabled="disabled"/>
							                    </div><!-- /.input group -->
							                  </div><!-- /.form group -->	
							                  
						                    <div class="form-group col-md-2">
						                      <label>Numeros(1):</label>
						                      <input type="text" class="form-control input-sm" ng-model="paramsCtrl.perfil.paran1" disabled="disabled"/>
						                    </div>						                  				                    
						                    <div class="form-group col-md-2">
						                      <label>(2):</label>
						                      <input type="text" class="form-control input-sm" ng-model="paramsCtrl.perfil.paran2" disabled="disabled"/>
						                    </div>						                  				                    
						                    <div class="form-group col-md-2">
						                      <label>(3):</label>
						                      <input type="text" class="form-control input-sm" ng-model="paramsCtrl.perfil.paran3" disabled="disabled"/>
						                    </div>						                  				                    
						                    <div class="form-group col-md-2">
						                      <label>(4):</label>
						                      <input type="text" class="form-control input-sm" ng-model="paramsCtrl.perfil.paran4" disabled="disabled"/>
						                    </div>						                  				                    
						                    <div class="form-group col-md-2">
						                      <label>(5):</label>
						                      <input type="text" class="form-control input-sm" ng-model="paramsCtrl.perfil.paran5" disabled="disabled"/>
						                    </div>						                  				                    
						                    <div class="form-group col-md-2">
						                      <label>(6):</label>
						                      <input type="text" class="form-control input-sm" ng-model="paramsCtrl.perfil.paran6" disabled="disabled"/>
						                    </div>			
						                     
						                    <div class="form-group col-md-12">
						                      <label>Texto</label>
						                      <textarea class="form-control" rows="2" ng-model="paramsCtrl.perfil.parat"></textarea>
						                    </div>					                    
						                    <div class="form-group col-md-12">
						                      <label>Observação </label>
						                      <textarea class="form-control" rows="2" ng-model="paramsCtrl.perfil.observacao"></textarea>
						                    </div>					  
						                    
							                  <div class="box-footer">
							                  	<a href ng-click="paramsCtrl.novoPerfil()" class="btn btn-default"> Criar novo parametro</a>
							                    <button type="submit" class="btn btn-success">Salvar</button>
<!-- 							                  	<a href ng-click="paramsCtrl.excluir(paramsCtrl.perfil)" class="btn btn-danger pull-right">Excluir</a> -->
<!-- 							                  	<a href ng-click="paramsCtrl.cancelar()" class="btn btn-default pull-right">Cancelar</a> -->
							                    
							                  </div>					                                      
						                    
						              </form>			                  		
				                  </div>
			                 </div> 
		                    
		                  </div><!-- /.tab-pane -->
		                  <div class="tab-pane" id="tab_2">
		                    	
			                    <div class="row">
				                  	  <div class="col-md-5" style="overflow-y: scroll; height:420px;">
											<table class="table table-striped">
							                    <tr>
							                      <th style="width: 10px">#</th>
							                      <th>Usuario</th>
							                      <th>Rota</th>
							                      <th>Grupo</th>
							                    </tr>
							                    <tr ng-repeat="apu in paramsCtrl.aplicacaoPerfilUsuarios">
							                      <td><a href ng-click="paramsCtrl.getAplicacaoPerfil(apu.aplicacao.codigo, apu.perfil.codigo, apu.usuario, apu)"><span class="glyphicon glyphicon-pencil"></span></a></td>
							                      <td><a href ng-click="paramsCtrl.getAplicacaoPerfil(apu.aplicacao.codigo, apu.perfil.codigo, apu.usuario, apu)">{{apu.usuario}}</a></td>
							                      <td>{{apu.rota}}</td>
							                      <td>{{apu.grupoCodigo}}</td>
							                    </tr>
							                  </table>
					                  	</div> 
					                  	<div class="col-md-7">
				                  	
							                  <div ng-show="paramsCtrl.msgAplicacaoPerfilInfo != null" class="alert alert-info alert-dismissable">
							                    <button type="button" class="close" ng-click="paramsCtrl.closeMsgAppPerfilInfo()">&times;</button>
							                    <h4><i class="icon fa fa-info"></i> {{paramsCtrl.msgAplicacaoPerfilInfo}}</h4>
							                  </div>						                  			
					                  			
							                  <form role="form" ng-submit="paramsCtrl.saveAplicacaoPerfil(paramsCtrl.aplicacaoPerfil)">
							                  	<div class="row">
								                  	<div class="col-md-7">
									                    <!-- text input -->
									                    <div class="form-group col-md-12">
									                      <label>Rota</label>
									                      <input type="text" class="form-control input-sm" maxlength="3" ng-model="paramsCtrl.aplicacaoPerfil.rota"/>
									                    </div>					                  			
									                    <div class="form-group col-md-12">
									                      <label>Usuário</label>
									                      <input type="text" class="form-control input-sm" maxlength="10" ng-model="paramsCtrl.aplicacaoPerfil.usuario"/>
									                    </div>					                  			
									                    <div class="form-group col-md-12">
									                      <label>Grupo</label>
									                      <input type="text" class="form-control input-sm" maxlength="5" ng-model="paramsCtrl.aplicacaoPerfil.grupoCodigo"/>
									                    </div>					                  			
									                    <div class="form-group col-md-3">
									                      <label><small>Datas</small>(1)</label>
									                      <input type="text" class="form-control input-sm" maxlength="10" ng-model="paramsCtrl.aplicacaoPerfil.parad1" disabled="disabled"/>
									                    </div>					                  			
									                    <div class="form-group col-md-3">
									                      <label>(2)</label>
									                      <input type="text" class="form-control input-sm" maxlength="10" ng-model="paramsCtrl.aplicacaoPerfil.parad2" disabled="disabled"/>
									                    </div>					                  			
									                    <div class="form-group col-md-3">
									                      <label>(3)</label>
									                      <input type="text" class="form-control input-sm" maxlength="10" ng-model="paramsCtrl.aplicacaoPerfil.parad3" disabled="disabled"/>
									                    </div>					                  			
									                    <div class="form-group col-md-3">
									                      <label>(4)</label>
									                      <input type="text" class="form-control input-sm" maxlength="10" ng-model="paramsCtrl.aplicacaoPerfil.parad4" disabled="disabled"/>
									                    </div>					                  			
									                    <div class="form-group col-md-2">
									                      <label><small>Numeros</small>(1)</label>
									                      <input type="text" class="form-control input-sm" ng-model="paramsCtrl.aplicacaoPerfil.paran1" disabled="disabled"/>
									                    </div>					                  			
									                    <div class="form-group col-md-2">
									                      <label>(2)</label>
									                      <input type="text" class="form-control input-sm" ng-model="paramsCtrl.aplicacaoPerfil.paran2" disabled="disabled"/>
									                    </div>					                  			
									                    <div class="form-group col-md-2">
									                      <label>(3)</label>
									                      <input type="text" class="form-control input-sm" ng-model="paramsCtrl.aplicacaoPerfil.paran3" disabled="disabled"/>
									                    </div>					                  			
									                    <div class="form-group col-md-2">
									                      <label>(4)</label>
									                      <input type="text" class="form-control input-sm" ng-model="paramsCtrl.aplicacaoPerfil.paran4" disabled="disabled"/>
									                    </div>					                  			
									                    <div class="form-group col-md-2">
									                      <label>(5)</label>
									                      <input type="text" class="form-control input-sm" ng-model="paramsCtrl.aplicacaoPerfil.paran5" disabled="disabled"/>
									                    </div>					                  			
									                    <div class="form-group col-md-2">
									                      <label>(6)</label>
									                      <input type="text" class="form-control input-sm" ng-model="paramsCtrl.aplicacaoPerfil.paran6" disabled="disabled"/>
									                    </div>				
									                    <div class="form-group col-md-12">
									                      <label>Texto</label>
									                      <textarea class="form-control" rows="2" ng-model="paramsCtrl.aplicacaoPerfil.parat"></textarea>
									                    </div>									                    	                  			
													</div>	
													<div class="col-md-5">
										                  <div class="form-group col-md-6">
										                    <label>Vigencia:</label>
										                    <div class="input-group">
										                      <div class="input-group-addon">
										                        <i class="fa fa-calendar"></i>
										                      </div>
										                      <input type="date" class="form-control pull-right input-sm" ng-model="paramsCtrl.aplicacaoPerfil.vigencia" value="{{paramsCtrl.aplicacaoPerfil.vigencia}}"/>
										                    </div><!-- /.input group -->
										                  </div><!-- /.form group -->	
										                  <div class="form-group col-md-6">
										                    <label>Validade:</label>
										                    <div class="input-group">
										                      <div class="input-group-addon">
										                        <i class="fa fa-calendar"></i>
										                      </div>
										                      <input type="date" class="form-control pull-right input-sm" ng-model="paramsCtrl.aplicacaoPerfil.validade" value="{{paramsCtrl.aplicacaoPerfil.validade}}"/>
										                    </div><!-- /.input group -->
										                  </div><!-- /.form group -->
									                      <div class="form-group col-md-6">
									                      		<label>Usuario Cadastrou</label>
									                      		<input type="text" class="form-control input-sm" ng-model="paramsCtrl.aplicacaoPerfil.usuarioCadastro" disabled="disabled"/>
									                      </div>											                  			
										                  <div class="form-group col-md-6">
										                    <label>Data de Cadastro:</label>
										                    <div class="input-group">
										                      <div class="input-group-addon">
										                        <i class="fa fa-calendar"></i>
										                      </div>
										                      <input type="date" class="form-control pull-right input-sm" ng-model="paramsCtrl.aplicacaoPerfil.dataCadastro" value="{{paramsCtrl.aplicacaoPerfil.dataCadastro}}" disabled="disabled"/>
										                    </div><!-- /.input group -->
										                  </div><!-- /.form group -->		
									                      <div class="form-group col-md-6">
									                      		<label>Usuario Alterou</label>
									                      		<input type="text" class="form-control input-sm" ng-model="paramsCtrl.aplicacaoPerfil.usuarioAlteracao" disabled="disabled"/>
									                      </div>											                  			
										                  <div class="form-group col-md-6">
										                    <label>Data de Alteração:</label>
										                    <div class="input-group">
										                      <div class="input-group-addon">
										                        <i class="fa fa-calendar"></i>
										                      </div>
										                      <input type="date" class="form-control pull-right input-sm" ng-model="paramsCtrl.aplicacaoPerfil.dataAlteracao" value="{{paramsCtrl.aplicacaoPerfil.dataAlteracao}}" disabled="disabled"/>
										                    </div><!-- /.input group -->
										                  </div><!-- /.form group -->		
										                  
										                  <div class="form-group col-md-12">
										                   	  <label>Status:</label> <br/>
										                      <input type="radio" ng-model="paramsCtrl.aplicacaoPerfil.ativo" value="S"> Ativo &nbsp;&nbsp;&nbsp;
										                      <input type="radio" ng-model="paramsCtrl.aplicacaoPerfil.ativo" value="N"> Desativado
										                  </div><!-- /.form group -->										                  
										                  
										                  <div class="form-group col-md-6">
										                  		<h1><a href ng-click="paramsCtrl.horarios()"><span class="fa fa-clock-o"></span> <small>Horarios</small></a> </h1>
										               	  </div>                  							                  								                  							                  
													</div>			
												 </div>												
								                 <div class="row">
								                 	 <div class="box-footer">
								                  		<a href ng-click="paramsCtrl.novoAplicacaoPeril()" class="btn btn-default"> Criar novo</a>
								                    	<button type="submit" class="btn btn-success">Salvar</button>
		<!-- 							                  	<a href ng-click="paramsCtrl.excluir(paramsCtrl.perfil)" class="btn btn-danger pull-right">Excluir</a> -->
		<!-- 							                  	<a href ng-click="paramsCtrl.cancelar()" class="btn btn-default pull-right">Cancelar</a> -->
													 </div>						                    
								                 </div>	
					                  		  
					                  		  </form>	
					                  	</div>
					            
					            </div>
		                    	
		                  </div><!-- /.tab-pane -->
		                  <div class="tab-pane" id="tab_3">
		                    	
			                    <div class="row">
			                     	<div class="col-md-5">
			                    		<h1>Grupos</h1>
			                    	</div>
			                    	<div class="col-md-7">
			                    	
			                    	
			                    	</div>
			                    
			                    </div>
			              
			              </div>
			                    		                  
		                </div><!-- /.tab-content -->
		              </div><!-- nav-tabs-custom -->
		            </div><!-- /.col -->
		          </div> <!-- /.row -->
		          <!-- END CUSTOM TABS -->	        
	        
		    </section>
      
      </div> 
					