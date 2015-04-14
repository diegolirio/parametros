<!DOCTYPE html>
<html ng-app="app">
  <head>
    <meta charset="UTF-8">
    <title>Parametros | Transp. Della Volpe</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />    
    <!-- FontAwesome 4.3.0 -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons 2.0.0 -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />    
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/morris/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Date Picker -->
    <link href="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link href="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="skin-yellow sidebar-collapse fixed" ng-controller="UsuarioController as usuarioCtrl">  
    <div class="wrapper">
      
	      <header class="main-header">
	         
		        <!-- Logo -->
		        <a href="${pageContext.request.contextPath}" class="logo"><img src="${pageContext.request.contextPath}/static/core/img/xlogo_heigth_40.png" /></a>
		        
		        <!-- Header Navbar: style can be found in header.less -->
				<jsp:include page="menu.jsp"></jsp:include>
			
	      </header>
	      
	      <!-- Left side column. contains the logo and sidebar -->
	      <jsp:include page="menu_left.jsp"></jsp:include>
	
	      <!-- Content Wrapper. Contains page content -->
		  <%-- 	      <jsp:include page="home.jsp"></jsp:include> --%>
		  <div ng-view></div>
		  <!-- /.content-wrapper -->
	      
		  <jsp:include page="footer.jsp"></jsp:include>
    
    </div><!-- ./wrapper -->
    

	<!-- ########################## AngularJS ########################################################################### -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.28/angular.min.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.28/angular-route.js"></script>
	<!--------- rotas e config da app angular ------------------->
	<script src="${pageContext.request.contextPath}/static/core/js/app.js"></script> 
	<!--------- Services ----------------> 
	<script src="${pageContext.request.contextPath}/static/core/js/service/UsuarioService.js"></script> 
	<script src="${pageContext.request.contextPath}/static/core/js/service/AplicacaoService.js"></script> 
	<script src="${pageContext.request.contextPath}/static/core/js/service/PerfilService.js"></script> 
	<script src="${pageContext.request.contextPath}/static/core/js/service/AplicacaoPerfilService.js"></script> 
	<!--------- Controllers ------------->
	<script src="${pageContext.request.contextPath}/static/core/js/controller/UsuarioController.js"></script> 
	<script src="${pageContext.request.contextPath}/static/core/js/controller/ParametrosController.js"></script> 
	<!-- ########################## End AngularJS ####################################################################### -->


    <!-- jQuery 2.1.3 -->
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- jQuery UI 1.11.2 -->
    <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
      $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>    
    <!-- Morris.js charts -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/morris/morris.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <!-- jvectormap -->
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <!-- jQuery Knob Chart -->
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/knob/jquery.knob.js" type="text/javascript"></script>
    <!-- daterangepicker -->
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <!-- datepicker -->
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <!-- Slimscroll -->
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='${pageContext.request.contextPath}/static/AdminLTE-2.0.3/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/dist/js/app.min.js" type="text/javascript"></script>

    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/dist/js/pages/dashboard.js" type="text/javascript"></script>

    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath}/static/AdminLTE-2.0.3/dist/js/demo.js" type="text/javascript"></script>
  </body>
</html>