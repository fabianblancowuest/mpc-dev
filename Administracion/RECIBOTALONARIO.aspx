<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="RECIBOTALONARIO.aspx.vb"
    Inherits="STRSYSTEM_Administracion_RECIBOTALONARIO" title="Tratamiento Tabla ALTA DE TALONARIOS DE RECIBOS" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
        <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        </asp:Content>
        <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
                EnableScriptLocalization="true"></asp:ScriptManager>


            <asp:Panel ID="PanelTitulo" runat="server">
                <div class="row">
                    <h1 class="titulo-rol">
                        <asp:Label ID="olblRECIBOTALONARIOTitulo" runat="server" Text="ALTA DE TALONARIOS DE RECIBOS">
                        </asp:Label>
                    </h1>
                </div>
            </asp:Panel>

            <asp:Panel ID="Panel1" runat="server">

                <div class="row contenedor-flexible margenes-y">
                    <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                        ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
                    </asp:Label>
                    <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control">Todo</asp:TextBox>
                    <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn-basic btn btn-primary" />
                </div>
                <div>

                    <asp:SqlDataSource ID="odsRECIBOTALONARIO" runat="server"
                        ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="RECIBOTALONARIOTRAERCADENA"
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text"
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="table-responsive">
                        <asp:GridView ID="ogvRECIBOTALONARIO" runat="server" AutoGenerateColumns="False"
                            CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="300"
                            PagerStyle-CssClass="pgr"
                            DataKeyNames="IDRECIBOTALONARIO,RECIBOTALONARIOCODIGO,RECIBOTALONARIODESCRIPCION,FECHASOLICITUD,FECHARECEPCION,RECIBOTALONARIONUMEROPUNTOVENTA,RECIBOTALONARIOLETRA,RECIBOTALONARIONUMERODESDE,RECIBOTALONARIONUMEROHASTA,RECIBOTALONARIOEXPLICACION,RECIBOTALONARIOESTADO"
                            DataSourceID="odsRECIBOTALONARIO"
                            EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                            AllowSorting="True" Font-Size="XX-Small">
                            <AlternatingRowStyle CssClass="alt" />
                            <Columns>
                                <asp:CommandField SelectText="Seleccione" ShowSelectButton="True" />
                                <asp:BoundField DataField="IDRECIBOTALONARIO" HeaderText="ID" InsertVisible="False"
                                    ReadOnly="True" SortExpression="IDRECIBOTALONARIO" visible="False" />
                                <asp:BoundField DataField="RECIBOTALONARIOCODIGO" HeaderText="CODIGO TALONARIO"
                                    SortExpression="RECIBOTALONARIOCODIGO" />
                                <asp:BoundField DataField="RECIBOTALONARIODESCRIPCION"
                                    HeaderText="DESCRIPCION TALONARIO" SortExpression="RECIBOTALONARIODESCRIPCION" />
                                <asp:BoundField DataField="FECHASOLICITUD" DataFormatString="{0:d}"
                                    HeaderText="FECHA SOLICITUD" SortExpression="FECHASOLICITUD">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FECHARECEPCION" DataFormatString="{0:d}"
                                    HeaderText="FECHA RECEPCION" SortExpression="FECHARECEPCION">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RECIBOTALONARIONUMEROPUNTOVENTA" HeaderText="PUNTO DE VENTA"
                                    SortExpression="RECIBOTALONARIONUMEROPUNTOVENTA">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RECIBOTALONARIOLETRA" HeaderText="LETRA TALONARIO"
                                    SortExpression="RECIBOTALONARIOLETRA">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RECIBOTALONARIONUMERODESDE" HeaderText="NUMERACION DESDE"
                                    SortExpression="RECIBOTALONARIONUMERODESDE">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RECIBOTALONARIONUMEROHASTA" HeaderText="NUMERACION HASTA"
                                    SortExpression="RECIBOTALONARIONUMEROHASTA">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RECIBOTALONARIOEXPLICACION" HeaderText="EXPLICACION"
                                    SortExpression="RECIBOTALONARIOEXPLICACION" />
                                <asp:TemplateField HeaderText="ESTADO" SortExpression="RECIBOTALONARIOESTADO">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="RECIBOTALONARIOESTADOBox" runat="server"
                                            Checked='<% # Bind("RECIBOTALONARIOESTADO") %>' Enabled="false" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
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
                        <asp:Label ID="olblIDRECIBOTALONARIO" runat="server" Text="" Visible="false"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblRECIBOTALONARIOCODIGO" runat="server" Text="CODIGO TALONARIO:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtRECIBOTALONARIOCODIGO" runat="server" CssClass="form-control"
                            MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblRECIBOTALONARIODESCRIPCION" runat="server" Text="DESCRIPCION TALONARIO:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtRECIBOTALONARIODESCRIPCION" runat="server" CssClass="form-control"
                            MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblFECHASOLICITUD" runat="server" Text="FECHA SOLICITUD:"
                            CssClass="control-label"></asp:Label>
                        <asp:CalendarExtender ID="oceFECHASOLICITUD" runat="server" TargetControlID="otxtFECHASOLICITUD"
                            Format="dd/MM/yyyy" PopupPosition="BottomRight" PopupButtonID="obutFECHASOLICITUDPopup">
                        </asp:CalendarExtender>
                        <asp:TextBox ID="otxtFECHASOLICITUD" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:Button ID="obutFECHASOLICITUDPopup" runat="server" CssClass="obut-ocal-popup-button" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblFECHARECEPCION" runat="server" Text="FECHA RECEPCION:"
                            CssClass="control-label"></asp:Label>
                        <asp:CalendarExtender ID="oceFECHARECEPCION" runat="server" TargetControlID="otxtFECHARECEPCION"
                            Format="dd/MM/yyyy" PopupPosition="BottomRight" PopupButtonID="obutFECHARECEPCIONPopup">
                        </asp:CalendarExtender>
                        <asp:TextBox ID="otxtFECHARECEPCION" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:Button ID="obutFECHARECEPCIONPopup" runat="server" CssClass="obut-ocal-popup-button" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblRECIBOTALONARIONUMEROPUNTOVENTA" runat="server" Text="PUNTO DE VENTA:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtRECIBOTALONARIONUMEROPUNTOVENTA" runat="server" CssClass="form-control"
                            MaxLength="4"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblRECIBOTALONARIOLETRA" runat="server" Text="LETRA TALONARIO:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtRECIBOTALONARIOLETRA" runat="server" CssClass="form-control" MaxLength="1">
                        </asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblRECIBOTALONARIONUMERODESDE" runat="server" Text="NUMERACION DESDE:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtRECIBOTALONARIONUMERODESDE" runat="server" CssClass="form-control"
                            MaxLength="4"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblRECIBOTALONARIONUMEROHASTA" runat="server" Text="NUMERACION HASTA:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtRECIBOTALONARIONUMEROHASTA" runat="server" CssClass="form-control"
                            MaxLength="4"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblRECIBOTALONARIOEXPLICACION" runat="server" Text="EXPLICACION:"
                            CssClass="control-label"></asp:Label>
                        <asp:TextBox ID="otxtRECIBOTALONARIOEXPLICACION" runat="server" CssClass="form-control"
                            MaxLength="250"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="olblRECIBOTALONARIOESTADO" runat="server" Text="ESTADO:"
                            CssClass="control-label"></asp:Label>
                        <asp:CheckBox ID="otxtRECIBOTALONARIOESTADO" runat="server" />
                    </div>

                    <div class="col-sm-offset-2 col-sm-10">

                        <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta"
                            CssClass="btn-basic btn btn-success" />
                        <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta"
                            CssClass="btn-basic btn btn-danger" />
                    </div>
                </form>




            </asp:Panel>


        </asp:Content>