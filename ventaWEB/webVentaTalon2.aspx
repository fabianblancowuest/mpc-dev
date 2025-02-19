<%@ Page Language="VB" AutoEventWireup="false" MaintainScrollPositionOnPostback="true" CodeFile="webVentaTalon2.aspx.vb" Inherits="ventaWEB_webVentaTalon2" %>

<%@ Register Src="~/Administracion/whatsappValidador.ascx" TagPrefix="uc1" TagName="whatsappValidador" %>
<%--<%@ Register Src="~/Administracion/correoElectronicoValidador.ascx" TagPrefix="uc1" TagName="correoElectronicoValidador" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Venta de billetes sorteo día de la Madre Mi Primer Casa - 20 de Octubre de 2024 - </title>
    <link href="../css/bootstrap-pachu.css" rel="stylesheet" />
    <link href="../css/bootstrap-datepicker.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2, user-scalable=no" />
    <%--  <meta http-equiv ="refresh" content ="5" />--%>
    <style type="text/css">
        .btn-success {
            margin-top: 0px;
        }
    </style>
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
        <div align="center">

            <asp:Label ID="Label2" runat="server" Text="Mi Primer Casa S.A." Font-Bold="true"></asp:Label>
        </div>
        <div align="center">
            <asp:Label ID="Label1" runat="server" Text="Bienvenido a la plataforma de ventas de billetes para el sorteo del día de la Madre del año 2024." Font-Size="Small" Height="18px"></asp:Label>
        </div>

        <asp:Label ID="olblSession" runat="server" Text="" Visible="false" CssClass=""></asp:Label>
        <asp:Label ID="olblIdOperador" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="idOperador" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="olblIdSorteo" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="olblIdContactoTipo" runat="server" Text="" Visible="false"></asp:Label>

        <div align="center">

            <asp:TextBox ID="olblInformacionVenta" runat="server" Width="100%" TextMode="MultiLine" Enabled="false" Height="60px"></asp:TextBox>
            <%-- <asp:Label ID="olblInformacionVenta" runat="server" Text="" Font-Bold ="true" Font-Size="Medium"  ></asp:Label>--%>
        </div>
        <div align="center">
            <asp:Label ID="olblPar02" runat="server" Text="" Font-Size="Large" Visible="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="oparCorreo" runat="server" Text="" Font-Bold ="true"></asp:Label>
         </div>
        <div>
            <asp:Label ID="oparCelular" runat="server" Text="" Font-Bold ="true"></asp:Label>
        </div>
        <div align="center">

            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Paso 1 ->"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Paso 2 ->"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Paso 3 "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="obutNumeros" runat="server" Text="Números" CssClass="btn-success" Height="80px" Width="100%" Font-Bold="true" BackColor="Green" ForeColor="White" />

                    </td>
                    <td>
                        <asp:Button ID="obutPremios" runat="server" Text="Premios" CssClass="btn-success" Height="80px" Width="100%" Font-Bold="true" BackColor="Gray" ForeColor="White" Enabled="false" />

                    </td>
                    <td>
                        <asp:Button ID="obutCobrar" runat="server" Text="Pagar" CssClass="btn-success" Height="80px" Width="100%" Font-Bold="true" BackColor="Gray" ForeColor="White" Enabled="false" />

                    </td>
                </tr>
            </table>
        </div>
        <asp:Panel ID="PanelNumeros" runat="server">
            <div>
                <asp:TextBox ID="otxtCantidad" runat="server" Text="50" Enabled="false" Visible="false"></asp:TextBox>
                <asp:TextBox ID="otxtNumeroDesde" runat="server" Text="0" Enabled="false" Visible="false"></asp:TextBox>
            </div>

            <div align="center">

                <asp:Label ID="olblBilletesSeleccionadosCantidad" runat="server" Text="" ForeColor="Blue" Font-Bold="true" Visible="true" Font-Size="Small"></asp:Label>

                <asp:Label ID="olblBilletesSeleccionados" runat="server" Text="" ForeColor="Blue" Font-Bold="true" Visible="true" Font-Size="Small"></asp:Label>
                <p>
                    <asp:Label ID="olblValidacionMensajeError" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Small"></asp:Label>
                    <asp:Label ID="olblGestionCodigo" runat="server" Text="" ForeColor="Red" Font-Bold="true" Visible="false" Font-Size="Small"></asp:Label>
                    <p>
                        <asp:Label ID="olblGestionDescripcion" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Small"></asp:Label>

                        <asp:SqlDataSource ID="odssorteoTalonVendedorVenta" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoTalonVendedorVentaWEB" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="IdOperador" Name="idOperador" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="olblIdSorteo" Name="idSorteo" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="otxtCantidad" Name="cantidadVisualiza" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="otxtNumeroDesde" Name="numeroDesde" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="olblSession" Name="sorteoTalonSession" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="ogvSorteoTalonVendedorVenta" runat="server" AutoGenerateColumns="False" DataKeyNames="idSorteoTalon" DataSourceID="odssorteoTalonVendedorVenta" Width="90%" CssClass="table-cemmi">
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
                                    <HeaderStyle Font-Size="XX-Large" HorizontalAlign="Center" />
                                    <ItemStyle Font-Bold="True" Font-Size="XX-Large" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Seleccione su número <br/><b> &#x2198; ⬇⬇⬇  &#x2199;</b>" SortExpression="sorteoTalonTomado">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="ochSorteoTalonTomado" runat="server" Checked='<%# Bind("sorteoTalonTomado") %>' Enabled="True" AutoPostBack="true" OnCheckedChanged="talonVendedorToma" />
                                    </ItemTemplate>
                                    <HeaderStyle Font-Size="XX-Large" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
            </div>

        </asp:Panel>

        <asp:Panel ID="PanelPremio" runat="server" Visible="false">
            <div align="center">
                <asp:Label ID="Label6" runat="server" Text="Complete cada talón con el premio y luego confirme " Font-Size="Small" Font-Bold="true"></asp:Label>

            </div>

            <div>
                <asp:SqlDataSource ID="odsSorteoPremio" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SORTEOPREMIOTraeroddlDescending" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                <asp:SqlDataSource ID="odsSorteoVendedorTalonSeleccionado" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SorteoVendedorTalonSeleccionadoWEB" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="olblSession" Name="sorteoTalonSession" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvSorteoVendedorTalonSeleccionado" runat="server" AutoGenerateColumns="False" DataKeyNames="idSorteoTalon" DataSourceID="odsSorteoVendedorTalonSeleccionado" CssClass="table-cemmi" Font-Size="Small">
                    <Columns>
                        <asp:TemplateField HeaderText="idSorteoTalon" InsertVisible="False" SortExpression="idSorteoTalon" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="olblIdSorteoTalon" runat="server" Text='<%# Bind("idSorteoTalon") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="sorteoTalonNumero" HeaderText="NUMERO" SortExpression="sorteoTalonNumero">
                            <ControlStyle Width="20%" />
                            <ItemStyle Font-Bold="True" Font-Size="Larger" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="P R E M I O S" SortExpression="idSorteoPremio">
                            <ItemTemplate>
                                <asp:DropDownList ID="oddlPremio" runat="server" DataSourceID="odsSorteoPremio" DataTextField="sorteoPremioDescripcion" DataValueField="idSorteoPremio" SelectedValue='<%# Bind("idSorteoPremio")%>' AutoPostBack="True" Font-Size="Large" Width="80%" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <ControlStyle Width="100%" />
                            <HeaderStyle Width="60%" />
                            <ItemStyle Width="60%" HorizontalAlign="Center" Font-Size="X-Small" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Precio" HeaderText="PRECIO" ReadOnly="True" SortExpression="sorteoTalonMonto" DataFormatString="{0:c}">
                            <ControlStyle Width="20%" />
                            <ItemStyle HorizontalAlign="Right" Font-Bold="True" Font-Size="Small" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>

            <div align="center">
                <asp:Label ID="Label7" runat="server" Text="Cantidad de talones seleccionados : " Font-Bold="true" Font-Size="Small"></asp:Label>
                <asp:Label ID="olblCantidadTotal" runat="server" Text="0" Font-Bold="true" Font-Size="Small" Width="20%"></asp:Label>
            </div>


            <div align="center">
                <asp:Label ID="Label8" runat="server" Text="Importe de los talones seleccionados : " Font-Bold="true" Font-Size="Small"></asp:Label>
                <asp:Label ID="Label9" runat="server" Text="$" Font-Bold="true" Font-Size="Small"></asp:Label>
                <asp:Label ID="olblMontoTotal" runat="server" Text="0" Font-Bold="true" Font-Size="Small" Width="20%"></asp:Label>

                <div>
                    <asp:Label ID="olblValidacionMensajeErrores" runat="server" Text="0" Font-Bold="true" ForeColor="Red" Visible="false" Font-Size="Small"></asp:Label>
                    <asp:Label ID="olblValidacionMensajeErrorPremio" runat="server" Text="" Font-Bold="true" ForeColor="Red" Font-Size="Small"></asp:Label>
                </div>

                <div align="center">
                    <asp:TextBox ID="otxtLeyendaPago" runat="server" Text="Usted ha conformado su compra. Si desea agregar más billetes o quitar billetes antes de confirmar la operacion , puede hacerlo presionando los botones NUMEROS y PREMIOS hasta que sea de su entera satisfaccion el monto de su compra. Pulse PAGAR para comenzar el proceso de Pago" TextMode="MultiLine" Width="100%" Height="90px" BackColor="White" Enabled="false" Font-Size="Small" Visible="false"></asp:TextBox>

                    <asp:Button ID="obutRealizarPago" runat="server" Text="PAGAR" BackColor="Green" Font-Bold="true" ForeColor="White" Font-Size="XX-Large" Width="90%" Height="80px" Visible="false" />
                </div>
        </asp:Panel>

        <asp:Panel ID="PanelConfirmaOperacion" runat="server" Visible="false">
            <asp:Panel ID="PanelValores" runat="server" Visible="false">
                <div align="center">
                    <asp:Label ID="Label12" runat="server" Text="Monto a pagar :"></asp:Label>
                    <asp:Label ID="olblPagoConfirmadoMonto" runat="server" Text=""></asp:Label>
                </div>
                <div align="center">

                    <asp:Button ID="obutOpcionPagoConMercadoPago" runat="server" Text="PAGAR CON MERCADO PAGO " Width="70%" />
                    <asp:Button ID="obutTransferenciaAMercadoPago" runat="server" Text="TRANSFERENCIA A MERCADO PAGO POR ALIAS" Width="70%" />
                    <asp:Button ID="obutVolverFormasDePago" runat="server" Text="Mostrar opciones de Pago" Width="70%" Visible="false" />

                </div>



                <div>
                    <asp:Label ID="olblMensajeGrabacionCobranza" runat="server" Text=""></asp:Label>
                </div>
                </div>
                        <asp:Panel ID="PanelMercadoPAgo" runat="server" Visible="false">
                            <div>
                                <asp:Label ID="olblValorEfectivo" runat="server" Text="PAGAR CON MERCADO PAGO" Width="90%"></asp:Label>
                                <asp:TextBox ID="otxtValorEfectivoMonto" runat="server" Enabled="false" Visible="false" Text="0"></asp:TextBox>
                            </div>

                            <div align="center">
                                <asp:TextBox ID="otxtMercadoPagoInstrucciones" runat="server" TextMode="MultiLine" Width="90%" Height="200px" Enabled="false" Text="Esta opción es válida sólo para usuarios de la plataforma MERCADO PAGO . Debe presionar el botón PAGAR CON MERCADO PAGO para ingresar a la aplicación de MERCADO PAGO para poder seleccionar el medio de pago , y luego de digitar el monto correspondiente a la compra en proceso confirmar la operación. Una vez confirmado el pago, realizar la captura de pantalla y adjuntar la imagen del comprobante para su registro y posterior validación."></asp:TextBox>
                            </div>



                            <div align="center">
                                <asp:Button ID="obutPagaConMercadoPago" runat="server" Text="  PAGAR CON MERCADO PAGO " BackColor="#00ccff" ForeColor="White" Font-Bold="true" Font-Size="Medium" Width="90%" Height="60px" />


                            </div>

                        </asp:Panel>

                <asp:Panel ID="PanelTransferencia" runat="server" Visible="false">
                    <div>
                        <div align="center">
                            <asp:TextBox ID="otxtDatosBancoParaTransferencia01" runat="server" BackColor="LightGray" Width="90%" Text="Datos cuenta en MERCADO PAGO" Font-Bold="true"></asp:TextBox>
                        </div>
                        <div align="center">
                            <asp:TextBox ID="otxtDatosBancoParaTransferencia02" runat="server" BackColor="LightGray" Width="90%" Text="CVU : 0000003100050215684489" Font-Bold="true"></asp:TextBox>
                        </div>
                        <div align="center">
                            <asp:TextBox ID="otxtDatosBancoParaTransferencia03" runat="server" BackColor="LightGray" Width="90%" Text="ALIAS : sorteo.billete.mpc " Font-Bold="true"></asp:TextBox>
                        </div>
                </asp:Panel>

                <asp:Panel ID="PanelUpload" runat="server" Visible="false">



                    <asp:Label ID="olblValorTransferenciaMonto" runat="server" Text="Valor Transferencia" Width="30%" Visible="false"></asp:Label>

                    <asp:TextBox ID="otxtValorTransferenciaMonto" runat="server" Width="20%" Visible="false"></asp:TextBox>
                    <asp:Button ID="obutValoresComplementar" runat="server" Text="( @ )" Visible="false" /><br />
                    <div align="center">
                        <asp:TextBox ID="Label24" runat="server" Text="Seleccione la imagen del comprobante de pago en su dispositivo. Luego presione el botón SUBIR IMAGEN para visualiarla." TextMode="MultiLine" Width="90%" Font-Size="Small" Height="50px"></asp:TextBox>
                    </div>

                    <div>
                        <asp:FileUpload ID="FileUpLoad2" Text="Seleccionar Archivo" runat="server" OnInit="subirImagen" />
                    </div>
                    <div>


                        <asp:Button ID="UploadBtn" Text="Subir Imagen" OnClick="UploadBtn_Click" runat="server" CssClass="sdsasdasd" />
                        <asp:Label ID="olblMensajeUpload" runat="server" Text="" Font-Size="Small"></asp:Label>
                        <asp:Label ID="olblPrevisualiza" runat="server" Text="" Font-Size="Small"></asp:Label>
                        <asp:Label ID="olblidImagenTipo" runat="server" Text="" Font-Size="Small"></asp:Label>
                        <br />
                        <asp:Label ID="olblValorTransferenciaNumero" runat="server" Text="Numero de Transferencia" Width="40%" Font-Size="Small" Font-Bold="true"></asp:Label>
                        <asp:TextBox ID="otxtValorTransferenciaNumero" runat="server" Width="40%"></asp:TextBox><br />
                        <asp:Label ID="Label13" runat="server" Text="Ingrese el numero de comprobante que figura en la imagen escaneada." Font-Size="Small"></asp:Label>
                        <br />
                        <asp:Button ID="obutConfirmaPago" runat="server" Text="Confirme el pago." />

                        <asp:Image ID="Image1" runat="server" Width="50%" Height="50%" ImageUrl="https://www.miprimercasa.ar/talonesWEB/mercadoPagoImagenPendiente.jpg" />
                        <br />
                        <asp:Label ID="olblGestionGrabacion" runat="server" Text=""></asp:Label>
                        <asp:Label ID="olblIdPrestadorVehiculoImagen" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                    </div>

                </asp:Panel>

            </asp:Panel>

            <asp:Panel ID="PanelCliente" runat="server" Visible="false">


                <h3>Transacción Número
                           <asp:Label ID="olblIdSorteoTalonCobranza" runat="server" Text="" Visible="true"></asp:Label>

                </h3>
                <div align="center">
                    <asp:TextBox ID="Label25" runat="server" Text="Felicitaciones !! Usted ya está participando por el / los premios mayores de los sorteos de Octubre !" Font-Size="Medium" TextMode="MultiLine" Width="90%" Enabled="false" Height="60px" BorderWidth="0"></asp:TextBox>


                    <asp:TextBox ID="Label14" runat="server" Text="Complete sus datos para que podamos enviarle sus comprobantes a su correo electrónico y Whatsapp" Font-Size="Small" TextMode="MultiLine" Width="90%" Enabled="false" Height="40px" BorderWidth="0"></asp:TextBox>

                </div>

                <div>
                    <asp:Label ID="Label15" runat="server" Text="Apellido y Nombres:"></asp:Label>
                    <asp:TextBox ID="otxtClienteApyNom" runat="server" Width="100%"></asp:TextBox>

                </div>
                <div>
                    <uc1:whatsappValidador runat="server" ID="whatsappValidador" />

                </div>


              <%--  <div>
                    <uc1:correoElectronicoValidador runat="server" ID="correoElectronicoValidador" />
                </div>
--%>

                <div align="center">
                    <asp:Label ID="olblMensajeValidacion" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
                <div align="center">
                    <asp:Button ID="obutConfirmaOperacion" runat="server" Text="Confirma Operacion" CssClass="btn-success" Height="30%" Width="50%" />
                </div>
                <br />

            </asp:Panel>


            <asp:Panel ID="PanelEncuesta" runat="server" Visible="false">
                <div align="center">
                    <h4>
                        <asp:Label ID="Label19" runat="server" Text="ENCUESTA" Font-Bold="true"></asp:Label>
                    </h4>

                </div>

                <asp:Panel ID="PanelEncuesta_inversion" runat="server" BackColor="#ffff99">
                    <div align="center">
                        <asp:Label ID="Label18" runat="server" Text="Quiere invertir ? En què rango de cuota se situarìa ?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                        <asp:RadioButtonList ID="orbEncuesta_inversion" runat="server">
                            <asp:ListItem Selected="True" Value="0">No contesta</asp:ListItem>
                            <asp:ListItem Value="1">Hasta  $  50.000</asp:ListItem>
                            <asp:ListItem Value="2">Hasta  $  70.000</asp:ListItem>
                            <asp:ListItem Value="3">Hasta  $  90.000</asp:ListItem>
                            <asp:ListItem Value="4">Hasta  $ 120.000</asp:ListItem>
                            <asp:ListItem Value="5">Mas de $ 120.000</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </asp:Panel>
                <asp:Panel ID="PanelEncuesta_esPropietario" runat="server" BackColor="#ccffcc">
                    <div align="center">
                        <asp:Label ID="Label20" runat="server" Text="Es propietario ?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                        <asp:RadioButtonList ID="orbEncuesta_esPropietario" runat="server">
                            <asp:ListItem Selected="True" Value="0">No contesta</asp:ListItem>
                            <asp:ListItem Value="1">SI</asp:ListItem>
                            <asp:ListItem Value="2">NO</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </asp:Panel>

                <asp:Panel ID="PanelEncuesta_alquila" runat="server" BackColor="#ffff99">
                    <div align="center">
                        <asp:Label ID="Label21" runat="server" Text="Alquila ?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                        <asp:RadioButtonList ID="orbEncuesta_alquila" runat="server">
                            <asp:ListItem Selected="True" Value="0">No contesta</asp:ListItem>
                            <asp:ListItem Value="1">SI</asp:ListItem>
                            <asp:ListItem Value="2">NO</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </asp:Panel>
                <asp:Panel ID="PanelEncuesta_esClienteMPC" runat="server" BackColor="#ccffcc">
                    <div align="center">
                        <asp:Label ID="Label22" runat="server" Text="Es cliente de MI PRIMER CASA ?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                        <asp:RadioButtonList ID="orbEncuesta_esClienteMPC" runat="server">
                            <asp:ListItem Selected="True" Value="0">No contesta</asp:ListItem>
                            <asp:ListItem Value="1">SI</asp:ListItem>
                            <asp:ListItem Value="2">NO</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </asp:Panel>

                <asp:Panel ID="PanelEncuesta_enQueInvertiria" runat="server" BackColor="#ffff99">
                    <div align="center">
                        <asp:Label ID="Label23" runat="server" Text="En qué invertirìa ?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
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
</body>
</html>
