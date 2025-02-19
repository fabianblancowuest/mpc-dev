<%@ Page Title="Entrega de cupones numerados asignados." MaintainScrollPositionOnPostback="true" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="operadorVentaTalonPromo.aspx.vb" Inherits="Administracion_operadorVentaTalonPromo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>
        <asp:Label ID="Label1" runat="server" Text="Venta de cupones"></asp:Label>
    </h3>


    <asp:Panel ID="PanelTalonSeleccion" runat="server" Visible="true">
        <div>
            <asp:Label ID="Label22" runat="server" Text="Total de billetes asignados:"></asp:Label>
            <asp:Label ID="olblTalonesAsignados" runat="server" Text="" Font-Bold="true"></asp:Label>

        </div>
        <div>
            <asp:Label ID="Label24" runat="server" Text="Total de billetes vendidos:"></asp:Label>
            <asp:Label ID="olblTalonesVendidos" runat="server" Text="" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label23" runat="server" Text="($"></asp:Label>
            <asp:Label ID="olblTotalRecaudado" runat="server" Text="" Font-Bold="true" ForeColor="#009933"></asp:Label>

            <asp:Label ID="Label25" runat="server" Text=")"></asp:Label>

        </div>
        <div>
            <asp:Label ID="Label20" runat="server" Text="Billetes pendientes de venta:"></asp:Label>
            <asp:Label ID="olblTalonesPendientes" runat="server" Text="" Font-Bold="true"></asp:Label>

        </div>
        <div>
            <asp:Label ID="Label21" runat="server" Text="Cotizacion dólar venta:"></asp:Label>
            <asp:Label ID="olblCotizacionDolarVenta" runat="server" Text="" Font-Bold="true" ForeColor="#009933"></asp:Label>

        </div>
        <div>
            <asp:Label ID="olblLeyendaVendedor" runat="server" Text="Seleccione los cupones a entregar al cliente activando la casilla de cada uno y luego presione el botón COBRAR"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="otxtCantidad" runat="server" Text="300" Enabled="false" Visible="false"></asp:TextBox>
            <asp:TextBox ID="otxtNumeroDesde" runat="server" Text="0" Enabled="false" Visible="false"></asp:TextBox>
        </div>



        <div align="center">
            <br />
            <asp:Button ID="obutCobrar" runat="server" Text="Cobrar" CssClass="btn-success" />
            <br />
            <asp:Label ID="olblValidacionMensajeError" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
            <asp:SqlDataSource ID="odssorteoTalonVendedorVenta" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoTalonVendedorVenta" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                    <asp:ControlParameter ControlID="otxtCantidad" Name="cantidadVisualiza" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="otxtNumeroDesde" Name="numeroDesde" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvSorteoTalonVendedorVenta" runat="server" AutoGenerateColumns="False" DataKeyNames="idSorteoTalon" DataSourceID="odssorteoTalonVendedorVenta">
                <Columns>
                    <asp:TemplateField HeaderText="idSorteoTalon" InsertVisible="False" SortExpression="idSorteoTalon" Visible="False">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("idSorteoTalon") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="olblIdSorteoTalon" runat="server" Text='<%# Bind("idSorteoTalon") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="sorteoTalonNumero" HeaderText="Numero" SortExpression="sorteoTalonNumero">
                        <HeaderStyle Font-Size="XX-Large" HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="True" Font-Size="XX-Large" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Selecciona" SortExpression="sorteoTalonTomado">
                        <ItemTemplate>
                            <asp:CheckBox ID="ochSorteoTalonTomado" runat="server" Checked='<%# Bind("sorteoTalonTomado") %>' Enabled="True" />
                        </ItemTemplate>
                        <HeaderStyle Font-Size="XX-Large" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelCobranza" runat="server" Visible="false">
        <div>
            <asp:Label ID="Label3" runat="server" Text="Complete cada talón con el premio y luego confirme "></asp:Label>

            <asp:Button ID="obutSeleccion" runat="server" Text="Volver a seleccion de cupones" CssClass="btn-xs" />



        </div>

        <div>
            <asp:SqlDataSource ID="odsSorteoPremio"      runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SORTEOPREMIOPROMOTRAER4Y6oddlDescending" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="odsSorteoPremioPromo" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SORTEOPREMIOPROMOTRAER1oddlDescending" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="odsSorteoTalonDisponibleVendedor" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SorteoVendedorTalonSeleccionadoPromo1Disponibles" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>



            
            <asp:SqlDataSource ID="odsSorteoVendedorTalonSeleccionado" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SorteoVendedorTalonSeleccionadoPromo4y6" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvSorteoVendedorTalonSeleccionado" runat="server" AutoGenerateColumns="False" DataKeyNames="idSorteoTalon" DataSourceID="odsSorteoVendedorTalonSeleccionado" CssClass="table-cemmi">
                <Columns>
                    <asp:TemplateField HeaderText="idSorteoTalon" InsertVisible="False" SortExpression="idSorteoTalon" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="olblIdSorteoTalon" runat="server" Text='<%# Bind("idSorteoTalon") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="sorteoTalonNumero" HeaderText="Numero" SortExpression="sorteoTalonNumero" />
                    <asp:TemplateField HeaderText="Premio" SortExpression="idSorteoPremio">
                        <ItemTemplate>
                            <asp:DropDownList ID="oddlPremio" runat="server" DataSourceID="odsSorteoPremio" DataTextField="sorteoPremioDescripcion" DataValueField="idSorteoPremio" SelectedValue='<%# Bind("idSorteoPremio")%>' AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Precio" HeaderText="Precio" ReadOnly="True" SortExpression="sorteoTalonMonto" DataFormatString="{0:c}">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:Panel ID="PanelPromocion" runat="server">
        <div>
            <asp:Label ID="Label26" runat="server" Text="Billetes con premios mayores:"></asp:Label>
            <asp:Label ID="olblpremioMayorBilleteCantidad" runat="server" Text=""></asp:Label>
            <asp:Label ID="Label27" runat="server" Text="Billetes de obsequio:"></asp:Label>
            <asp:Label ID="olbpromocionBilleteCantidad" runat="server" Text=""></asp:Label>
            <asp:Label ID="olblPromocionMensaje" runat="server" Font-Size ="X-Small" Text="Por la compra de cada 2 billetes de los premios mayores corresponde un billete del menor premio de obsequio al cliente. Recuerde que al final de la operación el sistema notificará al cliente mediante un mensaje de whatsapp los datos del vendedor y el asiento de la compra realizada junto con la promocion de la Empresa.   ."></asp:Label>
            
            <div>
            <asp:SqlDataSource ID="odsOperadorBilleteObsequio" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from sorteoTalonOperadorPremioPromocion where idOperador=@idOperador order by id">
                <SelectParameters>
                    <asp:SessionParameter Name="idOperador" SessionField="idOperador" />
                </SelectParameters>
                </asp:SqlDataSource>
                <div align="center" >
                    <asp:Label ID="Label28" runat="server" Text="Seleccione los billetes de obsequio:" Font-Bold="true" ></asp:Label>
                
                <asp:GridView ID="ogvOperadorBilleteObsequio" runat="server" AutoGenerateColumns="False" DataSourceID="odsOperadorBilleteObsequio">
                    <Columns>
                        <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" Visible="False">
                           
                            <ItemTemplate>
                                <asp:Label ID="olblID" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                        <asp:TemplateField HeaderText="Seleccione billete promocionado " SortExpression="idSorteoTalon">
                            
                            <ItemTemplate>
                                <asp:DropDownList ID="oddlBonoLibreOperador" runat="server" DataSourceID="odsSorteoTalonDisponibleVendedor" DataTextField="sorteoTalonNumero" DataValueField="idSorteoTalon" selectedValue='<%# Bind("idSorteoTalon") %>' AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView></div>
            </div>


             <asp:SqlDataSource ID="odsSorteoVendedorTalonPromoSeleccionado" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoTalonOperadorPremioPromocionTrae" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
              <asp:GridView ID="ogvSorteoVendedorTalonSeleccionadoPromo" runat="server" AutoGenerateColumns="False" DataKeyNames="idSorteoTalon" DataSourceID="odsSorteoVendedorTalonPromoSeleccionado" CssClass="table-cemmi">
                <Columns>
                    <asp:TemplateField HeaderText="idSorteoTalon" InsertVisible="False" SortExpression="idSorteoTalon" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="olblIdSorteoTalon" runat="server" Text='<%# Bind("idSorteoTalon") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="sorteoTalonNumero" HeaderText="Numero" SortExpression="sorteoTalonNumero" />
                    <asp:BoundField DataField="idSorteoPremio" HeaderText="Numero" SortExpression="idSorteoPremio" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" ReadOnly="True" SortExpression="sorteoTalonMonto" DataFormatString="{0:c}">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>


        </div>
        </asp:Panel>
        <div align="center">
            <asp:Label ID="Label5" runat="server" Text="Cantidad de billetes vendidos : " Font-Bold="true"></asp:Label>
            <asp:Label ID="olblCantidadTotal" runat="server" Text="0" Font-Bold="true" Font-Size="XX-Large" Width="100%"></asp:Label>
        </div>
         <div align="center">
            <asp:Label ID="Label29" runat="server" Text="Cantidad de billetes Promocionados : " Font-Bold="true"></asp:Label>
            <asp:Label ID="olblCantidadPromocionado" runat="server" Text="0" Font-Bold="true" Font-Size="XX-Large" Width="100%"></asp:Label>
        </div>

        <div align="center">
            <asp:Label ID="Label4" runat="server" Text="Importe de los talones seleccionados : " Font-Bold="true"></asp:Label>
            <br />

            <asp:Label ID="Label6" runat="server" Text="$" Font-Bold="true" Font-Size="XX-Large"></asp:Label>
            <asp:Label ID="olblMontoTotal" runat="server" Text="0" Font-Bold="true" Font-Size="XX-Large" Width="50%"></asp:Label>

            <div>
                <asp:Label ID="olblValidacionMensajeErrores" runat="server" Text="0" Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
                <asp:Label ID="olblValidacionMensajeErrorPremio" runat="server" Text="" Font-Bold="true" ForeColor="Red"></asp:Label>
            </div>
        </div>


    </asp:Panel>
    <asp:Panel ID="PanelValores" runat="server" Visible="false">
        <div align="center">
            <asp:Label ID="Label12" runat="server" Text="Confirma Operación"></asp:Label>
            <br />
            <asp:Label ID="Label13" runat="server" Text="Al seleccionar el modo de pago la presente operación se confirmará y deberá completar el cobro del / los cupones entregados al cliente." Font-Size="X-Small"></asp:Label>
            <h3>Transacción Número :  <% = Session("idSorteoTalonCobranza")%>
            </h3>
            <asp:RadioButtonList ID="orbValores" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">

                <asp:ListItem Value="1">Efectivo</asp:ListItem>
                <asp:ListItem Value="2">Transf </asp:ListItem>
                <asp:ListItem Value="3">Ef+Traf.</asp:ListItem>

            </asp:RadioButtonList>

            <div>
                <asp:Label ID="olblMensajeGrabacionCobranza" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <asp:Panel ID="PanelEfectivo" runat="server" Visible="false">
            <div>
                <asp:Label ID="olblValorEfectivo" runat="server" Text="Efectivo" Width="30%"></asp:Label>
                <asp:TextBox ID="otxtValorEfectivoMonto" runat="server"></asp:TextBox>
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
                    <asp:TextBox ID="otxtDatosBancoParaTransferencia03" runat="server" BackColor="LightGray" Width="90%" Text="ALIAS : sorteo.billete.mpc" Font-Bold="true"></asp:TextBox>
                </div>
                <asp:Label ID="olblValorTransferenciaMonto" runat="server" Text="Valor Transferencia" Width="30%"></asp:Label>
                <asp:TextBox ID="otxtValorTransferenciaMonto" runat="server" Width="20%"></asp:TextBox>
                <asp:Button ID="obutValoresComplementar" runat="server" Text="( @ ) " /><br />
                <asp:Label ID="olblValorTransferenciaNumero" runat="server" Text="Numero de Transferencia" Width="30%"></asp:Label>
                <asp:TextBox ID="otxtValorTransferenciaNumero" runat="server"></asp:TextBox><br />
                <div>
                    <asp:FileUpload ID="FileUpLoad2" Text="Seleccionar Archivo" runat="server" />
                </div>
                <div>
                    <asp:Button ID="UploadBtn" Text="Subir Imagen" OnClick="UploadBtn_Click" runat="server" CssClass="sdsasdasd" />
                    <asp:Label ID="olblMensajeUpload" runat="server" Text=""></asp:Label>
                    <asp:Label ID="olblIdPrestadorVehiculo" runat="server" Text=""></asp:Label>
                    <asp:Label ID="olblPrevisualiza" runat="server" Text=""></asp:Label>
                    <asp:Label ID="olblidImagenTipo" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Image ID="Image1" runat="server" Width="90%" Height="90%" />
                    <br />
                    <asp:Label ID="olblGestionGrabacion" runat="server" Text=""></asp:Label>
                    <asp:Label ID="olblIdPrestadorVehiculoImagen" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </asp:Panel>
    </asp:Panel>




    <asp:Panel ID="PanelCliente" runat="server" Visible="false">
        <div>
            <asp:Label ID="Label7" runat="server" Text="Datos del Cliente"></asp:Label>
        </div>

        <div>
            <asp:Label ID="Label8" runat="server" Text="Apellido y Nombres:"></asp:Label>
            <asp:TextBox ID="otxtClienteApyNom" runat="server" Width="100%"></asp:TextBox>

        </div>

        <div>
            <asp:Label ID="Label9" runat="server" Text="Número de teléfono:"></asp:Label>
            <asp:TextBox ID="otxtClienteTelefono" runat="server" Width="100%"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="Label10" runat="server" Text="Correo electrónico:"></asp:Label>
            <asp:TextBox ID="otxtClienteCorreoElectronico" runat="server" Width="100%"></asp:TextBox>
        </div>

        <div align="center">
            <h4>
                <asp:Label ID="Label19" runat="server" Text="ENCUESTA" Font-Bold="true"></asp:Label>
            </h4>

        </div>

        <asp:Panel ID="PanelEncuesta_inversion" runat="server" BackColor="#ffff99">
            <div align="center">
                <asp:Label ID="Label14" runat="server" Text="Quiere invertir ? En què rango de cuota se situarìa ?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
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
                <asp:Label ID="Label15" runat="server" Text="Es propietario ?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                <asp:RadioButtonList ID="orbEncuesta_esPropietario" runat="server">
                    <asp:ListItem Selected="True" Value="0">No preguntado</asp:ListItem>
                    <asp:ListItem Value="1">SI</asp:ListItem>
                    <asp:ListItem Value="2">NO</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </asp:Panel>

        <asp:Panel ID="PanelEncuesta_alquila" runat="server" BackColor="#ffff99">
            <div align="center">
                <asp:Label ID="Label16" runat="server" Text="Alquila ?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                <asp:RadioButtonList ID="orbEncuesta_alquila" runat="server">
                    <asp:ListItem Selected="True" Value="0">No preguntado</asp:ListItem>
                    <asp:ListItem Value="1">SI</asp:ListItem>
                    <asp:ListItem Value="2">NO</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </asp:Panel>
        <asp:Panel ID="PanelEncuesta_esClienteMPC" runat="server" BackColor="#ccffcc">
            <div align="center">
                <asp:Label ID="Label17" runat="server" Text="Es cliente de MI PRIMER CASA ?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
                <asp:RadioButtonList ID="orbEncuesta_esClienteMPC" runat="server">
                    <asp:ListItem Selected="True" Value="0">No preguntado</asp:ListItem>
                    <asp:ListItem Value="1">SI</asp:ListItem>
                    <asp:ListItem Value="2">NO</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </asp:Panel>

        <asp:Panel ID="Panel1" runat="server" BackColor="#ffff99">
            <div align="center">
                <asp:Label ID="Label18" runat="server" Text="En qué invertirìa ?" Font-Bold="true" Font-Size="X-Large"></asp:Label>
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
            <asp:Label ID="olblMensajeValidacion" runat="server" Text="" ForeColor="Red"></asp:Label>



        </div>


        <div align="center">

            <asp:Button ID="obutConfirmaOperacion" runat="server" Text="Confirma Operacion" CssClass="btn-success" Height="30%" Width="50%" />
             <br />
             <asp:Label ID="olblOperacionRealizada" runat="server" Text="" Font-Bold="true" ForeColor="#0033cc"></asp:Label>
            <br />
            <asp:Button ID="obutOperacionRealizada" runat="server" Text="Volver para nueva venta"  CssClass="btn-primary" Height="30%" Width="50%" Visible="false" />
            <br />
            <asp:Button ID="obutMenuPrincipal" runat="server" Text="Volver al menú de roles asignados" CssClass="btn-danger" Height="30%" Width="50%" Visible="false" />



        </div>




    </asp:Panel>



</asp:Content>

