<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false"
    CodeFile="EMPRESAOPERADORGESTION.aspx.vb" Inherits="STRSYSTEM_Administracion_EMPRESAOPERADORGESTION"
    title="Tratamiento Tabla OPERADORES POR EMPRESA" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
        <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        </asp:Content>
        <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
                EnableScriptLocalization="true"></asp:ScriptManager>


            <asp:Panel ID="PanelTitulo" runat="server">
                <h1 class="titulo-rol">
                    <asp:Label ID="olblEMPRESAOPERADORTitulo" runat="server" Text="OPERADORES POR EMPRESA">
                    </asp:Label>
                </h1>
            </asp:Panel>

            <asp:Panel ID="Panel1" runat="server" CssClass="operadores-por-empresa">

                <div class="row">

                    <div class="contenedor-busqueda">
                        <asp:Label ID="Label1" runat="server" Text="SELECCIONE OPERADOR:" CssClass="control-label">
                        </asp:Label>
                        <asp:SqlDataSource ID="odsOPERADOROperador" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="OPERADOROPERADORSELECCIONA" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="oddlOPERADOROperador" runat="server" DataSourceID="odsOPERADOROPERADOR"
                            DataTextField="OPERADORDescripcion" DataValueField="idOPERADOR" CssClass="select"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                </div>
                <div>

                    <asp:SqlDataSource ID="odsEMPRESAOPERADOR" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                        SelectCommand="EMPRESAOPERADORTRAERIDGESTION" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="oddlOPERADOROperador" Name="idOPERADOR"
                                PropertyName="SelectedValue" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="table-responsive">
                        <asp:GridView ID="ogvEMPRESAOPERADOR" runat="server" AutoGenerateColumns="False"
                            CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15"
                            PagerStyle-CssClass="pgr"
                            DataKeyNames="IDEMPRESAOPERADOR,IDOPERADOR,IDEMPRESA,IDEMPRESASUCURSAL,IDEMPRESASECTOR,EMPRESAOPERADORESTADO"
                            DataSourceID="odsEMPRESAOPERADOR"
                            EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                            AllowSorting="True">
                            <AlternatingRowStyle CssClass="alt" />
                            <Columns>
                                <asp:CommandField SelectText="Seleccione" ShowSelectButton="True" />
                                <asp:BoundField DataField="IDEMPRESAOPERADOR" HeaderText="id" InsertVisible="False"
                                    ReadOnly="True" SortExpression="IDEMPRESAOPERADOR" visible="False" />
                                <asp:BoundField DataField="IDOPERADOR" HeaderText="OPERADOR" InsertVisible="False"
                                    ReadOnly="True" SortExpression="IDOPERADOR" visible="False" />
                                <asp:BoundField DataField="IDEMPRESA" HeaderText="EMPRESA" InsertVisible="False"
                                    ReadOnly="True" SortExpression="IDEMPRESA" visible="False" />
                                <asp:BoundField DataField="IDEMPRESASUCURSAL" HeaderText="SUCURSAL"
                                    InsertVisible="False" ReadOnly="True" SortExpression="IDEMPRESASUCURSAL"
                                    visible="False" />
                                <asp:BoundField DataField="IDEMPRESASECTOR" HeaderText="SECTOR" InsertVisible="False"
                                    ReadOnly="True" SortExpression="IDEMPRESASECTOR" visible="False" />
                                <asp:TemplateField HeaderText="ESTADO" SortExpression="EMPRESAOPERADORESTADO">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="EMPRESAOPERADORESTADOBox" runat="server"
                                            Checked='<% # Bind("EMPRESAOPERADORESTADO") %>' Enabled="false" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="empresaDescripcion" HeaderText="EMPRESA"
                                    SortExpression="empresaDescripcion" />
                                <asp:BoundField DataField="empresaSucursalDescripcion" HeaderText="SUCURSAL"
                                    SortExpression="empresaSucursalDescripcion" />
                                <asp:BoundField DataField="empresaSectorDescripcion" HeaderText="SECTOR"
                                    SortExpression="empresaSectorDescripcion" />
                            </Columns>
                            <PagerStyle CssClass="pgr" />
                        </asp:GridView>

                    </div>
                </div>
                <br />
                <br />


                <div class="row">
                    <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro"
                        CssClass="btn-basic btn btn-success" />

                </div>

            </asp:Panel>


            <asp:Panel ID="PanelAlta" runat="server" Visible="false">
                <form class="form" role="form">

                    <div class="form-group">
                        <asp:Label ID="olblIDEMPRESAOPERADOR" runat="server" Text="" Visible="false"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDOPERADOR" runat="server" Text="OPERADOR:" CssClass="control-label">
                        </asp:Label>
                        <asp:SqlDataSource ID="odsOPERADOR" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="OPERADORTraerOddl"
                            SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:DropDownList ID="oddlOPERADOR" runat="server" DataSourceID="odsOPERADOR"
                            DataTextField="OPERADORDescripcion" DataValueField="IDOPERADOR" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDEMPRESA" runat="server" Text="EMPRESA:" CssClass="control-label">
                        </asp:Label>
                        <asp:SqlDataSource ID="odsEMPRESA" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESATraerOddl"
                            SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:DropDownList ID="oddlEMPRESA" runat="server" DataSourceID="odsEMPRESA"
                            DataTextField="EMPRESADescripcion" DataValueField="IDEMPRESA" CssClass="form-control"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDEMPRESASUCURSAL" runat="server" Text="SUCURSAL:" CssClass="control-label">
                        </asp:Label>
                        <asp:SqlDataSource ID="odsEMPRESASUCURSAL" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESASUCURSALTRAERID"
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="oddlEMPRESA" Name="idEmpresa"
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="oddlEMPRESASUCURSAL" runat="server" DataSourceID="odsEMPRESASUCURSAL"
                            DataTextField="EMPRESASUCURSALDescripcion" DataValueField="IDEMPRESASUCURSAL"
                            CssClass="form-control" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDEMPRESASECTOR" runat="server" Text="SECTOR:" CssClass="control-label">
                        </asp:Label>
                        <asp:SqlDataSource ID="odsEMPRESASECTOR" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESASECTORTRAERID"
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="oddlEMPRESA" Name="idEmpresa"
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="oddlEMPRESASECTOR" runat="server" DataSourceID="odsEMPRESASECTOR"
                            DataTextField="EMPRESASECTORDescripcion" DataValueField="IDEMPRESASECTOR"
                            CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblEMPRESAOPERADORESTADO" runat="server" Text="ESTADO:"
                            CssClass="control-label"></asp:Label>
                        <asp:CheckBox ID="otxtEMPRESAOPERADORESTADO" runat="server" />
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