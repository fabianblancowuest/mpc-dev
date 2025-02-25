<%@ Page Language="VB" AutoEventWireup="false" CodeFile="acceso.aspx.vb" Inherits="acceso" %>

    <!DOCTYPE html
        PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Ingreso de Usuario</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/jscript"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" type="text/jscript"></script>

        <!-- Bootstrap Actualizado -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <link rel="shortcut icon" href="/img/logo.png" type="image/x-icon">

        <!-- <link rel="stylesheet" href="css_viejo/bootstrap.min.css" type="text/css" /> -->
        <!-- Estilos -->
        <!-- <link rel="stylesheet" href="css_viejo/bootstrap-pachu.css" type="text/css" /> -->
        <!-- <link href="css/bootstrap-pachu-tocado.css" rel="stylesheet" /> -->
        <!-- <link href="css_viejo/bootstrap-datepicker.min.css" rel="stylesheet" /> -->
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/tablas.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <form id="form1" runat="server">

            <asp:Panel ID="PanelCredenciales" Visible="true" runat="server" CssClass="panel-credenciales">

                <div class="container text-center">
                    <div class="panel panel-primary">
                        <h2 class="panel-heading encabezado-acceso">Ingreso al Sistema <i
                                class="bi bi-window-sidebar"></i></h2>
                        <img src="img/logo.png" class="img-logo" />
                        <%-- <asp:Label ID="Label1" runat="server" Text="PAGINA EN MANTENIMIENTO" Font-Bold="true"
                            ForeColor="Red" Font-Size="XX-Large"></asp:Label>
                            <asp:Label ID="Label2" runat="server"
                                Text="Se están realizando tareas de mantenimiento en el sistema - Se reestablecerá el acceso en breve. "
                                ForeColor="Red" Font-Bold></asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server"
                                Text="La desaparición de este anuncio implica que el sitema está listo para ingresar."
                                Font-Size="Small" ForeColor="Red"></asp:Label>
                            --%>
                            <div class="panel-body login">
                                <div class="row">
                                    <h3 class="titulo-rol">ACCESO A SISTEMA MI PRIMER CASA</h3>
                                    <h4>EMPRESA DE SERVICIOS INMOBILIARIOS Y AFINES</h4>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <asp:Label ID="olblUsuario" runat="server" Text="Usuario:"
                                            CssClass="form-label"></asp:Label>
                                    </div>

                                    <div class="form-group">


                                        <asp:TextBox ID="otxtUsuario" runat="server" placeholder="juanperez@gmail.com"
                                            CssClass="form-control text-center form-input" required></asp:TextBox>

                                        <a href="#" data-toggle="popover" data-trigger="focus" title="Nombre de Usuario"
                                            data-content="Ingrese el nombre de usuario asignado por su administrador de sistema (Ej.: 'JIJUAREZ')">
                                            <!-- <span class="glyphicon glyphicon-question-sign"></span> -->
                                        </a>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="olblPass" runat="server" Text="Contraseña:"
                                            CssClass="form-label"></asp:Label>
                                    </div>

                                    <div class="form-group">
                                        <asp:TextBox ID="otxtPass" runat="server" placeholder="Ingrese su contraseña..."
                                            CssClass="form-control text-center form-input" required TextMode="Password">
                                        </asp:TextBox>
                                        <a href="#" data-toggle="popover" data-trigger="focus" title="Contraseña"
                                            data-content="Ingrese la contraseña asignada por el administrador del sistema. De no poseer una, contacte a su administrador.">
                                            <!-- <span class="glyphicon glyphicon-question-sign"></span> -->
                                        </a>
                                    </div>
                                </div>

                                <div class="row">
                                    <asp:Button ID="obutAcceder" runat="server" Text="Ingresar al Sistema"
                                        CssClass="btn btn-primary btn-basic" />
                                    <br />
                                    <%-- <a href="passRecover.aspx">¿Perdió su contraseña?</a>--%>
                                        <p>
                                            <asp:Label ID="olblAccesoMensaje" runat="server"
                                                Text="Ingrese usuario y contraseña. Luego presione el botón Ingresar al Sistema."
                                                CssClass="text-info text-primary" style="display: none;"></asp:Label>
                                        </p>
                                        <p>
                                            Ingrese usuario y contraseña. Luego presione el botón Ingresar al Sistema.
                                        </p>
                                </div>
                            </div>
                            <div class="panel-footer">
                                Pablo Strauss Desarrollos. &#169 Todos los derechos reservados.
                            </div>
                    </div>
                </div>


            </asp:Panel>
            <asp:Panel ID="PanelAcceso" runat="server" Visible="false" Font-Size="Medium" CssClass="panel-acceso">

                <asp:SqlDataSource ID="odsOperadorAcceso" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="operadorAcceso"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="LoginID" SessionField="operadorUsuario" Type="String" />
                        <asp:SessionParameter Name="PasID" SessionField="operadorPass" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvOperadorAcceso" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="idOperador,operadorCodigo,operadorDescripcion,operadorFUM"
                    DataSourceID="odsOperadorAcceso" EmptyDataText="Operador no seleccionado"
                    CssClass="table-cemmi descripcion-ultimo-acceso">
                    <Columns>
                        <asp:BoundField DataField="idOperador" HeaderText="idOperador" InsertVisible="False"
                            ReadOnly="True" SortExpression="idOperador" Visible="False" />
                        <asp:BoundField DataField="operadorCodigo" HeaderText="Usuario" SortExpression="operadorCodigo"
                            Visible="False" />
                        <asp:BoundField DataField="operadorDescripcion" HeaderText="Descripción"
                            SortExpression="operadorDescripcion" />
                        <asp:BoundField DataField="operadorFUM" HeaderText="Último Acceso"
                            SortExpression="operadorFUM" />
                    </Columns>
                </asp:GridView>



                <asp:Label ID="Label3" runat="server" Text="Accesos Habilitados:" CssClass="titulo-rol"></asp:Label>

                <asp:SqlDataSource ID="odsAccesoOperadorAccesoCorrecto" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="accesoOperadorAccesoCorrecto"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvAccesoOperadorAccesoCorrecto" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="idEmpresaOperador,empresaCodigo,empresaDescripcion,empresaSucursalCodigo,empresaSucursalDescripcion,empresaSectorCodigo,empresaSectorDescripcion,Roles"
                    DataSourceID="odsAccesoOperadorAccesoCorrecto" CssClass="table-cemmi accesos-habilitados">
                    <Columns>
                        <asp:CommandField SelectText="ACCEDER" ShowSelectButton="True" />
                        <asp:BoundField DataField="idEmpresaOperador" HeaderText="idEmpresaOperador"
                            SortExpression="idEmpresaOperador" />
                        <asp:BoundField DataField="empresaCodigo" HeaderText="Empresa "
                            SortExpression="empresaCodigo" />
                        <asp:BoundField DataField="empresaDescripcion" HeaderText="Razón Social"
                            SortExpression="empresaDescripcion" />
                        <asp:BoundField DataField="empresaSucursalCodigo" HeaderText="Sucursal Código"
                            SortExpression="empresaSucursalCodigo" Visible="False" />
                        <asp:BoundField DataField="empresaSucursalDescripcion" HeaderText="Sucursal"
                            SortExpression="empresaSucursalDescripcion" />
                        <asp:BoundField DataField="empresaSectorCodigo" HeaderText="Sector"
                            SortExpression="empresaSectorCodigo" Visible="False" />
                        <asp:BoundField DataField="empresaSectorDescripcion" HeaderText="Sector Descripción"
                            SortExpression="empresaSectorDescripcion" />
                        <asp:BoundField DataField="Roles" HeaderText="Roles" SortExpression="Roles">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:Button ID="obutAccesocorrectoLogout" runat="server" Text="SALIR"
                    CssClass="btn btn-danger btn-basic" />


            </asp:Panel>
        </form>

        <script src="acceso_busqueda.js" defer></script>
    </body>

    </html>