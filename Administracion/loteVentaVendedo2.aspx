<%@ Page Language="VB" MasterPageFile="~/master/p.master" MaintainScrollPositionOnPostback="true"
    AutoEventWireup="false" CodeFile="loteVentaVendedo2.aspx.vb" Inherits="STRSYSTEM_Administracion_LOTEVENTAVENDEDOR2"
    Title="Tratamiento de venta de lotes por vendedor" Culture="es-AR" %>
    <%@ Register Src="~/ventaWEB/loteDocumentacion.ascx" TagPrefix="uc1" TagName="loteDocumentacion" %>

        <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
            <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
            </asp:Content>
            <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

                <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
                    EnableScriptLocalization="true"></asp:ScriptManager>


                <asp:Panel ID="PanelTitulo" runat="server">
                    <!-- <h1 class="titulo-rol">
                        <asp:Label ID="olblLOTEVENTATitulo" runat="server"
                            Text="VENDEDOR GESTIONA LOTES TODOS LOS BARRIOS"></asp:Label>
                    </h1> -->
                    <h1 class="titulo-rol">
                        VENDEDOR GESTIONA LOTES TODOS LOS BARRIOS
                    </h1>
                </asp:Panel>
                <div>
                    <asp:Label ID="olblOperadorAdministrador" runat="server" Text=""></asp:Label>
                    <asp:Label ID="olblIdOperador" runat="server" Text=""></asp:Label>
                </div>
                <div class="vendedor-gestiona-lotes-todos-los-barrios" id="select-todos-los-barrios">
                    <div class="flexible">
                        <div class="form-group">
                            <asp:Label ID="olblSeleccionaBarrio" runat="server" Text="Seleccione Barrio:"
                                CssClass="d-block text-center">
                            </asp:Label>
                            <asp:SqlDataSource ID="odsBarrioHabilitadoSelecciona" runat="server"
                                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOTraerODDL"
                                SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            <asp:DropDownList ID="oddlBarrioHabilitadoSelecciona" runat="server" AutoPostBack="True"
                                DataSourceID="odsBarrioHabilitadoSelecciona" DataTextField="barrioDescripcion"
                                DataValueField="idBarrio" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="olblSeleccionaManzana" runat="server" Text="Seleccione Manzana:"
                                CssClass="d-block text-center">
                            </asp:Label>
                            <asp:SqlDataSource ID="odsBarrioHabilitadoManzanaSelecciona" runat="server"
                                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                                SelectCommand="barrioHabilitadoManzanaSelecciona" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona" Name="idBarrio"
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DropDownList ID="oddlBarrioHabilitadoManzanaSelecciona" runat="server"
                                AutoPostBack="True" DataSourceID="odsBarrioHabilitadoManzanaSelecciona"
                                DataTextField="barrioManzanaDescripcion" DataValueField="idBarrioManzana"
                                CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>

                </div>
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Label ID="olblIDBarrioLoteOperador" runat="server" Text="----" CssClass="d-block text-center">
                    </asp:Label>
                    <div class="row">

                        <div class="vendedor-gestiona-lotes-todos-los-barrios contenedor-busqueda align-items-center">
                            <asp:Label ID="Label1" runat="server" Text="SELECCIONE LOTE:" CssClass="select">
                            </asp:Label>
                            <asp:SqlDataSource ID="odsBARRIOLOTEOperador" runat="server"
                                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                                SelectCommand="BARRIOMANZANALOTEOPERADORSELECCIONA" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                                    <asp:ControlParameter ControlID="oddlBarrioHabilitadoSelecciona"
                                        PropertyName="SelectedValue" Name="idBarrio" Type="Int32">
                                    </asp:ControlParameter>
                                    <asp:ControlParameter ControlID="oddlBarrioHabilitadoManzanaSelecciona"
                                        PropertyName="SelectedValue" Name="idBarrioManzana" Type="Int32">
                                    </asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ochTodos" PropertyName="Checked" Name="todos"
                                        Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <asp:DropDownList ID="oddlBARRIOLOTEOperador" runat="server"
                                DataSourceID="odsBARRIOLOTEOPERADOR" DataTextField="BARRIOLOTEDescripcion"
                                DataValueField="idBARRIOLOTE" CssClass="input" AutoPostBack="True">
                            </asp:DropDownList>
                            <div class="d-flex align-items-center justify-content-center">
                                <asp:CheckBox ID="ochTodos" runat="server" Checked="false" AutoPostBack="true" />
                                <asp:Label ID="Label11" runat="server" Text="Todos los lotes" CssClass="mx-2">
                                </asp:Label>
                            </div>

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
                        <div class="table-responsive vendedor-gestiona-lotes-todos-los-barrios">
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
                                    <asp:BoundField DataField="IDVENDEDOR" HeaderText="Vendedor" InsertVisible="False"
                                        ReadOnly="True" SortExpression="IDVENDEDOR" Visible="False" />
                                    <asp:BoundField DataField="LOTEVENTAFECHAVISITA" DataFormatString="{0:d}"
                                        HeaderText="Fecha de Venta" SortExpression="LOTEVENTAFECHAVISITA" />
                                    <asp:BoundField DataField="LOTEVENTAFECHACANCELACION" DataFormatString="{0:d}"
                                        HeaderText="Fecha de Cancelacion" SortExpression="LOTEVENTAFECHACANCELACION" />
                                    <asp:BoundField DataField="LOTEVENTAADHESIONMONTO"
                                        HeaderText="Precio Total Adhesion" SortExpression="LOTEVENTAADHESIONMONTO">
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="loteVentaCuotaMonto" HeaderText="Monto Cuota"
                                        SortExpression="loteVentaCuotaMonto" />
                                    <asp:TemplateField HeaderText="Sr / Sra." SortExpression="CLIENTE01NOMBRE">

                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("CLIENTE01NOMBRE") %>'
                                                Font-Bold="true"></asp:Label>
                                            <br /> <br />
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("CLIENTE02NOMBRE") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="1 - DNI" SortExpression="CLIENTE01DNI">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("CLIENTE01DNI") %>'
                                                Font-Bold="true"></asp:Label>
                                            <br /> <br />
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("CLIENTE02DNI") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Domicilio" SortExpression="CLIENTE01DOMICILIO">

                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server"
                                                Text='<%# Bind("CLIENTE01DOMICILIO") %>' Font-Bold="true">
                                            </asp:Label>
                                            <br /> <br />
                                            <asp:Label ID="Label3" runat="server"
                                                Text='<%# Bind("CLIENTE02DOMICILIO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Telefono" SortExpression="CLIENTE01TELEFONO">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server"
                                                Text='<%# Bind("CLIENTE01TELEFONO") %>' Font-Bold="true">
                                            </asp:Label>
                                            <br /> <br />
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
                                    <asp:BoundField DataField="loteDimensionDescripcion" HeaderText="Dimension"
                                        SortExpression="loteDimensionDescripcion" />
                                    <asp:BoundField DataField="cuotasCantidadDescripcion" HeaderText="Cantidad Cuotas"
                                        SortExpression="cuotasCantidadDescripcion" />
                                    <asp:BoundField DataField="loteTipoDescripcion" HeaderText="Tipo Lote"
                                        SortExpression="loteTipoDescripcion" />
                                </Columns>
                                <PagerStyle CssClass="pgr" />
                            </asp:GridView>

                        </div>
                    </div>

                    <div class="row mt-4">
                        <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro"
                            CssClass="btn btn-basic btn-success" />

                    </div>

                </asp:Panel>


                <asp:Panel ID="PanelAlta" runat="server" Visible="false"
                    CssClass="vendedor-gestiona-lotes-todos-los-barrios separar">
                    <form class="form" role="form">

                        <div class="form-group">
                            <asp:Label ID="olblIDLOTEVENTA" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                        <div class="flexible">

                            <div class="form-group">
                                <asp:Label ID="olblIDBARRIOLOTE" runat="server" Text="Lote:" CssClass="control-label">
                                </asp:Label>
                                <asp:SqlDataSource ID="odsBARRIOLOTE" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                                    SelectCommand="[BARRIOLOTEIdTraeroddl]" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idBarrioLote" SessionField="idBarrioLote"
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DropDownList ID="oddlBARRIOLOTE" runat="server" DataSourceID="odsBARRIOLOTE"
                                    DataTextField="BARRIOLOTEDescripcion" DataValueField="IDBARRIOLOTE"
                                    CssClass="form-control text-center" disabled>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="olblLOTEVENTACODIGO" runat="server" Text="Codigo:"
                                    CssClass="control-label" Visible="false"></asp:Label>
                                <asp:TextBox ID="otxtLOTEVENTACODIGO" runat="server" CssClass="form-control"
                                    MaxLength="10" Visible="false"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="olblLOTEVENTADESCRIPCION" runat="server" Text="Descripcion:"
                                    CssClass="control-label" Visible="false"></asp:Label>
                                <asp:TextBox ID="otxtLOTEVENTADESCRIPCION" runat="server" CssClass="form-control"
                                    MaxLength="50" Visible="false"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="olblIDBARRIO" runat="server" Text="Barrio:" CssClass="control-label">
                                </asp:Label>
                                <asp:SqlDataSource ID="odsBARRIO" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                                    SelectCommand="BARRIOTraerODDL" SelectCommandType="StoredProcedure">

                                </asp:SqlDataSource>
                                <asp:DropDownList ID="oddlBARRIO" runat="server" DataSourceID="odsBARRIO"
                                    DataTextField="BARRIODescripcion" DataValueField="IDBARRIO"
                                    CssClass="form-control text-center">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group mt-4 text-center">
                            <asp:Label ID="olblIDVENDEDOR" runat="server" Text="Vendedor:" CssClass="control-label">
                            </asp:Label>
                            <asp:SqlDataSource ID="odsVENDEDOR" runat="server"
                                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                                SelectCommand="vendedorIDTraerOddl" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="idVendedor" SessionField="idOperador" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DropDownList ID="oddlVENDEDOR" runat="server" DataSourceID="odsVENDEDOR"
                                DataTextField="VENDEDORDescripcion" DataValueField="IDVENDEDOR"
                                CssClass="form-control mx-auto text-center" disabled>
                            </asp:DropDownList>
                        </div>
                        <div class="calendarios">
                            <div class="form-group calendario">
                                <asp:Label ID="olblLOTEVENTAFECHAVISITA" runat="server"
                                    Text="Fecha de Venta : Seleccionar DD/MM/AAAA" CssClass="control-label">
                                </asp:Label>
                                <asp:TextBox ID="otxtLOTEVENTAFECHAVISITA" CssClass="fecha-resaltada" runat="server"
                                    placeholder="Fecha de venta">
                                </asp:TextBox>

                                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                            </div>


                            <div class="form-group calendario">
                                <asp:Label ID="Label10" runat="server"
                                    Text="Fecha de Cancelación : Seleccionar DD/MM/AAAA" CssClass="control-label">
                                </asp:Label>
                                <asp:TextBox ID="otxtLOTEVENTAFECHACANCELACION" CssClass="fecha-resaltada"
                                    runat="server" placeholder="Fecha de cancelación">
                                </asp:TextBox>

                                <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
                            </div>
                        </div>


                        <div class="datos-venta">
                            <div>

                                <div class="form-group">
                                    <asp:Label ID="olblLOTEVENTAADHESIONMONTO" runat="server"
                                        Text="Precio Total Adhesión:" CssClass="control-label"></asp:Label>
                                    <asp:TextBox ID="otxtLOTEVENTAADHESIONMONTO" runat="server" CssClass="form-control"
                                        MaxLength="12" placeholder="Precio total de la venta"></asp:TextBox>
                                </div>


                                <div class="form-group">
                                    <asp:Label ID="Label9" runat="server" Text="Monto Cuota:" CssClass="control-label">
                                    </asp:Label>
                                    <asp:TextBox ID="otxtLOTEVENTACUOTAMONTO" runat="server" CssClass="form-control"
                                        MaxLength="12" placeholder="Monto de la cuota"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="olblCLIENTE01NOMBRE" runat="server" Text="1 - Sr / Sra.:"
                                        CssClass="control-label">
                                    </asp:Label>
                                    <asp:TextBox ID="otxtCLIENTE01NOMBRE" runat="server"
                                        CssClass="form-control texto-mayusculas"
                                        placeholder="Nombre y apellido del cliente" MaxLength="100">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="olblCLIENTE01DNI" runat="server" Text="1 - DNI:"
                                        CssClass="control-label">
                                    </asp:Label>
                                    <asp:TextBox ID="otxtCLIENTE01DNI" runat="server" CssClass="form-control"
                                        MaxLength="20" placeholder="Número de documento del cliente">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="olblCLIENTE01DOMICILIO" runat="server" Text="1 - Domicilio:"
                                        CssClass="control-label"></asp:Label>
                                    <asp:TextBox ID="otxtCLIENTE01DOMICILIO" runat="server" CssClass="form-control"
                                        MaxLength="100" placeholder="Domicilio del cliente"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="olblCLIENTE01TELEFONO" runat="server" Text="1 - Teléfono:"
                                        CssClass="control-label"></asp:Label>
                                    <asp:TextBox ID="otxtCLIENTE01TELEFONO" runat="server" CssClass="form-control"
                                        MaxLength="20" placeholder="Teléfono del cliente"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="olblCLIENTE02NOMBRE" runat="server" Text="2 - Sr / Sra:"
                                        CssClass="control-label"></asp:Label>
                                    <asp:TextBox ID="otxtCLIENTE02NOMBRE" runat="server"
                                        CssClass="form-control texto-mayusculas" MaxLength="100"
                                        placeholder="Nombre y apellido (Segundo cliente - Opcional)">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="olblCLIENTE02DNI" runat="server" Text="2 - DNI:"
                                        CssClass="control-label">
                                    </asp:Label>
                                    <asp:TextBox ID="otxtCLIENTE02DNI" runat="server" CssClass="form-control"
                                        MaxLength="20" placeholder="Número de documento (Segundo cliente)">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="olblCLIENTE02DOMICILIO" runat="server" Text="2 - Domicilio:"
                                        CssClass="control-label"></asp:Label>
                                    <asp:TextBox ID="otxtCLIENTE02DOMICILIO" runat="server"
                                        CssClass="form-control texto-mayusculas" MaxLength="100"
                                        placeholder="Domicilio (Segundo cliente)"></asp:TextBox>
                                </div>
                            </div>

                            <div>


                                <div class="form-group">
                                    <asp:Label ID="olblCLIENTE02TELEFONO" runat="server" Text="2 - Teléfono:"
                                        CssClass="control-label"></asp:Label>
                                    <asp:TextBox ID="otxtCLIENTE02TELEFONO" runat="server" CssClass="form-control"
                                        MaxLength="20" placeholder="Teléfono (Segundo cliente)"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="olblIDCLIENTEIVA" runat="server" Text="Condición IVA comprador:"
                                        CssClass="control-label"></asp:Label>
                                    <asp:SqlDataSource ID="odsCLIENTEIVA" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                                        SelectCommand="CLIENTEIVATraerOddl" SelectCommandType="StoredProcedure">
                                    </asp:SqlDataSource>
                                    <asp:DropDownList ID="oddlCLIENTEIVA" runat="server" DataSourceID="odsCLIENTEIVA"
                                        DataTextField="CLIENTEIVADescripcion" DataValueField="IDCLIENTEIVA"
                                        CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="olblCLIENTECUIT" runat="server" Text="CUIT Comprador:"
                                        CssClass="control-label"></asp:Label>
                                    <asp:TextBox ID="otxtCLIENTECUIT" runat="server" CssClass="form-control"
                                        MaxLength="13" placeholder="Ejemplo: 99-99999999-9">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="olblIDLOTEDIMENSION" runat="server" Text="Dimensión:"
                                        CssClass="control-label"></asp:Label>
                                    <asp:SqlDataSource ID="odsLOTEDIMENSION" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                                        SelectCommand="LOTEDIMENSIONTraerOddl" SelectCommandType="StoredProcedure">
                                    </asp:SqlDataSource>
                                    <asp:DropDownList ID="oddlLOTEDIMENSION" runat="server"
                                        DataSourceID="odsLOTEDIMENSION" DataTextField="LOTEDIMENSIONDescripcion"
                                        DataValueField="IDLOTEDIMENSION" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="olblIDCUOTASCANTIDAD" runat="server" Text="Cantidad Cuotas:"
                                        CssClass="control-label"></asp:Label>
                                    <asp:SqlDataSource ID="odsCUOTASCANTIDAD" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                                        SelectCommand="CUOTASCANTIDADTraerOddl" SelectCommandType="StoredProcedure">
                                    </asp:SqlDataSource>
                                    <asp:DropDownList ID="oddlCUOTASCANTIDAD" runat="server"
                                        DataSourceID="odsCUOTASCANTIDAD" DataTextField="CUOTASCANTIDADDescripcion"
                                        DataValueField="IDCUOTASCANTIDAD" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="olblIDLOTETIPO" runat="server" Text="Tipo de Lote:"
                                        CssClass="control-label">
                                    </asp:Label>
                                    <asp:SqlDataSource ID="odsLOTETIPO" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                                        SelectCommand="LOTETIPOTraerOddl" SelectCommandType="StoredProcedure">
                                    </asp:SqlDataSource>
                                    <asp:DropDownList ID="oddlLOTETIPO" runat="server" DataSourceID="odsLOTETIPO"
                                        DataTextField="LOTETIPODescripcion" DataValueField="IDLOTETIPO"
                                        CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label12" runat="server" Text="Precio TOTAL Lote en BC:"
                                        CssClass="control-label"></asp:Label>
                                    <asp:TextBox ID="OTXTLOTEPRECIOBC" runat="server" CssClass="form-control"
                                        MaxLength="12" placeholder="Precio total del lote (en bolsas de cemento)">
                                    </asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label13" runat="server" Text="Monto Cuota Mensual en BC: "
                                        CssClass="control-label"></asp:Label>
                                    <asp:TextBox ID="OTXTCUOTABC" runat="server" CssClass="form-control" MaxLength="12"
                                        placeholder="Cuota mensual (en bolsas de cemento)">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="mt-3 botones-confirmacion">
                            <div>
                                <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false">
                                </asp:Label>
                                <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                            </div>

                            <div>
                                <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirmar Alta"
                                    CssClass="btn btn-success" />
                                <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandonar Alta"
                                    CssClass="btn btn-danger" />
                            </div>
                        </div>

                    </form>




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
                    document.addEventListener("DOMContentLoaded", () => {
                        const selectManzanas = document.querySelectorAll("#select-todos-los-barrios select")[1];
                        const optionsManzanas = selectManzanas.querySelectorAll("option");
                        console.log(selectManzanas);
                        selectManzanas.required = true;

                        for (let i = 0; i < optionsManzanas.length; i++) {
                            if (optionsManzanas[i].textContent.includes("Manzana no seleccionada")) {
                                optionsManzanas[i].textContent = "" + optionsManzanas[i].textContent;
                            } else if (!optionsManzanas[i].textContent.includes(" 0 Libres")) {
                                // optionsManzanas[i].style.backgroundColor = "#198754";
                                optionsManzanas[i].style.color = "#198754";
                                optionsManzanas[i].textContent = "✅ " + optionsManzanas[i].textContent;
                                // optionsManzanas[i].style.color = "white";

                            } else {
                                // optionsManzanas[i].style.backgroundColor = "#dc3545";
                                optionsManzanas[i].style.color = "#dc3545";
                                optionsManzanas[i].textContent = "🚫 " + optionsManzanas[i].textContent;
                                // optionsManzanas[i].style.color = "white";
                            }
                        }

                        const convertirTexto = document.getElementsByClassName("texto-mayusculas");
                        const uno = document.getElementById("ContentPlaceHolder1_otxtCLIENTE01NOMBRE");

                        console.log(uno);

                        const calendario = document.querySelectorAll(".calendario table");
                        console.log(calendario)

                        for (let i = 0; i < calendario.length; i++) {

                            const columnas = calendario[i].querySelectorAll("td");
                            for (let i = 0; i < columnas.length; i++) {

                                if (columnas[i].style.backgroundColor === "silver") {
                                    columnas[i].style.backgroundColor = "#0b5ed7";
                                }

                            }
                        }






                        // Convertir a mayúsculas el texto de estos inputs
                        for (let i = 0; i < convertirTexto.length; i++) {
                            convertirTexto[i].addEventListener("input", () => {
                                convertirTexto.value = convertirTexto.value.toUpperCase();
                            })

                        }

                    })
                </script>

            </asp:Content>