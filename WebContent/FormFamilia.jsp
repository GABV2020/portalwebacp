<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="entidades.Familia, datos.Dt_Familia,  entidades.Rol,vistas.ViewRolUsuario, vistas.ViewRolOpcion, datos.Dt_Rol,datos.Dt_RolOpcion,java.util.*;" %>
<%
	response.setHeader( "Pragma", "no-cache" );
	response.setHeader( "Cache-Control", "no-store" );
	response.setDateHeader( "Expires", 0 );
	response.setDateHeader( "Expires", -1 );
	
	ViewRolUsuario vru = new ViewRolUsuario();
	Dt_RolOpcion dtro = new Dt_RolOpcion();
	ArrayList<ViewRolOpcion> listOpc = new ArrayList<ViewRolOpcion>();
	
	//OBTENEMOS LA SESION
	vru = (ViewRolUsuario)session.getAttribute("acceso");
	if(vru==null){
		response.sendRedirect("login.jsp?msj=401");
	}
	else{
		//OBTENEMOS LA LISTA DE OPCIONES ASIGNADAS AL ROL
		listOpc = dtro.listaRolOpc(vru.getRolid());
		
		//RECUPERAMOS LA URL = MI OPCION ACTUAL
		int index = request.getRequestURL().lastIndexOf("/");
		String miPagina = request.getRequestURL().substring(index+1);
		boolean permiso = false; //VARIABLE DE CONTROL
		
		//VALIDAR SI EL ROL CONTIENE LA OPCION ACTUAL DENTRO DE LA MATRIZ DE OPCIONES
		for(ViewRolOpcion vrop : listOpc){
			if(vrop.getOpcion().trim().equals(miPagina.trim())){
				permiso = true; //ACCESO CONCEDIDO
				break;
			}
		}
		
		if(!permiso){
			response.sendRedirect("401.jsp");
		}	
	}
%>
<!DOCTYPE html>
<html lang="es">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

   <title>Portal ACP - Formulario Familia</title>
   
    <!-- Icon -->
	<jsp:include page="imgShortIcon.jsp" />  
  
    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Menus -->
  		 <jsp:include page="adminMenus.jsp" />    
        
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Formulario -->
                      <div class="container">
                        <div class="row ">
                            <div class="col-lg-10 mx-auto m-auto">
                                <div class="card rounded shadow border-0">
                                    <div class="card-header">
                                        <h2>
                                            Familia
                                        </h2>
                                    </div>
                                    <div class="card-body bg-white rounded">                           
                                        <form class="Familia" method="post" action="./Sl_GestionFamilia">
                      					<input name="opcion" type="hidden" value="1" />
                                         <div class="form-group">
                                                <label>Nombre de la familia:</label>
                                                <input class="form-control" name = "txtNombreFamilia" id ="txtNombreFamilia">
                                                </div>
                                          <div class="form-group">
                                                <div class="form-group">
                                                    <label>Descripción:</label>
                                                    <textarea class="form-control" rows="3" name = "txtDescripcionFamilia" id = "txtDescripcionFamilia"></textarea>
                                                </div>
                                            </div>
                                         	 <div class="mb-3">
				                                <input class="btn btn-primary btn-user btn-block" type="submit" value="Guardar" />
				                            </div>
				                            <br>  
                                            <div style="text-align:center;"><a href="GestionFamilia.jsp"><i
                                                        class="fas fa-arrow-circle-left"></i>&nbsp;Volver a la tabla</a></div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
   				    <!-- Termina Formulario -->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <jsp:include page="adminFooter.jsp" />    
        

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <jsp:include page="adminLogOutModal.jsp" />    
        


    <!-- JAVASCRIPTS -->
    <link rel="stylesheet" href="vendor/datatables/jquery.dataTables.js">

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>


</body>

</html>