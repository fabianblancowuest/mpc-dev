<%@ Page Language="VB" MasterPageFile="~/master/p.master" MaintainScrollPositionOnPostback="true"
    AutoEventWireup="false" CodeFile="loteVentaVendedo22.aspx.vb"
    Inherits="STRSYSTEM_Administracion_LOTEVENTAVENDEDOR22" Title="Tratamiento de venta de lotes por vendedor"
    Culture="es-AR" %>

<%@ Register Src="~/Administracion/loteDocumentacionNuevo.ascx" TagPrefix="uc1" TagName="loteDocumentacion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true">
    </asp:ScriptManager>
    <div>
        <asp:Label ID="olblSeleccionaBarrio" runat="server" Text="Seleccione Barrio"></asp:Label>
        <asp:SqlDataSource ID="odsBarrioHabilitadoSelecciona" runat="server"
            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOTraerODDL"
            SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:DropDownList ID="oddlBarrioHabilitadoSelecciona" runat="server" AutoPostBack="True"
            DataSourceID="odsBarrioHabilitadoSelecciona" DataTextField="barrioDescripcion"
            DataValueField="idBarrio" Width="100%">
        </asp:DropDownList>
    </div>

    <div>
        <asp:Label ID="olblSeleccionaManzana" runat="server" Text="Seleccione Manzana"></asp:Label>
        <asp:SqlDataSource ID="odsBarrioHabilitadoManzanaSelecciona" runat="server"
            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
            SelectCommand="barrioHabilitadoManzanaSeleccionaLibre" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona" Name="idBarrio"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="oddlBarrioHabilitadoManzanaSelecciona" runat="server" AutoPostBack="True"
            DataSourceID="odsBarrioHabilitadoManzanaSelecciona" DataTextField="barrioManzanaDescripcion"
            DataValueField="idBarrioManzana" Width="100%">
        </asp:DropDownList>
    </div>

    <asp:Panel ID="Panel1" runat="server">
        <div class="row">

            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="SELECCIONE  LOTE:" CssClass="control-label">
                </asp:Label>
                <asp:Label ID="Label11" runat="server" Text=" -   (Todos los lotes)"></asp:Label>
                <asp:CheckBox ID="ochTodos" runat="server" Checked="false" AutoPostBack="true" />
                <asp:SqlDataSource ID="odsBARRIOLOTEOperador" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="BARRIOMANZANALOTEOPERADORSELECCIONA"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idOperador"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona"
                            PropertyName="SelectedValue" Name="idBarrio" Type="Int32"></asp:ControlParameter>
                        <asp:ControlParameter ControlID="oddlBarrioHabilitadoManzanaSelecciona"
                            PropertyName="SelectedValue" Name="idBarrioManzana" Type="Int32"></asp:ControlParameter>
                        <asp:ControlParameter ControlID="ochTodos" PropertyName="Checked" Name="todos"
                            Type="Int32"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="oddlBARRIOLOTEOperador" runat="server"
                    DataSourceID="odsBARRIOLOTEOPERADOR" DataTextField="BARRIOLOTEDescripcion"
                    DataValueField="idBARRIOLOTE" CssClass="form-control" AutoPostBack="True">
                </asp:DropDownList>
            </div>
        </div>
        <div>
            <div>
                <asp:Label ID="olblMensajeValidacion" runat="server" Text="" Font-Bold="true"
                    ForeColor="Red"></asp:Label>
            </div>
            <asp:SqlDataSource ID="odsLOTEVENTA" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="LOTEVENTATRAERID"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="oddlBARRIOLOTEOperador" Name="idBarrioLote"
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="table-responsive">
                <asp:GridView ID="ogvLOTEVENTA" runat="server" AutoGenerateColumns="False"
                    CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True"
                    PageSize="15" PagerStyle-CssClass="pgr"
                    DataKeyNames="IDLOTEVENTA,IDBARRIOLOTE,LOTEVENTACODIGO,LOTEVENTADESCRIPCION,IDBARRIO,IDVENDEDOR,LOTEVENTAFECHAVISITA,LOTEVENTAFECHACANCELACION,LOTEVENTAADHESIONMONTO,LOTEVENTACUOTAMONTO,CLIENTE01NOMBRE,CLIENTE01DNI,CLIENTE01DOMICILIO,CLIENTE01TELEFONO,CLIENTE02NOMBRE,CLIENTE02DNI,CLIENTE02DOMICILIO,CLIENTE02TELEFONO,IDCLIENTEIVA,CLIENTECUIT,IDLOTEDIMENSION,IDCUOTASCANTIDAD,IDLOTETIPO,LOTEPRECIOBC,CUOTABC"
                    DataSourceID="odsLOTEVENTA"
                    EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                    AllowSorting="True" Font-Size="X-Small">
                    <AlternatingRowStyle CssClass="alt" />
                    <Columns>
                        <asp:CommandField SelectText="Seleccione" ShowSelectButton="True" />
                        <asp:BoundField DataField="IDLOTEVENTA" HeaderText="id" InsertVisible="False"
                            ReadOnly="True" SortExpression="IDLOTEVENTA" />
                        <asp:BoundField DataField="operadorDescripcion" HeaderText="Vendedor"
                            SortExpression="operadorDescripcion" />
                        <asp:BoundField DataField="IDBARRIOLOTE" HeaderText="Lote" InsertVisible="False"
                            ReadOnly="True" SortExpression="IDBARRIOLOTE" Visible="true" />
                        <asp:BoundField DataField="LOTEVENTACODIGO" HeaderText="Codigo"
                            SortExpression="LOTEVENTACODIGO" Visible="False" />
                        <asp:BoundField DataField="LOTEVENTADESCRIPCION" HeaderText="Descripcion"
                            SortExpression="LOTEVENTADESCRIPCION" Visible="False" />
                        <asp:BoundField DataField="IDBARRIO" HeaderText="Barrio" InsertVisible="False"
                            ReadOnly="True" SortExpression="IDBARRIO" Visible="False" />
                        <asp:BoundField DataField="IDVENDEDOR" HeaderText="Vendedor"
                            InsertVisible="False" ReadOnly="True" SortExpression="IDVENDEDOR"
                            Visible="False" />
                        <asp:BoundField DataField="LOTEVENTAFECHAVISITA" DataFormatString="{0:d}"
                            HeaderText="Fecha de Venta" SortExpression="LOTEVENTAFECHAVISITA" />
                        <asp:BoundField DataField="LOTEVENTAFECHACANCELACION" DataFormatString="{0:d}"
                            HeaderText="Fecha de Cancelacion"
                            SortExpression="LOTEVENTAFECHACANCELACION" />
                        <asp:BoundField DataField="LOTEVENTAADHESIONMONTO"
                            HeaderText="Precio Total Adhesion" SortExpression="LOTEVENTAADHESIONMONTO">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="loteVentaCuotaMonto" HeaderText="Monto Cuota"
                            SortExpression="loteVentaCuotaMonto" />
                        <asp:TemplateField HeaderText="Sr / Sra." SortExpression="CLIENTE01NOMBRE">

                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server"
                                    Text='<%# Bind("CLIENTE01NOMBRE") %>' Font-Bold="true"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label8" runat="server"
                                    Text='<%# Bind("CLIENTE02NOMBRE") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="1 - DNI" SortExpression="CLIENTE01DNI">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("CLIENTE01DNI") %>'
                                    Font-Bold="true"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label5" runat="server"
                                    Text='<%# Bind("CLIENTE02DNI") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Domicilio" SortExpression="CLIENTE01DOMICILIO">

                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"
                                    Text='<%# Bind("CLIENTE01DOMICILIO") %>' Font-Bold="true">
                                </asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label3" runat="server"
                                    Text='<%# Bind("CLIENTE02DOMICILIO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Telefono" SortExpression="CLIENTE01TELEFONO">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"
                                    Text='<%# Bind("CLIENTE01TELEFONO") %>' Font-Bold="true">
                                </asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label1" runat="server"
                                    Text='<%# Bind("CLIENTE02TELEFONO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IDCLIENTEIVA" HeaderText="Condicion IVA comprador"
                            InsertVisible="False" ReadOnly="True" SortExpression="IDCLIENTEIVA"
                            Visible="False" />
                        <asp:BoundField DataField="CLIENTECUIT" HeaderText="CUIT Comprador"
                            SortExpression="CLIENTECUIT" />
                        <asp:BoundField DataField="IDLOTEDIMENSION" HeaderText="Dimension"
                            InsertVisible="False" ReadOnly="True" SortExpression="IDLOTEDIMENSION"
                            Visible="False" />
                        <asp:BoundField DataField="IDCUOTASCANTIDAD" HeaderText="Cantidad Cuotas"
                            InsertVisible="False" ReadOnly="True" SortExpression="IDCUOTASCANTIDAD"
                            Visible="False" />
                        <asp:BoundField DataField="IDLOTETIPO" HeaderText="Tipo de Lote"
                            InsertVisible="False" ReadOnly="True" SortExpression="IDLOTETIPO"
                            Visible="False" />
                        <asp:BoundField DataField="cuotasCantidadDescripcion"
                            HeaderText="Cantidad Cuotas" SortExpression="cuotasCantidadDescripcion" />
                        <asp:BoundField DataField="loteTipoDescripcion" HeaderText="Tipo Lote"
                            SortExpression="loteTipoDescripcion" />
                    </Columns>
                    <PagerStyle CssClass="pgr" />
                </asp:GridView>

            </div>
            <asp:Label ID="Label24" runat="server" Text="Filas recuperadas : "></asp:Label>
            <asp:Label ID="olblGrillaColumna" runat="server" Text="" Font-Bold="true" ></asp:Label>
        </div>
        <br />
        <br />


    

    </asp:Panel>

    <asp:Panel ID="PanelAlta" runat="server" Visible="false" CssClass="panel-alta">
        <form class="form" role="form">
            <div>
                <asp:Label ID="olblBarrioManzanaParcelaSeleccionado" runat="server" Text="" Font-Bold="true" Font-Size="Large"></asp:Label>
            </div>
            <div>
                <asp:Label ID="Label10" runat="server" Text="Identificador Lote:"></asp:Label>
                <asp:Label ID="olblIDBarrioLoteOperador" runat="server" Text="xxxx" Visible="True" Font-Bold="true"></asp:Label>
                <asp:Label ID="Label27" runat="server" Text=" - - "></asp:Label>
                <asp:Label ID="Label23" runat="server" Text="Identificador de  Venta (0=Pendiente) :" Visible="True"></asp:Label>
                <asp:Label ID="olblIDLOTEVENTA" runat="server" Text="0" Visible="True" Font-Bold="true"></asp:Label>  
            </div>
            <div>
                <asp:Label ID="Label14" runat="server"
                    Text="Precio Bolsa Cemento Manzana:"></asp:Label>

                <asp:Label ID="otxtbarrioManzanaBCPrecio" runat="server" Text="" Font-Bold="true"
                    CssClass="valor-monto"></asp:Label>
            </div>
            <div>
                <asp:Label ID="Label15" runat="server" Text="Dimension del Lote:"></asp:Label>

                <asp:Label ID="otxtloteDimension" runat="server" Text="" Font-Bold="true"></asp:Label>
            </div>
            <div>
                <asp:Label ID="Label16" runat="server" Text="Superficie del Lote:"></asp:Label>

                <asp:Label ID="otxtLoteSuperficie" runat="server" Text="" Font-Bold="true"></asp:Label>
            </div>
            <div>
                <asp:Label ID="olblLOTEVENTAADHESIONMONTO" runat="server" Text="Precio Total Adhesion:">
                </asp:Label>

                <asp:Label ID="otxtLOTEVENTAADHESIONMONTO" runat="server" Text="" Font-Bold="true"
                    CssClass="valor-monto">
                                   
                </asp:Label>
                <asp:Label ID="olblloteVentaAdhesionMontoALetras" runat="server" Text="" Font-Size="X-Small" Font-Bold="true"></asp:Label>
            </div>
            <div class="form-group">
                <asp:Label ID="olblIDLOTETIPO" runat="server" Text="Tipo de Lote:"></asp:Label>

                <asp:Label ID="otxtLoteTipoDescripcion" runat="server" Text="" Font-Bold="true">
                </asp:Label>
            </div>

            <div class="form-group">
                <asp:Label ID="Label12" runat="server" Text="Precio TOTAL Lote en BC:"></asp:Label>

                <asp:Label ID="OTXTLOTEPRECIOBC" runat="server" Text="" Font-Bold="true"></asp:Label>
            </div>

            <div class="form-group">
                <asp:Label ID="olblIDCUOTASCANTIDAD" runat="server" Text="Cantidad Cuotas:"></asp:Label>
                <asp:Label ID="olblCUOTASCANTIDADDESCRIPCION" runat="server" Text="" Visible ="false" Font-Bold ="true"></asp:Label>
                <asp:SqlDataSource ID="odsCUOTASCANTIDAD" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="CUOTASCANTIDADTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:DropDownList ID="oddlCUOTASCANTIDAD" runat="server"
                    DataSourceID="odsCUOTASCANTIDAD" DataTextField="CUOTASCANTIDADDescripcion"
                    DataValueField="IDCUOTASCANTIDAD" CssClass="form-control" AutoPostBack="True">
                </asp:DropDownList>
            </div>


            <asp:Panel ID="PanelCuotaValor" runat="server" Visible="false">
                <div class="form-group">
                    <asp:Label ID="Label13" runat="server" Text="Cantidad BC mensual: "></asp:Label>


                    <asp:Label ID="OTXTCUOTABC" runat="server" Text="" Font-Bold="true">
                    </asp:Label>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Monto Cuota:"></asp:Label>

                    <asp:Label ID="otxtLOTEVENTACUOTAMONTO" runat="server" Text=""
                        CssClass="valor-monto" Font-Bold ="true"></asp:Label>
                    <asp:Label ID="olblMontoCuotaEnLetras" runat="server" Text="" Font-Size="X-Small" Font-Bold="true"></asp:Label>
                </div>
            </asp:Panel>


            <asp:Panel ID="PanelReserva" runat="server" Visible="false">

                <div>
                    <asp:Button ID="obutReserva" runat="server" Text="Reserva el Lote " BackColor="Green" ForeColor="White" />

                    <asp:Button ID="obutReservaAbandona" runat="server" Text="Retorna a seleccionar Lote " BackColor="Silver" />
                </div>


            </asp:Panel>

            

           

            <asp:Panel ID="PanelReciboAsigna" runat="server" Visible="false">
                <div>
                    <asp:Label ID="Label21" runat="server" Text="Recibo Asignado:"></asp:Label>
                    <asp:SqlDataSource ID="odsreciboOperadorAsignadoPendiente" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="reciboOperadorAsignadoPendiente" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idOperador" SessionField="session_idOperador" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="oddlreciboOperadorAsignadoPendiente" runat="server" DataSourceID="odsreciboOperadorAsignadoPendiente" DataTextField="recibo" DataValueField="idRecibo"></asp:DropDownList>

                </div>

                <div>
                    <asp:Label ID="Label17" runat="server" Text="Cobro de adhesion."></asp:Label>
                </div>
                <div>
                    <div style="float: left;">
                        <asp:Label ID="Label18" runat="server" Text="Monto abona en efectivo:"></asp:Label>
                    </div>
                     
                        <asp:TextBox ID="otxtReciboEfectivoMonto" runat="server" Text="0"></asp:TextBox>
                    
                </div>
               
                <div>
                    <div style="float: left;">
                    <asp:Label ID="Label19" runat="server" Text="Monto abona en transferencia:"></asp:Label>
                        </div>
                   
                    <asp:TextBox ID="otxtReciboTransferenciaMonto" runat="server" Text="0"></asp:TextBox>
                    
                </div>

                <div>
                    <asp:Label ID="Label22" runat="server" Text="Total valores recibidos:" Font-Bold="false"></asp:Label>

                    <asp:Label ID="olblReciboTotalIngresado" runat="server" Text="0" Font-Bold="true"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label20" runat="server" Text="Saldo Adhesion:"></asp:Label>
                    <asp:Label ID="olblAdhesionSaldo" runat="server" Text="" Font-Bold="true"></asp:Label>
                    <asp:TextBox ID="otxtFechaCancelacionProbable" runat="server" Visible="false"></asp:TextBox>
                    <br />
                    <asp:Label ID="olblFechaCancelacionProbable" runat="server" Text="Ingrese fecha de cancelacion posible saldo adhesion:"></asp:Label>
                    <asp:Calendar ID="calFechaCancelacionProbable" runat="server" Visible="false"></asp:Calendar>

                </div>
                <div>
                    <asp:Label ID="olblReciboValidacionMensaje" runat="server" Text="Valida" Font-Bold ="true" ForeColor ="Red"></asp:Label>
                
                
                </div>
             
                <div>
                    <asp:Button ID="obutReciboValidaAlta" runat="server" Text="Valida cobranza" />
                    <asp:Button ID="obutReciboConfirmaAlta" runat="server" Text="Confirma Alta Recibo y bloquea lote" Visible="false" />
                    <asp:Button ID="obutReciboAbandonaAlta" runat="server" Text="Abandona" />
                    <asp:Button ID="obutReciboReingresa" runat="server" Text="Reingresa valores" Visible="false" />


                </div>
            </asp:Panel>
            <asp:Panel ID="PanelBotonera" runat="server">
                    <div class="row">
            <asp:Button ID="obutAlta" runat="server" Text="Nueva adhesion - Primer recibo" Visible="false"  />

            <asp:Button ID="obutCompletaDatosComprador" runat="server" Text="Completa Datos Comprador" Visible="false" />
            <asp:Button ID="obutNuevoReciboAdhesion" runat="server" Text="Nuevo recibo Adhesion" Visible="false"  />
            <asp:Button ID="obutCargarImagenes" runat="server" Text="Subir imagenes documentacion " Visible="false"  />
            <asp:Button ID="obutMenuVolver" runat="server" Text="Volver" Visible="false"  />

        </div>



            </asp:Panel>
            <asp:Panel ID="PanelRecibo" runat="server" Visible="false">
               
                <div class="form-group">
                    <asp:Label ID="olblCLIENTE01NOMBRE" runat="server" Text="1 - Sr / Sra.:"
                        CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="otxtCLIENTE01NOMBRE" runat="server" CssClass="form-control"
                        MaxLength="100"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="olblCLIENTE01DNI" runat="server" Text="1 - DNI:"
                        CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="otxtCLIENTE01DNI" runat="server" CssClass="form-control"
                        MaxLength="20"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="olblCLIENTE01DOMICILIO" runat="server" Text="1 - Domicilio:"
                        CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="otxtCLIENTE01DOMICILIO" runat="server" CssClass="form-control"
                        MaxLength="100"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="olblCLIENTE01TELEFONO" runat="server" Text="1 - Telefono:"
                        CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="otxtCLIENTE01TELEFONO" runat="server" CssClass="form-control"
                        MaxLength="20"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="olblCLIENTE02NOMBRE" runat="server" Text="2 - Sr / Sra:"
                        CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="otxtCLIENTE02NOMBRE" runat="server" CssClass="form-control"
                        MaxLength="100"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="olblCLIENTE02DNI" runat="server" Text="2 - DNI:"
                        CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="otxtCLIENTE02DNI" runat="server" CssClass="form-control"
                        MaxLength="20"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="olblCLIENTE02DOMICILIO" runat="server" Text="2 - Domicilio:"
                        CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="otxtCLIENTE02DOMICILIO" runat="server" CssClass="form-control"
                        MaxLength="100"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="olblCLIENTE02TELEFONO" runat="server" Text="2 - Telefono:"
                        CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="otxtCLIENTE02TELEFONO" runat="server" CssClass="form-control"
                        MaxLength="20"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="olblIDCLIENTEIVA" runat="server" Text="Condicion IVA comprador:"
                        CssClass="control-label"></asp:Label>
                    <asp:SqlDataSource ID="odsCLIENTEIVA" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                        SelectCommand="CLIENTEIVATraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <asp:DropDownList ID="oddlCLIENTEIVA" runat="server" DataSourceID="odsCLIENTEIVA"
                        DataTextField="CLIENTEIVADescripcion" DataValueField="IDCLIENTEIVA"
                        CssClass="form-control">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="olblCLIENTECUIT" runat="server" Text="CUIT Comprador:"
                        CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="otxtCLIENTECUIT" runat="server" CssClass="form-control"
                        MaxLength="13"></asp:TextBox>
                </div>
                <div class="col-sm-offset-2 col-sm-10">

                    <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false">
                    </asp:Label>
                    <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta"
                        CssClass="btn btn-success" />
                    <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta"
                        CssClass="btn btn-danger" />
                </div>


            </asp:Panel>
    </asp:Panel>

    <asp:Panel ID="PanelDocumentacion" runat="server" Visible="false">
        <div>
            <asp:Button ID="obutDocumentacionVolver" runat="server" Text="Volver" />
        </div>
        <div>


            <uc1:loteDocumentacion runat="server" ID="persona1DocumentoAnverso" />
            <uc1:loteDocumentacion runat="server" ID="persona1DocumentoReverso" />
            <uc1:loteDocumentacion runat="server" ID="persona2DocumentoAnverso" />
            <uc1:loteDocumentacion runat="server" ID="persona2DocumentoReverso" />
            <uc1:loteDocumentacion runat="server" ID="consentimientoInformado" />
            <uc1:loteDocumentacion runat="server" ID="recibo1" />
            <uc1:loteDocumentacion runat="server" ID="transferencia1" />
            <uc1:loteDocumentacion runat="server" ID="recibo2" />
            <uc1:loteDocumentacion runat="server" ID="transferencia2" />
            <uc1:loteDocumentacion runat="server" ID="recibo3" />
            <uc1:loteDocumentacion runat="server" ID="transferencia3" />


        </div>



    </asp:Panel>


    <script>
        const insertarValores = document.getElementsByClassName("valor-monto");

        for (let i = 0; i < insertarValores.length; i++) {

            insertarValores[i].textContent = "$" + insertarValores[i].textContent;
        }


    </script>

</asp:Content>
