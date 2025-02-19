<%@ Page Language="VB" MasterPageFile="~/master/p.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="false" CodeFile="loteVentaBarriosVendedor.aspx.vb" Inherits="STRSYSTEM_Administracion_LOTEVENTABARRIOSVENDEDOR" Title="Tratamiento de venta de lotes por barrio y por vendedor" Culture="es-AR" %>
<%@ Register Src="~/ventaWEB/loteDocumentacion.ascx" TagPrefix="uc1" TagName="loteDocumentacion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>


    <asp:Panel ID="PanelTitulo" runat="server">
        <div class="row">
            <h1>

                <asp:Label ID="olblLOTEVENTATitulo" runat="server" Text=""></asp:Label>
            </h1>
        </div>
    </asp:Panel>
    <div>
        <asp:Label ID="olblOperadorAdministrador" runat="server" Text=""></asp:Label>
        <asp:Label ID="olblIdOperador" runat="server" Text=""></asp:Label>


    </div>
    <div>
        <asp:Label ID="olblSeleccionaBarrio" runat="server" Text="Seleccione Barrio"></asp:Label>
        <asp:SqlDataSource ID="odsBarrioHabilitadoSelecciona" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOTraerODDL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:DropDownList ID="oddlBarrioHabilitadoSelecciona" runat="server" AutoPostBack="True" DataSourceID="odsBarrioHabilitadoSelecciona" DataTextField="barrioDescripcion" DataValueField="idBarrio" Width="100%"></asp:DropDownList>
    </div>

    <div>
        <asp:Label ID="olblSeleccionaManzana" runat="server" Text="Seleccione Manzana"></asp:Label>
        <asp:SqlDataSource ID="odsBarrioHabilitadoManzanaSelecciona" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioHabilitadoManzanaSelecciona" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona" Name="idBarrio" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="oddlBarrioHabilitadoManzanaSelecciona" runat="server" AutoPostBack="True" DataSourceID="odsBarrioHabilitadoManzanaSelecciona" DataTextField="barrioManzanaDescripcion" DataValueField="idBarrioManzana" Width="100%"></asp:DropDownList>
    </div>
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="olblIDBarrioLoteOperador" runat="server" Text="xxxx"></asp:Label>
        <div class="row">

            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="SELECCIONE  LOTE:" CssClass="control-label"></asp:Label>
                <asp:Label ID="Label11" runat="server" Text=" -   (Todos los lotes)"></asp:Label>
                <asp:CheckBox ID="ochTodos" runat="server" Checked="false"  AutoPostBack="true" />
                <asp:SqlDataSource ID="odsBARRIOLOTEOperador" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="BARRIOMANZANALOTEOPERADORSELECCIONA" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                        <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona" PropertyName="SelectedValue" Name="idBarrio" Type="Int32"></asp:ControlParameter>
                        <asp:ControlParameter ControlID="oddlBarrioHabilitadoManzanaSelecciona" PropertyName="SelectedValue" Name="idBarrioManzana" Type="Int32"></asp:ControlParameter>
                        <asp:ControlParameter ControlID="ochTodos" PropertyName="Checked" Name="todos" Type="Int32"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="oddlBARRIOLOTEOperador" runat="server" DataSourceID="odsBARRIOLOTEOPERADOR"
                    DataTextField="BARRIOLOTEDescripcion" DataValueField="idBARRIOLOTE" CssClass="form-control" AutoPostBack="True">
                </asp:DropDownList>
            </div>
        </div>
        <div>
            <div>
                <asp:Label ID="olblMensajeValidacion" runat="server" Text="" Font-Bold ="true" ForeColor ="Red"></asp:Label>
            </div>
            <asp:SqlDataSource ID="odsLOTEVENTA" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                SelectCommand="LOTEVENTATRAERID" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="oddlBARRIOLOTEOperador" Name="idBarrioLote" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="table-responsive">
                <asp:GridView ID="ogvLOTEVENTA" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"
                    DataKeyNames="IDLOTEVENTA,IDBARRIOLOTE,LOTEVENTACODIGO,LOTEVENTADESCRIPCION,IDBARRIO,IDVENDEDOR,LOTEVENTAFECHAVISITA,LOTEVENTAFECHACANCELACION,LOTEVENTAADHESIONMONTO,LOTEVENTACUOTAMONTO,CLIENTE01NOMBRE,CLIENTE01DNI,CLIENTE01DOMICILIO,CLIENTE01TELEFONO,CLIENTE02NOMBRE,CLIENTE02DNI,CLIENTE02DOMICILIO,CLIENTE02TELEFONO,IDCLIENTEIVA,CLIENTECUIT,IDLOTEDIMENSION,IDCUOTASCANTIDAD,IDLOTETIPO,LOTEPRECIOBC,CUOTABC"
                    DataSourceID="odsLOTEVENTA"
                    EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                    AllowSorting="True" Font-Size="X-Small">
                    <AlternatingRowStyle CssClass="alt" />
                    <Columns>
                        <asp:CommandField SelectText="Seleccione" ShowSelectButton="True" />
                        <asp:BoundField DataField="IDLOTEVENTA" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="IDLOTEVENTA" />
                        <asp:BoundField DataField="operadorDescripcion" HeaderText="Vendedor" SortExpression="operadorDescripcion" />
                        <asp:BoundField DataField="IDBARRIOLOTE" HeaderText="Lote" InsertVisible="False" ReadOnly="True" SortExpression="IDBARRIOLOTE" Visible="true" />
                        <asp:BoundField DataField="LOTEVENTACODIGO" HeaderText="Codigo" SortExpression="LOTEVENTACODIGO" Visible="False" />
                        <asp:BoundField DataField="LOTEVENTADESCRIPCION" HeaderText="Descripcion" SortExpression="LOTEVENTADESCRIPCION" Visible="False" />
                        <asp:BoundField DataField="IDBARRIO" HeaderText="Barrio" InsertVisible="False" ReadOnly="True" SortExpression="IDBARRIO" Visible="False" />
                        <asp:BoundField DataField="IDVENDEDOR" HeaderText="Vendedor" InsertVisible="False" ReadOnly="True" SortExpression="IDVENDEDOR" Visible="False" />
                        <asp:BoundField DataField="LOTEVENTAFECHAVISITA" DataFormatString="{0:d}" HeaderText="Fecha de Venta" SortExpression="LOTEVENTAFECHAVISITA" />
                        <asp:BoundField DataField="LOTEVENTAFECHACANCELACION" DataFormatString="{0:d}" HeaderText="Fecha de Cancelacion" SortExpression="LOTEVENTAFECHACANCELACION" />
                        <asp:BoundField DataField="LOTEVENTAADHESIONMONTO" HeaderText="Precio Total Adhesion" SortExpression="LOTEVENTAADHESIONMONTO">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="loteVentaCuotaMonto" HeaderText="Monto Cuota" SortExpression="loteVentaCuotaMonto" />
                        <asp:TemplateField HeaderText="Sr / Sra." SortExpression="CLIENTE01NOMBRE">

                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("CLIENTE01NOMBRE") %>' Font-Bold="true"></asp:Label>
                                <br />  <br />
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("CLIENTE02NOMBRE") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="1 - DNI" SortExpression="CLIENTE01DNI">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("CLIENTE01DNI") %>' Font-Bold ="true"></asp:Label>
                                <br />  <br />
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("CLIENTE02DNI") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Domicilio" SortExpression="CLIENTE01DOMICILIO">

                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("CLIENTE01DOMICILIO") %>' Font-Bold="true"></asp:Label>
                                <br />  <br />
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("CLIENTE02DOMICILIO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Telefono" SortExpression="CLIENTE01TELEFONO">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("CLIENTE01TELEFONO") %>' Font-Bold="true"></asp:Label>
                                <br />  <br />
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CLIENTE02TELEFONO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IDCLIENTEIVA" HeaderText="Condicion IVA comprador" InsertVisible="False" ReadOnly="True" SortExpression="IDCLIENTEIVA" Visible="False" />
                        <asp:BoundField DataField="CLIENTECUIT" HeaderText="CUIT Comprador" SortExpression="CLIENTECUIT" />
                        <asp:BoundField DataField="IDLOTEDIMENSION" HeaderText="Dimension" InsertVisible="False" ReadOnly="True" SortExpression="IDLOTEDIMENSION" Visible="False" />
                        <asp:BoundField DataField="IDCUOTASCANTIDAD" HeaderText="Cantidad Cuotas" InsertVisible="False" ReadOnly="True" SortExpression="IDCUOTASCANTIDAD" Visible="False" />
                        <asp:BoundField DataField="IDLOTETIPO" HeaderText="Tipo de Lote" InsertVisible="False" ReadOnly="True" SortExpression="IDLOTETIPO" Visible="False" />
                        <asp:BoundField DataField="loteDimensionDescripcion" HeaderText="Dimension" SortExpression="loteDimensionDescripcion" />
                        <asp:BoundField DataField="cuotasCantidadDescripcion" HeaderText="Cantidad Cuotas" SortExpression="cuotasCantidadDescripcion" />
                        <asp:BoundField DataField="loteTipoDescripcion" HeaderText="Tipo Lote" SortExpression="loteTipoDescripcion" />
                    </Columns>
                    <PagerStyle CssClass="pgr" />
                </asp:GridView>

            </div>
        </div>
        <br />
        <br />


        <div class="row">
            <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro" CssClass="btn btn-success" />

        </div>

    </asp:Panel>


    <asp:Panel ID="PanelAlta" runat="server" Visible="false">
        <form class="form" role="form">

            <div class="form-group">
                <asp:Label ID="olblIDLOTEVENTA" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <div class="form-group">
                <asp:Label ID="olblIDBARRIOLOTE" runat="server" Text="Lote:" CssClass="control-label"></asp:Label>
                <asp:SqlDataSource ID="odsBARRIOLOTE" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="[BARRIOLOTEIdTraeroddl]" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idBarrioLote" SessionField="idBarrioLote" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="oddlBARRIOLOTE" runat="server" DataSourceID="odsBARRIOLOTE"
                    DataTextField="BARRIOLOTEDescripcion" DataValueField="IDBARRIOLOTE" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="olblLOTEVENTACODIGO" runat="server" Text="Codigo:" CssClass="control-label" Visible ="false"></asp:Label>
                <asp:TextBox ID="otxtLOTEVENTACODIGO" runat="server" CssClass="form-control" MaxLength="10" Visible ="false" ></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblLOTEVENTADESCRIPCION" runat="server" Text="Descripcion:" CssClass="control-label"  Visible ="false"></asp:Label>
                <asp:TextBox ID="otxtLOTEVENTADESCRIPCION" runat="server" CssClass="form-control" MaxLength="50"  Visible ="false"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblIDBARRIO" runat="server" Text="Barrio:" CssClass="control-label"></asp:Label>
                <asp:SqlDataSource ID="odsBARRIO" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="BARRIOTraerODDL" SelectCommandType="StoredProcedure">
                    
                </asp:SqlDataSource>
                <asp:DropDownList ID="oddlBARRIO" runat="server" DataSourceID="odsBARRIO"
                    DataTextField="BARRIODescripcion" DataValueField="IDBARRIO" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="olblIDVENDEDOR" runat="server" Text="Vendedor:" CssClass="control-label"></asp:Label>
                <asp:SqlDataSource ID="odsVENDEDOR" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="vendedorIDTraerOddl" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idVendedor" SessionField="idOperador" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="oddlVENDEDOR" runat="server" DataSourceID="odsVENDEDOR"
                    DataTextField="VENDEDORDescripcion" DataValueField="IDVENDEDOR" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="form-group">
          <asp:Label ID="olblLOTEVENTAFECHAVISITA" runat="server" Text="Fecha de Venta:  ingresar DD/MM/AAAA" CssClass="control-label"></asp:Label>
           <asp:TextBox ID="otxtLOTEVENTAFECHAVISITA" CssClass="" runat="server"></asp:TextBox>

<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
     </div>


            <div class="form-group">
          <asp:Label ID="Label10" runat="server" Text="Fecha de Cancelacion :  ingresar DD/MM/AAAA" CssClass="control-label"></asp:Label>
           <asp:TextBox ID="otxtLOTEVENTAFECHACANCELACION" CssClass="" runat="server"></asp:TextBox>

<asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
     </div>
            <div class="form-group">
                <asp:Label ID="olblLOTEVENTAADHESIONMONTO" runat="server" Text="Precio Total Adhesion:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="otxtLOTEVENTAADHESIONMONTO" runat="server" CssClass="form-control" MaxLength="12"></asp:TextBox>
            </div>

            
              <div class="form-group">
                <asp:Label ID="Label9" runat="server" Text="Monto Cuota:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="otxtLOTEVENTACUOTAMONTO" runat="server" CssClass="form-control" MaxLength="12"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblCLIENTE01NOMBRE" runat="server" Text="1 - Sr / Sra.:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="otxtCLIENTE01NOMBRE" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblCLIENTE01DNI" runat="server" Text="1 - DNI:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="otxtCLIENTE01DNI" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblCLIENTE01DOMICILIO" runat="server" Text="1 - Domicilio:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="otxtCLIENTE01DOMICILIO" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblCLIENTE01TELEFONO" runat="server" Text="1 - Telefono:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="otxtCLIENTE01TELEFONO" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblCLIENTE02NOMBRE" runat="server" Text="2 - Sr / Sra:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="otxtCLIENTE02NOMBRE" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblCLIENTE02DNI" runat="server" Text="2 - DNI:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="otxtCLIENTE02DNI" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblCLIENTE02DOMICILIO" runat="server" Text="2 - Domicilio:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="otxtCLIENTE02DOMICILIO" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblCLIENTE02TELEFONO" runat="server" Text="2 - Telefono:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="otxtCLIENTE02TELEFONO" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblIDCLIENTEIVA" runat="server" Text="Condicion IVA comprador:" CssClass="control-label"></asp:Label>
                <asp:SqlDataSource ID="odsCLIENTEIVA" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="CLIENTEIVATraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:DropDownList ID="oddlCLIENTEIVA" runat="server" DataSourceID="odsCLIENTEIVA"
                    DataTextField="CLIENTEIVADescripcion" DataValueField="IDCLIENTEIVA" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="olblCLIENTECUIT" runat="server" Text="CUIT Comprador:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="otxtCLIENTECUIT" runat="server" CssClass="form-control" MaxLength="13"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="olblIDLOTEDIMENSION" runat="server" Text="Dimension:" CssClass="control-label"></asp:Label>
                <asp:SqlDataSource ID="odsLOTEDIMENSION" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="LOTEDIMENSIONTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:DropDownList ID="oddlLOTEDIMENSION" runat="server" DataSourceID="odsLOTEDIMENSION"
                    DataTextField="LOTEDIMENSIONDescripcion" DataValueField="IDLOTEDIMENSION" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="olblIDCUOTASCANTIDAD" runat="server" Text="Cantidad Cuotas:" CssClass="control-label"></asp:Label>
                <asp:SqlDataSource ID="odsCUOTASCANTIDAD" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="CUOTASCANTIDADTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:DropDownList ID="oddlCUOTASCANTIDAD" runat="server" DataSourceID="odsCUOTASCANTIDAD"
                    DataTextField="CUOTASCANTIDADDescripcion" DataValueField="IDCUOTASCANTIDAD" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="olblIDLOTETIPO" runat="server" Text="Tipo de Lote:" CssClass="control-label"></asp:Label>
                <asp:SqlDataSource ID="odsLOTETIPO" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="LOTETIPOTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:DropDownList ID="oddlLOTETIPO" runat="server" DataSourceID="odsLOTETIPO"
                    DataTextField="LOTETIPODescripcion" DataValueField="IDLOTETIPO" CssClass="form-control">
                </asp:DropDownList>
            </div>
             <div class="form-group">
                <asp:Label ID="Label12" runat="server" Text="Precio TOTAL Lote en BC:" CssClass="control-label"></asp:Label>
                <asp:TextBox ID="OTXTLOTEPRECIOBC" runat="server" CssClass="form-control" MaxLength="12"></asp:TextBox>
            </div>

             <div class="form-group">
                <asp:Label ID="Label13" runat="server" Text="Monto Cuota Mensual en BC: " CssClass="control-label"></asp:Label>
                <asp:TextBox ID="OTXTCUOTABC" runat="server" CssClass="form-control" MaxLength="12"></asp:TextBox>
            </div>
            <div class="col-sm-offset-2 col-sm-10">

                <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                <br />
                <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta" CssClass="btn btn-success" />
                <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta" CssClass="btn btn-danger" />
                <asp:Button ID="obutDocumentacion" runat="server" Text="Carga de Documentación" CssClass="btn btn-warning " Visible="false" />
                <asp:Button ID="obutReciboCajaFirmado" runat="server" Text="Carga de Recibo firmado en caja" CssClass="btn btn-warning " Visible ="false" />
           
            </div>
        </form>




    </asp:Panel>

    <asp:Panel ID="PanelDocumentacion" runat="server" Visible ="false">
        <div>
            <br />
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
     <asp:Panel ID="PanelReciboCaja" runat="server" Visible ="false">
        <div>
            <asp:Button ID="obutReciboCajaVolver" runat="server" Text="Volver" />
        </div>
          <div>
       

    <uc1:loteDocumentacion runat="server" ID="reciboDuplicadoCaja01" />
    <uc1:loteDocumentacion runat="server" ID="reciboDuplicadoCaja02" />
    <uc1:loteDocumentacion runat="server" ID="reciboDuplicadoCaja03" />
    <uc1:loteDocumentacion runat="server" ID="reciboDuplicadoCaja04" />
    

    </div>



    </asp:Panel>

</asp:Content>


