<%@ Page Language="VB" MasterPageFile="~/master/p.master" MaintainScrollPositionOnPostback="true"
    AutoEventWireup="false" CodeFile="PLANCUENTAGESTION.aspx.vb" Inherits="STRSYSTEM_Administracion_PLANCUENTAGESTION"
    title="Tratamiento Tabla MANTENIMIENTO DEL PLAN DE CUENTAS" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
        <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        </asp:Content>
        <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
                EnableScriptLocalization="true"></asp:ScriptManager>


            <asp:Panel ID="PanelTitulo" runat="server">
                <div class="row">
                    <h1 class="titulo-rol">
                        <asp:Label ID="olblPLANCUENTATitulo" runat="server" Text="MANTENIMIENTO DEL PLAN DE CUENTAS">
                        </asp:Label>
                    </h1>
                </div>
            </asp:Panel>

            <asp:Panel ID="Panel1" runat="server" CssClass="mantenimiento-plan-cuentas">

                <div class="row">

                    <div class="contenedor-busqueda">
                        <asp:Label ID="Label1" runat="server" Text="SELECCIONE PLAN CUENTARUBRO: "
                            CssClass="control-label mx-2"></asp:Label>
                        <asp:SqlDataSource ID="odsPLANCUENTARUBROOperador" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="PLANCUENTARUBROOPERADORSELECCIONA" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="oddlPLANCUENTARUBROOperador" runat="server"
                            DataSourceID="odsPLANCUENTARUBROOPERADOR" DataTextField="PLANCUENTARUBRODescripcion"
                            DataValueField="idPLANCUENTARUBRO" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                </div>
                <div>

                    <asp:SqlDataSource ID="odsPLANCUENTA" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="PLANCUENTATRAERIDGESTION"
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="oddlPLANCUENTARUBROOperador" Name="idPLANCUENTARUBRO"
                                PropertyName="SelectedValue" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="table-responsive">
                        <asp:GridView ID="ogvPLANCUENTA" runat="server" AutoGenerateColumns="False"
                            CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="150"
                            PagerStyle-CssClass="pgr"
                            DataKeyNames="IDPLANCUENTA,IDPLANCUENTARUBRO,PLANCUENTACODIGO,PLANCUENTADESCRIPCION,PLANCUENTAIMPUTABLE,IDPLANCUENTAGRUPO,IDPLANCUENTAACUMULA,PLANCUENTAESTADO"
                            DataSourceID="odsPLANCUENTA"
                            EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                            AllowSorting="True">
                            <AlternatingRowStyle CssClass="alt" />
                            <Columns>
                                <asp:CommandField SelectText="Seleccione" ShowSelectButton="True" />
                                <asp:BoundField DataField="IDPLANCUENTA" HeaderText="ID" InsertVisible="False"
                                    ReadOnly="True" SortExpression="IDPLANCUENTA" visible="False" />
                                <asp:BoundField DataField="rubro" HeaderText="Rubro" SortExpression="rubro" />
                                <asp:BoundField DataField="IDPLANCUENTARUBRO" HeaderText="RUBRO" InsertVisible="False"
                                    ReadOnly="True" SortExpression="IDPLANCUENTARUBRO" visible="False" />
                                <asp:BoundField DataField="PLANCUENTACODIGO" HeaderText="CODIGO CUENTA"
                                    SortExpression="PLANCUENTACODIGO" />
                                <asp:BoundField DataField="PLANCUENTADESCRIPCION" HeaderText="DESCRIPCION CUENTA"
                                    SortExpression="PLANCUENTADESCRIPCION" />
                                <asp:TemplateField HeaderText="ES IMPUTABLE ?" SortExpression="PLANCUENTAIMPUTABLE">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="PLANCUENTAIMPUTABLEBox" runat="server"
                                            Checked='<% # Bind("PLANCUENTAIMPUTABLE") %>' Enabled="false" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="IDPLANCUENTAGRUPO" HeaderText="GRUPO DE CUENTAS"
                                    InsertVisible="False" ReadOnly="True" SortExpression="IDPLANCUENTAGRUPO"
                                    visible="False" />
                                <asp:BoundField DataField="IDPLANCUENTAACUMULA" HeaderText="CUENTA DE ACUMULACION"
                                    InsertVisible="False" ReadOnly="True" SortExpression="IDPLANCUENTAACUMULA"
                                    visible="False" />
                                <asp:TemplateField HeaderText="ESTADO" SortExpression="PLANCUENTAESTADO">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="PLANCUENTAESTADOBox" runat="server"
                                            Checked='<% # Bind("PLANCUENTAESTADO") %>' Enabled="false" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="acumulaCodigo" HeaderText="CODIGO ACUMULA"
                                    SortExpression="acumulaCodigo" />
                                <asp:BoundField DataField="acumulaDescripcion" HeaderText="ACUMULA DESCRIPCION"
                                    SortExpression="acumulaDescripcion" />
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
                        <asp:Label ID="olblIDPLANCUENTA" runat="server" Text="" Visible="false"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDPLANCUENTARUBRO" runat="server" Text="RUBRO:" CssClass="control-label">
                        </asp:Label>
                        <asp:SqlDataSource ID="odsPLANCUENTARUBRO" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="PLANCUENTARUBROTraerOddl" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="oddlPLANCUENTARUBRO" runat="server" DataSourceID="odsPLANCUENTARUBRO"
                            DataTextField="PLANCUENTARUBRODescripcion" DataValueField="IDPLANCUENTARUBRO"
                            CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblPLANCUENTACODIGO" runat="server" Text="CODIGO CUENTA:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtPLANCUENTACODIGO" runat="server" CssClass="form-control" MaxLength="20">
                        </asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblPLANCUENTADESCRIPCION" runat="server" Text="DESCRIPCION CUENTA:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtPLANCUENTADESCRIPCION" runat="server" CssClass="form-control"
                            MaxLength="100"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblPLANCUENTAIMPUTABLE" runat="server" Text="ES IMPUTABLE ?:"
                            CssClass="control-label"></asp:Label>
                        <asp:CheckBox ID="otxtPLANCUENTAIMPUTABLE" runat="server" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDPLANCUENTAGRUPO" runat="server" Text="GRUPO DE CUENTAS:"
                            CssClass="control-label"></asp:Label>
                        <asp:SqlDataSource ID="odsPLANCUENTAGRUPO" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="PLANCUENTAGRUPOTraerOddl" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="oddlPLANCUENTAGRUPO" runat="server" DataSourceID="odsPLANCUENTAGRUPO"
                            DataTextField="PLANCUENTAGRUPODescripcion" DataValueField="IDPLANCUENTAGRUPO"
                            CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblIDPLANCUENTAACUMULA" runat="server" Text="CUENTA DE ACUMULACION:"
                            CssClass="control-label"></asp:Label>
                        <asp:SqlDataSource ID="odsPLANCUENTAACUMULA" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="PLANCUENTAACUMULATraerOddl" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="oddlPLANCUENTAACUMULA" runat="server" DataSourceID="odsPLANCUENTAACUMULA"
                            DataTextField="PLANCUENTAACUMULADescripcion" DataValueField="IDPLANCUENTAACUMULA"
                            CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblPLANCUENTAESTADO" runat="server" Text="ESTADO:" CssClass="control-label">
                        </asp:Label>
                        <asp:CheckBox ID="otxtPLANCUENTAESTADO" runat="server" />
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