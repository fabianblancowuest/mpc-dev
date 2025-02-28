<%@ Page Language="VB" AutoEventWireup="false" MaintainScrollPositionOnPostback="true"
    CodeFile="ACCESOFUERADESESION.aspx.vb" Inherits=" GPS_CERTIFICACION_ADMINISTRACION_accesoFueraDeSesion" %>

    <!DOCTYPE html
        PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Acceso no autorizado.</title>
        <link rel="stylesheet" href="../css/index.css" type="text/css" />
        <link rel="stylesheet" href="../css/tablas.css" type="text/css" />
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css" />

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    </head>

    <body>

        <form id="form2" runat="server">
            <div>
                <asp:ScriptManager ID="ScriptManager2" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="Panel1" runat="server" CssClass="acceso-fuera-de-sesion">
                            <div class="acceso-fuera-sesion login">
                                <div class="acceso-fuera-sesion-box">
                                    <h1 class="panel-heading titulo-fuera-de-sesion">Reingresar al sistema
                                        <i class="bi bi-window-stack"></i>
                                    </h1>
                                    <div class="mensaje-sin-sesion">Se ha perdido la sesión. Puede haber
                                        pasado un tiempo desde que no se opera el sistema. Debe ingresar nuevamente.
                                        <i class="bi bi-window-dash"></i>
                                    </div>
                                    <div class="panel-body">
                                        <div class="usuario-fuera-sesion">
                                            <p>Usuario fuera de Sesión <i class="bi bi-window-x"></i>
                                            </p>
                                            <p>Por favor, reingrese al sistema para seguir operando.</p>
                                            <asp:Button ID="obutReingresar" runat="server" Text="Reingresar al Sistema"
                                                CssClass="btn-basic btn btn-primary d-block my-4" />
                                            <asp:Label ID="olblObservacion" runat="server"
                                                Text="Haga click en el botón 'Reingresar al Sistema'. Será necesario reintroducir sus credenciales.">
                                            </asp:Label>
                                        </div>
                                        <div class=" fuera-sesion-footer">
                                            Pablo Strauss Desarrollos. &#169 Todos los derechos reservados.
                                        </div>
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
            $('#obutReingresar').click(function () {
                $('div').fadeOut();
            });
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/jscript"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" type="text/jscript"></script>
        <script type="text/jscript">
            $(document).ready(function () {
                $('[data-toggle="popover"]').popover();
            });
        </script>
        <script src="acceso_busqueda.js"></script>

    </body>

    </html>