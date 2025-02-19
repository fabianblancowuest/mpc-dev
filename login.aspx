<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="administracion_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema de órdenes de Trabajo - Acceso</title>
	<meta name="viewport" content="width=device-width, initial-scale=0" />
	<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="./css/bootstrap-pachu.css" type="text/css" />
	<link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
	<link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type ="text/jscript" ></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" type ="text/jscript"></script>
    <script type ="text/jscript">
        $(document).ready(function () {
            $('[data-toggle="popover"]').popover();
        });
	</script>
</head>

<body>
    <form id="form1" runat="server">
    <div class="hidden">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:Panel ID="Panel1" runat="server">
	        <div class="container text-center">
		        <div class="panel panel-primary">
			        <div class="panel-heading">Ingreso al Sistema</div>
			        <div class="panel-body login">
				        <div class="row">
                            <img src="img/logo-small.png" />
					        
					        <h1>ACCESO A SISTEMA MI PRIMER CASA<br />
					        <small>EMPRESA DE SERVICIOS INMOBILIARIOS Y AFINES.</small></h1>
				        </div>
				        <div class="row">
					        <div class="form-group">
						        <asp:Label ID="olblUsuario" runat="server" Text="Ingrese Usuario" ></asp:Label>
						        <asp:TextBox ID="otxtUsuario" runat="server"  CssClass="form-control text-center"></asp:TextBox> 
						        <a href="#" data-toggle="popover" data-trigger="focus" title="Nombre de Usuario" data-content="Ingrese el nombre de usuario asignado por su administrador de sistema (Ej.: 'JIJUAREZ')">
						        <span class="glyphicon glyphicon-question-sign"></span>
						        </a>
					        </div>
					        <div class="form-group">
						        <asp:Label ID="olblPass" runat="server" Text="Ingrese Contraseña:" ></asp:Label>
						        <asp:TextBox ID="otxtPass" runat="server"  CssClass="form-control text-center" TextMode="Password"></asp:TextBox>
						        <a href="#" data-toggle="popover" data-trigger="focus" title="Contraseña" data-content="Ingrese la contraseña asignada por el administrador del sistema. De no poseer una, contacte a su administrador.">
						        <span class="glyphicon glyphicon-question-sign"></span>
						        </a>
					        </div>
				        </div>

				        <div class="row">
                            <asp:Button ID="obutIngresar" runat="server" Text="Ingresar al Sistema"  CssClass ="btn btn-primary"/>
                            <br />
                            <a href="passRecover.aspx">¿Perdió su contraseña?</a>
                            <br />
					        <asp:Label ID="olblObservacion" runat="server" Text="Ingrese usuario y contraseña y luego presione el botón Ingresar al Sistema"  CssClass="text-info" ></asp:Label>
				        </div>
			        </div>
                    <div class="panel-footer">
				        Pablo Strauss Desarrollos, Todos los derechos reservados.
				    </div>
		        </div>
	        </div>	
        </asp:Panel>
        </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
    </form>
    <script>
        $(document).ready(function () {
            /*This function will make any section in the document fade in, provided it has the "hidden"
            class applied. Value after "fadeIn" is the time it takes for the div to fade in, expressed
            in miliseconds. Very sciencey.*/
            $('div.hidden').fadeIn(2000).removeClass('hidden');
            /*This function will make the cursor focus on the input with the "alias" class applied.*/
            $('#otxtUsuario').focus();
        });
    </script>
    <script src="acceso_busqueda.js"></script>
	
</body>
</html>
