<%@ Page Language="VB" AutoEventWireup="false" MaintainScrollPositionOnPostback="true" CodeFile="webVentaTalon.aspx.vb" Inherits="ventaWEB_webVentaTalon" ContentType="text/html; charset=UTF-8" %>

<%@ Register Src="~/Administracion/whatsappValidador.ascx" TagPrefix="uc1" TagName="whatsappValidador" %>
<%@ Register Src="~/Administracion/correoElectronicoValidador.ascx" TagPrefix="uc1" TagName="correoElectronicoValidador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%-- Título --%>
    <title>Venta de billetes sorteo día de la Madre Mi Primer Casa - 20 de Octubre de 2024 - </title>
    <%-- Metadatos --%>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2, user-scalable=no" />
    <%--  <meta http-equiv ="refresh" content ="5" />--%>
    <style type="text/css">
        .btn-success {
            margin-top: 0px;
        }
    </style>
    <%-- Google Fonts --%>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Lobster&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Roboto+Slab:wght@100..900&display=swap" rel="stylesheet" />
    <%-- Bootstrap Icons --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <%-- Styles Sheets --%>
    <link href="../ventaWEB/styles-mi-primer-casa.css" rel="stylesheet" />
    <%-- Favicon --%>
    <link rel="shortcut icon" href="./mi-primer-casa-logo-wbg.png" type="image/x-icon" />
    <%-- Scripts --%>
    <script type="text/javascript">
        function OpenWindows(url) {
            window.open(url, " Título", "directories=no, location=no, menubar=no, scrollbars=yes, statusbar=no, tittlebar=no");
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <%--    <asp:UpdatePanel runat="server" ID="UpdatePanel"
                    style="background-color: whitesmoke">

            <ContentTemplate>
        --%>
        <div class="header">
            <img class="logo" src="mi-primer-casa-logo-wbg.png" alt="mi-primer-casa-logo" />
            <h1>
                <asp:Label ID="Label2" runat="server" Text="Mi Primer Casa S.A." Font-Bold="true"></asp:Label>
            </h1>
        </div>
        <div align="center">
            <h2>
                <asp:Label ID="Label1" runat="server" Text="Bienvenido a la plataforma de ventas de billetes para el sorteo del día de la Madre del año 2024."></asp:Label>
            </h2>
        </div>

        <asp:Label ID="olblSession" runat="server" Text="" Visible="false" CssClass=""></asp:Label>
        <asp:Label ID="olblIdOperador" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="idOperador" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="olblIdSorteo" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="olblIdContactoTipo" runat="server" Text="" Visible="false"></asp:Label>

        <div class="info-header">

            <asp:TextBox ID="olblInformacionVenta" runat="server" TextMode="MultiLine" Enabled="false"></asp:TextBox>
            <%-- <asp:Label ID="olblInformacionVenta" runat="server" Text="" Font-Bold ="true" Font-Size="Medium"  ></asp:Label>--%>
        </div>
        <div class="msj-personas-comprando">
            <asp:Label ID="olblPar02" runat="server" Text="" Visible="true"></asp:Label>
        </div>
        <%-- Panel Sorteo --%>
        <div class="principal-buttons">


            <div class="container">
                <div class="panel-numeros-mas-boton">
                    <%--                     <span class="text">
                        <asp:Label ID="Label3" runat="server" Text="Paso 1 ->"></asp:Label>
                    </span>--%>

                    <div>
                            <asp:Button ID="obutNumeros" runat="server" Text="Números" CssClass="btn btn-numeros" />

                        <asp:Panel ID="PanelNumeros" runat="server">
                            <%-- Botón Panel Números --%>
                            <div>
                                <asp:TextBox ID="otxtCantidad" runat="server" Text="50" Enabled="false" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="otxtNumeroDesde" runat="server" Text="0" Enabled="false" Visible="false"></asp:TextBox>
                            </div>

                            <div align="center" class="panel-numeros">

                                <asp:Label CssClass="info-billetes" ID="olblBilletesSeleccionadosCantidad" runat="server" Text="" ForeColor="Blue" Font-Bold="true" Visible="true"></asp:Label>

                                <asp:Label CssClass="info-billetes" ID="olblBilletesSeleccionados" runat="server" Text="" ForeColor="Blue" Font-Bold="true" Visible="true"></asp:Label>
                                <p class="info-validacion">
                                    <asp:Label CssClass="msj-talon" ID="olblValidacionMensajeError" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                                    <asp:Label CssClass="msj-talon" ID="olblGestionCodigo" runat="server" Text="" Font-Bold="true" Visible="false"></asp:Label>
                                    <asp:Label CssClass="msj-talon" ID="olblGestionDescripcion" runat="server" Text="" Font-Bold="true"></asp:Label>
                                </p>

                                <asp:SqlDataSource ID="odssorteoTalonVendedorVenta" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoTalonVendedorVentaWEB" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="IdOperador" Name="idOperador" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="olblIdSorteo" Name="idSorteo" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="otxtCantidad" Name="cantidadVisualiza" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="otxtNumeroDesde" Name="numeroDesde" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="olblSession" Name="sorteoTalonSession" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="ogvSorteoTalonVendedorVenta" runat="server" AutoGenerateColumns="False" DataKeyNames="idSorteoTalon" DataSourceID="odssorteoTalonVendedorVenta" CssClass="table-cemmi tabla-numeros">
                                    <Columns>
                                        <asp:TemplateField HeaderText="idSorteoTalon" InsertVisible="False" SortExpression="idSorteoTalon" Visible="False">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("idSorteoTalon") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="olblIdSorteoTalon" runat="server" Text='<%# Bind("idSorteoTalon") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sorteoTalonNumero" HeaderText="Números Disponibles" SortExpression="sorteoTalonNumero">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Seleccione su número <br/><b> &#x2198; ⬇⬇⬇  &#x2199;</b>" SortExpression="sorteoTalonTomado">
                                            <%-- Tabla números --%>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="ochSorteoTalonTomado" runat="server" Checked='<%# Bind("sorteoTalonTomado") %>' Enabled="True" AutoPostBack="true" OnCheckedChanged="talonVendedorToma" CssClass="tabla-checkbox" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>

                        </asp:Panel>
                    </div>
                </div>


                <div class="container-premios">
                    <%--<span class="text">
                        <asp:Label ID="Label4" runat="server" Text="Paso 2 ->"></asp:Label>
                    </span>--%>
                    <div>

                        <%-- Botón Premios --%>
                        <div id="btn-premios-container" class="btn-premios-container">
                            <asp:Button ID="obutPremios" runat="server" Text="Premios" CssClass="btn btn-premios" Enabled="false" />
                        </div>

                        
                        <%-- Panel Premios --%>

                        <asp:Panel ID="PanelPremio" runat="server" Visible="false">
                            
                            <div align="center">
                                <asp:Label ID="Label6" runat="server" Text="Complete cada talón con el premio y luego confirme "></asp:Label>

                            </div>

                            <div class="panel-premios">
                                <asp:SqlDataSource ID="odsSorteoPremio" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SORTEOPREMIOTraeroddlDescending" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                <asp:SqlDataSource ID="odsSorteoVendedorTalonSeleccionado" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SorteoVendedorTalonSeleccionadoWEB" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="olblSession" Name="sorteoTalonSession" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="ogvSorteoVendedorTalonSeleccionado" runat="server" AutoGenerateColumns="False" DataKeyNames="idSorteoTalon" DataSourceID="odsSorteoVendedorTalonSeleccionado" CssClass="table-cemmi">
                                    <Columns>
                                        <asp:TemplateField HeaderText="idSorteoTalon" InsertVisible="False" SortExpression="idSorteoTalon" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="olblIdSorteoTalon" runat="server" Text='<%# Bind("idSorteoTalon") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sorteoTalonNumero" HeaderText="NUMERO" SortExpression="sorteoTalonNumero">
                                            <ControlStyle Width="20%" />
                                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="P R E M I O S" SortExpression="idSorteoPremio">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="oddlPremio" runat="server" DataSourceID="odsSorteoPremio" DataTextField="sorteoPremioDescripcion" DataValueField="idSorteoPremio" SelectedValue='<%# Bind("idSorteoPremio")%>' AutoPostBack="True" Width="80%" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                            <ControlStyle Width="100%" />
                                            <HeaderStyle Width="60%" />
                                            <ItemStyle CssClass="select-premios" Width="60%" HorizontalAlign="Center" Font-Size="X-Small" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Precio" HeaderText="PRECIO" ReadOnly="True" SortExpression="sorteoTalonMonto" DataFormatString="{0:c}">
                                            <ControlStyle Width="20%" />
                                            <ItemStyle HorizontalAlign="Right" Font-Bold="True" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <%--Footer Panel Premios--%>
                            <div class="footer-panel-premios">
                                <asp:Label ID="Label7" runat="server" Text="Cantidad de talones seleccionados :  "></asp:Label>
                                <asp:Label ID="olblCantidadTotal" runat="server" Text="0"></asp:Label>
                            </div>


                            <div class="footer-panel-premios">
                                <asp:Label ID="Label8" runat="server" Text="Importe de los talones seleccionados : "></asp:Label>
                                <div class="total">
                                    <asp:Label ID="Label9" runat="server" Text="$"></asp:Label>
                                    <asp:Label ID="olblMontoTotal" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                            <div>
                                <asp:Label ID="olblValidacionMensajeErrores" runat="server" Text="0" Font-Bold="true" ForeColor="Red" Visible="false" Font-Size="Small"></asp:Label>
                                <asp:Label CssClass="msj-error-premios" ID="olblValidacionMensajeErrorPremio" runat="server" Text=""></asp:Label>
                            </div>

                            <div class="msj-footer-panel-premios">
                                <asp:TextBox ID="otxtLeyendaPago" runat="server" Text="Usted ha conformado su compra. Si desea agregar más billetes o quitar billetes antes de confirmar la operacion , puede hacerlo presionando los botones NUMEROS y PREMIOS hasta que sea de su entera satisfaccion el monto de su compra. Pulse PAGAR para comenzar el proceso de Pago" TextMode="MultiLine" BackColor="White" Enabled="false" Visible="false"></asp:TextBox>
                            </div>
                            <%-- Boton Verde Pagar --%>
                            <div style="text-align: center;">
                                <asp:Button CssClass="btn-pago" ID="obutRealizarPago" runat="server" Text="PAGAR" Visible="false" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div>
<%--                    <span class="text">
                        <asp:Label ID="Label5" runat="server" Text="Paso 3 "></asp:Label>
                    </span>--%>
                    <span>
                        <asp:Button ID="obutCobrar" runat="server" Text="Pagar" CssClass="btn" Enabled="false" />

                    </span>
                </div>
            </div>
        </div>

        <%-- Panel Premio --%>
 

        <asp:Panel ID="PanelConfirmaOperacion" runat="server" Visible="false">
            <asp:Panel ID="PanelValores" runat="server" Visible="false">
                <div class="monto-a-pagar">
                    <asp:Label ID="Label12" runat="server" Text="Monto a pagar :"></asp:Label>
                    <asp:Label ID="olblPagoConfirmadoMonto" runat="server" Text=""></asp:Label>
                </div>
                <%--Botones medios de pago--%>
                <div class="botones-medios-de-pago">

                    <asp:Button CssClass="btn-pago btn-metodo-pago" ID="obutOpcionPagoConMercadoPago" runat="server" Text="PAGAR CON MERCADO PAGO "/>
                    <asp:Button CssClass="btn-pago btn-metodo-pago disminuir-texto" ID="obutTransferenciaAMercadoPago" runat="server" Text="TRANSFERENCIA A MERCADO PAGO POR ALIAS" />
                    <asp:Button CssClass="btn-pago btn-metodo-pago" ID="obutVolverFormasDePago" runat="server" Text="Mostrar Opciones de Pago" Visible="false" />

                </div>



                <div>
                    <asp:Label ID="olblMensajeGrabacionCobranza" runat="server" Text=""></asp:Label>
                </div>
                </div>
                <%-- Panel Mercado Pago --%>
                        <asp:Panel CssClass="panel-mercado-pago" ID="PanelMercadoPAgo" runat="server" Visible="false">
                            <div class="titulo-panel-mercado-pago">
                                <asp:Label ID="olblValorEfectivo" runat="server" Text="PAGAR CON MERCADO PAGO" Width="90%"></asp:Label>
                                <asp:TextBox ID="otxtValorEfectivoMonto" runat="server" Enabled="false" Visible="false" Text="0"></asp:TextBox>
                            </div>

                            <div class="info-panel-mercado-pago">
                                <asp:TextBox ID="otxtMercadoPagoInstrucciones" runat="server" TextMode="MultiLine" Enabled="false" Text="Esta opción es válida sólo para usuarios de la plataforma MERCADO PAGO . Debe presionar el botón PAGAR CON MERCADO PAGO para ingresar a la aplicación de MERCADO PAGO para poder seleccionar el medio de pago , y luego de digitar el monto correspondiente a la compra en proceso confirmar la operación. Una vez confirmado el pago, realizar la captura de pantalla y adjuntar la imagen del comprobante para su registro y posterior validación."></asp:TextBox>
                            </div>

                            <div class="botones-medios-de-pago">
                                <asp:Button CssClass="btn-pago" ID="obutPagaConMercadoPago" runat="server" Text="PAGAR CON MERCADO PAGO"  />
                            </div>

                        </asp:Panel>
                <%--Panel Transferencia--%> 
                <asp:Panel ID="PanelTransferencia" runat="server" Visible="false">
                    <div class="panel-transferencia">
                        <div align="center">
                            <asp:TextBox ID="otxtDatosBancoParaTransferencia01" runat="server" BackColor="LightGray" Width="90%" Text="Datos cuenta en MERCADO PAGO" Font-Bold="true"></asp:TextBox>
                        </div>
                        <div align="center">
                            <asp:TextBox ID="otxtDatosBancoParaTransferencia02" runat="server" BackColor="LightGray" Width="90%" Text="CVU : 0000003100050215684489" Font-Bold="true"></asp:TextBox>
                        </div>
                        <div align="center">
                            <asp:TextBox ID="otxtDatosBancoParaTransferencia03" runat="server" BackColor="LightGray" Width="90%" Text="ALIAS : sorteo.billete.mpc " Font-Bold="true"></asp:TextBox>
                        </div>
                        </div>
                </asp:Panel>
                <%-- Panel Upload --%>
                <asp:Panel ID="PanelUpload" runat="server" Visible="false">



                    <asp:Label ID="olblValorTransferenciaMonto" runat="server" Text="Valor Transferencia" Width="30%" Visible="false"></asp:Label>

                    <asp:TextBox ID="otxtValorTransferenciaMonto" runat="server" Width="20%" Visible="false"></asp:TextBox>
                    <asp:Button ID="obutValoresComplementar" runat="server" Text="( @ )" Visible="false" /><br />
                    <div align="center">
                        <asp:TextBox ID="Label24" runat="server" Text="Seleccione la imagen del comprobante de pago en su dispositivo. Luego presione el botón SUBIR IMAGEN para visualiarla." TextMode="MultiLine" Width="90%"></asp:TextBox>
                    </div>

                    <div class="panel-upload-botones">
                        <asp:FileUpload ID="FileUpLoad2" Text="Seleccionar Archivo" runat="server" OnInit="subirImagen" />
                    </div>
                    <div>


                        <asp:Button CssClass="btn-principal" ID="UploadBtn" Text="Subir Imagen" OnClick="UploadBtn_Click" runat="server" />
                        <asp:Label ID="olblMensajeUpload" runat="server" Text="" Font-Size="Small"></asp:Label>
                        <asp:Label ID="olblPrevisualiza" runat="server" Text="" Font-Size="Small"></asp:Label>
                        <asp:Label ID="olblidImagenTipo" runat="server" Text="" Font-Size="Small"></asp:Label>
                        <br />
                        <div class="titulo-nro-de-transferencia">
                        <asp:Label ID="olblValorTransferenciaNumero" runat="server" Text="Número de Transferencia"></asp:Label>
                        </div>
                         <div class="nro-de-transferencia">
                               <asp:Label ID="Label13" runat="server" Text="Ingrese el número de comprobante que figura en la imagen escaneada."></asp:Label>
                                <asp:TextBox ID="otxtValorTransferenciaNumero"  runat="server"></asp:TextBox>
                         </div>
                        <div class="img-transferencia">
                            <asp:Image ID="Image1" runat="server" Height="50%" ImageUrl="https://www.miprimercasa.ar/mpc/talonesWEB/mercadoPagoImagenPendiente.jpg" />
                            <asp:Button CssClass="btn-principal btn-pago" ID="obutConfirmaPago" runat="server" Text="Confirmar Pago" />
                        <br />
                        <asp:Label ID="olblGestionGrabacion" runat="server" Text=""></asp:Label>
                        <asp:Label ID="olblIdPrestadorVehiculoImagen" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                        </div>
                    </div>

                </asp:Panel>

            </asp:Panel>
            <%-- Panel Cliente --%>
            <asp:Panel ID="PanelCliente" runat="server" Visible="false">
                <div class="formulario-cliente">
                    <h3>Transacción Número
                               <asp:Label ID="olblIdSorteoTalonCobranza" runat="server" Text="" Visible="true"></asp:Label>

                    </h3>
                    <div class="transaccion-cliente">
                        <asp:TextBox CssClass="msj-felicitaciones" ID="Label25" runat="server" Text="¡¡Felicitaciones!! 🎉 ¡Usted ya está participando por los premios mayores de los sorteos de Octubre! 🎁" TextMode="MultiLine" Enabled="false" BorderWidth="0"></asp:TextBox>


                        <asp:TextBox ID="Label14" runat="server" Text="Complete sus datos para que podamos enviarle sus comprobantes a su correo electrónico y Whatsapp." TextMode="MultiLine" Enabled="false" BorderWidth="0"></asp:TextBox>

                    </div>
                    <%-- Formulario Cliente --%>
                    <div class="contenedor-inputs">
                        <asp:Label ID="Label15" runat="server" Text="Apellido y Nombres:"></asp:Label>
                        <asp:TextBox ID="otxtClienteApyNom" runat="server"></asp:TextBox>

                    </div>
                    <div class="btn-formulario contenedor-inputs">
                        <uc1:whatsappValidador runat="server" ID="whatsappValidador" />

                    </div>
                    <div class="btn-formulario contenedor-inputs">
                        <uc1:correoElectronicoValidador runat="server" ID="correoElectronicoValidador" />
                    </div>


                    <div class="btn-formulario contenedor-inputs">
                        <asp:Label ID="olblMensajeValidacion" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                </div>
                    <div class="botones-medios-de-pago contenedor-inputs">
                        <asp:Button ID="obutConfirmaOperacion" runat="server" Text="Confirmar Operacion" CssClass="btn-pago" />
                    </div>
   

            </asp:Panel>

            <%--Panel Encuesta--%> 
            <asp:Panel class="panel-encuesta" ID="PanelEncuesta" runat="server" Visible="false">
                <div align="center">
                    <h4 class="titulo-panel-encuesta">
                        <asp:Label ID="Label19" runat="server" Text="ENCUESTA" Font-Bold="true"></asp:Label>
                    </h4>

                </div>

                <asp:Panel CssClass="seccion-encuesta" ID="PanelEncuesta_inversion" runat="server">
                    <div align="center" class="section-1">
                        <asp:Label CssClass="titulo-seccion-encuesta titulo-1" ID="Label18" runat="server" Text="¿Quiere invertir? ¿En qué rango de cuota se situaría?"></asp:Label>
                        <asp:RadioButtonList CssClass="seccion-1" ID="orbEncuesta_inversion" runat="server">
                            <asp:ListItem Selected="True" Value="0">No contesta</asp:ListItem>
                            <asp:ListItem Value="1">Hasta  $  50.000</asp:ListItem>
                            <asp:ListItem Value="2">Hasta  $  70.000</asp:ListItem>
                            <asp:ListItem Value="3">Hasta  $  90.000</asp:ListItem>
                            <asp:ListItem Value="4">Hasta  $ 120.000</asp:ListItem>
                            <asp:ListItem Value="5">Mas de $ 120.000</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </asp:Panel>
                <asp:Panel CssClass="seccion-encuesta" ID="PanelEncuesta_esPropietario" runat="server">
                    <div align="center">
                        <asp:Label CssClass="titulo-seccion-encuesta titulo-2" ID="Label20" runat="server" Text="¿Es propietario?" ></asp:Label>
                        <asp:RadioButtonList CssClass="seccion-2"  ID="orbEncuesta_esPropietario" runat="server">
                            <asp:ListItem Selected="True" Value="0">No contesta</asp:ListItem>
                            <asp:ListItem Value="1">SI</asp:ListItem>
                            <asp:ListItem Value="2">NO</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </asp:Panel>

                <asp:Panel CssClass="seccion-encuesta" ID="PanelEncuesta_alquila" runat="server">
                    <div align="center">
                        <asp:Label CssClass="titulo-seccion-encuesta titulo-3" ID="Label21" runat="server" Text="¿Alquila?"></asp:Label>
                        <asp:RadioButtonList CssClass="seccion-3" ID="orbEncuesta_alquila" runat="server">
                            <asp:ListItem Selected="True" Value="0">No contesta</asp:ListItem>
                            <asp:ListItem Value="1">SI</asp:ListItem>
                            <asp:ListItem Value="2">NO</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </asp:Panel>
                <asp:Panel CssClass="seccion-encuesta" ID="PanelEncuesta_esClienteMPC" runat="server">
                    <div align="center" class="seccion-4">
                        <asp:Label CssClass="titulo-seccion-encuesta titulo-4" ID="Label22" runat="server" Text="¿Es cliente de MI PRIMER CASA?"></asp:Label>
                        <asp:RadioButtonList  ID="orbEncuesta_esClienteMPC" runat="server">
                            <asp:ListItem Selected="True" Value="0">No contesta</asp:ListItem>
                            <asp:ListItem Value="1">SI</asp:ListItem>
                            <asp:ListItem Value="2">NO</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </asp:Panel>

                <asp:Panel CssClass="seccion-encuesta" ID="PanelEncuesta_enQueInvertiria" runat="server">
                    <div align="center" class="seccion-5">
                        <asp:Label CssClass="titulo-seccion-encuesta titulo-5" ID="Label23" runat="server" Text="¿En qué invertiría?"></asp:Label>
                        <asp:RadioButtonList ID="orbEncuesta_enQueInvertiria" runat="server">
                            <asp:ListItem Selected="True" Value="0">No contesta</asp:ListItem>
                            <asp:ListItem Value="1">DEPARTAMENTO</asp:ListItem>
                            <asp:ListItem Value="2">TERRENO</asp:ListItem>
                            <asp:ListItem Value="3">CASA</asp:ListItem>

                        </asp:RadioButtonList>
                    </div>
                </asp:Panel>
            </asp:Panel>



            <asp:Panel ID="PanelAlta" runat="server" Visible="false">
                <div align="center">
                </div>

                <div align="center">

                    <asp:Label ID="olblOperacionRealizada" runat="server" Text="" Font-Bold="true" ForeColor="#0033cc"></asp:Label>
                    <br />
                    <asp:Button ID="obutOperacionRealizada" runat="server" Text="Volver para nueva compra" CssClass="btn-primary" Height="30%" Width="50%" Visible="false" />

                </div>

            </asp:Panel>
        </asp:Panel>

        <%--      </ContentTemplate>
           
        </asp:UpdatePanel>--%>
    </form>
       
     <%-- Sweet Alert --%>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     <%-- Script JS --%>
    <script src="app.js" type="text/javascript"></script>
</body>
</html>
