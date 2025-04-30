<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="BARRIO.aspx.vb"
    Inherits="STRSYSTEM_Administracion_BARRIO" title="Tratamiento Tabla BARRIOS" Culture="es-AR" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
        <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        </asp:Content>
        <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
                EnableScriptLocalization="true"></asp:ScriptManager>


            <asp:Panel ID="PanelTitulo" runat="server">
                <div class="row">
                    <h1>

                        <asp:Label ID="olblBARRIOTitulo" runat="server" Text="BARRIOS"></asp:Label>
                    </h1>
                </div>
            </asp:Panel>

            <asp:Panel ID="Panel1" runat="server">

                <div class="contenedor-busqueda">
                    <!-- <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                        ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
                    </asp:Label> -->
                    <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control">Todo</asp:TextBox>
                    <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-basic btn-primary" />
                </div>
                <div>

                    <asp:SqlDataSource ID="odsBARRIO" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOTRAERCADENAVISTA"
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text"
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="table-responsive">
                        <asp:GridView ID="ogvBARRIO" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                            AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="200"
                            PagerStyle-CssClass="pgr"
                            DataKeyNames="IDBARRIO,BARRIOCODIGO,BARRIODESCRIPCION,BARRIOEXPLICACION,BARRIOPLANO,BARRIOESTADO,IDCBARRIO,IDACTUALIZACIONMODO,BARRIOVENDEDORHABILITADO,IDCENTROCOSTO,BARRIOPORCENTAJECOMISIONADHESION,BARRIOPORCENTAJECOMISIONCUOTA"
                            DataSourceID="odsBARRIO"
                            EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                            AllowSorting="True" Font-Size="Smaller">
                            <AlternatingRowStyle CssClass="alt" />
                            <Columns>
                                <asp:CommandField SelectText="Seleccione" ShowSelectButton="True" />
                                <asp:BoundField DataField="IDBARRIO" HeaderText="ID" InsertVisible="False"
                                    ReadOnly="True" SortExpression="IDBARRIO" visible="False" />
                                <asp:BoundField DataField="BARRIOCODIGO" HeaderText="CODIGO BARRIO"
                                    SortExpression="BARRIOCODIGO" />
                                <asp:BoundField DataField="BARRIODESCRIPCION" HeaderText="DESCRIPCION BARRIO"
                                    SortExpression="BARRIODESCRIPCION" />
                                <asp:BoundField DataField="BARRIOEXPLICACION" HeaderText="EXPLICACION EXTENDIDA"
                                    SortExpression="BARRIOEXPLICACION" />
                                <asp:BoundField DataField="BARRIOPLANO" HeaderText="IMAGEN DEL PLANO GENERAL DEL BARRIO"
                                    SortExpression="BARRIOPLANO" />
                                <asp:TemplateField HeaderText="ESTADO" SortExpression="BARRIOESTADO">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="BARRIOESTADOBox" runat="server"
                                            Checked='<% # Bind("BARRIOESTADO") %>' Enabled="false" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="IDCBARRIO" HeaderText="BARRIO CONTENEDOR"
                                    InsertVisible="False" ReadOnly="True" SortExpression="IDCBARRIO" visible="False" />
                                <asp:BoundField DataField="IDACTUALIZACIONMODO" HeaderText="MODO DE ACTUALIZACION"
                                    InsertVisible="False" ReadOnly="True" SortExpression="IDACTUALIZACIONMODO"
                                    visible="False" />
                                <asp:TemplateField HeaderText="HABILITADO PARA LA VENTA"
                                    SortExpression="BARRIOVENDEDORHABILITADO">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="BARRIOVENDEDORHABILITADOBox" runat="server"
                                            Checked='<% # Bind("BARRIOVENDEDORHABILITADO") %>' Enabled="false" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="IDCENTROCOSTO" HeaderText="CENTRO COSTO ASIGNADO"
                                    InsertVisible="False" ReadOnly="True" SortExpression="IDCENTROCOSTO"
                                    visible="False" />
                                <asp:BoundField DataField="BARRIOPORCENTAJECOMISIONADHESION"
                                    HeaderText="COMISION POR ADHESION"
                                    SortExpression="BARRIOPORCENTAJECOMISIONADHESION">
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BARRIOPORCENTAJECOMISIONCUOTA"
                                    HeaderText="COMISION POR COBRANZA DE CUOTA"
                                    SortExpression="BARRIOPORCENTAJECOMISIONCUOTA">
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="centroCostoDescripcion" HeaderText="Centro Costo"
                                    SortExpression="centroCostoDescripcion" />
                            </Columns>
                            <PagerStyle CssClass="pgr" />
                        </asp:GridView>

                    </div>
                </div>
                <br />


                <div class="text-center">
                    <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro"
                        CssClass="btn btn-success btn-basic" />
                </div>

            </asp:Panel>


            <asp:Panel ID="PanelAlta" runat="server" Visible="false">
                <form class="form" role="form">

                    <div class="form-group">
                        <asp:Label ID="olblIDBARRIO" runat="server" Text="" Visible="false"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOCODIGO" runat="server" Text="CODIGO BARRIO:" CssClass="control-label">
                        </asp:Label>
                        <asp:TextBox ID="otxtBARRIOCODIGO" runat="server" CssClass="form-control" MaxLength="50">
                        </asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIODESCRIPCION" runat="server" Text="DESCRIPCION BARRIO:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtBARRIODESCRIPCION" runat="server" CssClass="form-control" MaxLength="250">
                        </asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOEXPLICACION" runat="server" Text="EXPLICACION EXTENDIDA:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtBARRIOEXPLICACION" runat="server" CssClass="form-control"
                            TextMode="MultiLine" height="500px"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOPLANO" runat="server" Text="IMAGEN DEL PLANO GENERAL DEL BARRIO:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtBARRIOPLANO" runat="server" CssClass="form-control" MaxLength="200">
                        </asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOESTADO" runat="server" Text="ESTADO:" CssClass="control-label">
                        </asp:Label>
                        <asp:CheckBox ID="otxtBARRIOESTADO" runat="server" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDCBARRIO" runat="server" Text="BARRIO CONTENEDOR:" CssClass="control-label">
                        </asp:Label>
                        <asp:SqlDataSource ID="odsCBARRIO" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="CBARRIOTraerOddl"
                            SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:DropDownList ID="oddlCBARRIO" runat="server" DataSourceID="odsCBARRIO"
                            DataTextField="CBARRIODescripcion" DataValueField="IDCBARRIO" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDACTUALIZACIONMODO" runat="server" Text="MODO DE ACTUALIZACION:"
                            CssClass="control-label"></asp:Label>
                        <asp:SqlDataSource ID="odsACTUALIZACIONMODO" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="ACTUALIZACIONMODOTraerOddl" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="oddlACTUALIZACIONMODO" runat="server" DataSourceID="odsACTUALIZACIONMODO"
                            DataTextField="ACTUALIZACIONMODODescripcion" DataValueField="IDACTUALIZACIONMODO"
                            CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOVENDEDORHABILITADO" runat="server" Text="HABILITADO PARA LA VENTA:"
                            CssClass="control-label"></asp:Label>
                        <asp:CheckBox ID="otxtBARRIOVENDEDORHABILITADO" runat="server" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDCENTROCOSTO" runat="server" Text="CENTRO COSTO ASIGNADO:"
                            CssClass="control-label"></asp:Label>
                        <asp:SqlDataSource ID="odsCENTROCOSTO" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="CENTROCOSTOTraerOddl"
                            SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:DropDownList ID="oddlCENTROCOSTO" runat="server" DataSourceID="odsCENTROCOSTO"
                            DataTextField="CENTROCOSTODescripcion" DataValueField="IDCENTROCOSTO"
                            CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOPORCENTAJECOMISIONADHESION" runat="server"
                            Text="COMISION POR ADHESION:" CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtBARRIOPORCENTAJECOMISIONADHESION" runat="server" CssClass="form-control"
                            MaxLength="12"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblBARRIOPORCENTAJECOMISIONCUOTA" runat="server"
                            Text="COMISION POR COBRANZA DE CUOTA:" CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtBARRIOPORCENTAJECOMISIONCUOTA" runat="server" CssClass="form-control"
                            MaxLength="12"></asp:TextBox>
                    </div>

                    <div class="col-sm-offset-2 col-sm-10">

                        <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta"
                            CssClass="btn btn-success" />
                        <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta"
                            CssClass="btn btn-danger" />
                    </div>
                </form>




            </asp:Panel>


        </asp:Content>