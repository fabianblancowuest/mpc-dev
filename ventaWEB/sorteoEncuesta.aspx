<%@ Page Title="" Language="VB" MasterPageFile="~/ventaWEB/sorteo.master" AutoEventWireup="false" CodeFile="sorteoEncuesta.aspx.vb" Inherits="ventaWEB_sorteoEncuesta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                    <asp:TextBox ID="Label25" runat="server" Text="Felicitaciones !! Usted ya está participando por el / los premios mayores de los sorteos de Octubre !" Font-Size="Medium" TextMode="MultiLine" Width="90%" Enabled ="false" Height="60px" BorderWidth ="0"></asp:TextBox>


                    <asp:TextBox ID="Label14" runat="server" Text="Complete sus datos para que podamos enviarle sus comprobantes a su correo electrónico y Whatsapp" Font-Size="Small" TextMode ="MultiLine"  Width="90%"  Enabled ="false" Height ="40px" BorderWidth="0"></asp:TextBox>

                </div>

                <div>
                    <asp:Label ID="Label15" runat="server" Text="Apellido y Nombres:"></asp:Label>
                    <asp:TextBox ID="otxtClienteApyNom" runat="server" Width="100%"></asp:TextBox>

                </div>
  <div>
                    <uc1:whatsappValidador runat="server" ID="whatsappValidador" />

                </div>
                

                <div>
                   <uc1:correoElectronicoValidador runat="server" ID="correoElectronicoValidador" />
                </div>

              
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
                            <asp:ListItem Selected="True" Value="0">No preguntado</asp:ListItem>
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
                            <asp:ListItem Selected="True" Value="0">No preguntado</asp:ListItem>
                            <asp:ListItem Value="1">SI</asp:ListItem>
                            <asp:ListItem Value="2">NO</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </asp:Panel>

                <asp:Panel ID="PanelEncuesta_alquila" runat="server" BackColor="#ffff99">
                    <div align="center">
                        <asp:Label ID="Label21" runat="server" Text="Alquila ?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                        <asp:RadioButtonList ID="orbEncuesta_alquila" runat="server">
                            <asp:ListItem Selected="True" Value="0">No preguntado</asp:ListItem>
                            <asp:ListItem Value="1">SI</asp:ListItem>
                            <asp:ListItem Value="2">NO</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </asp:Panel>
                <asp:Panel ID="PanelEncuesta_esClienteMPC" runat="server" BackColor="#ccffcc">
                    <div align="center">
                        <asp:Label ID="Label22" runat="server" Text="Es cliente de MI PRIMER CASA ?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                        <asp:RadioButtonList ID="orbEncuesta_esClienteMPC" runat="server">
                            <asp:ListItem Selected="True" Value="0">No preguntado</asp:ListItem>
                            <asp:ListItem Value="1">SI</asp:ListItem>
                            <asp:ListItem Value="2">NO</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </asp:Panel>

                <asp:Panel ID="PanelEncuesta_enQueInvertiria" runat="server" BackColor="#ffff99">
                    <div align="center">
                        <asp:Label ID="Label23" runat="server" Text="En qué invertirìa ?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                        <asp:RadioButtonList ID="orbEncuesta_enQueInvertiria" runat="server">
                            <asp:ListItem Selected="True" Value="0">No preguntado</asp:ListItem>
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
                    <asp:Button ID="obutOperacionRealizada" runat="server" Text="Volver para nueva venta" CssClass="btn-primary" Height="30%" Width="50%" Visible="false" />
                    <br />
                    <asp:Button ID="obutMenuPrincipal" runat="server" Text="Volver al menú de roles asignados" CssClass="btn-danger" Height="30%" Width="50%" Visible="false" />



                </div>




            </asp:Panel>
        </asp:Panel>



</asp:Content>

