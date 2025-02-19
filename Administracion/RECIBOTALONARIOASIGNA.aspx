<%@ Page Title="ASIGNACION DE RECIBOS A OPERADORES" MaintainScrollPositionOnPostback="true" Language="VB"
    MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="RECIBOTALONARIOASIGNA.aspx.vb"
    Inherits="Administracion_RECIBOTALONARIOASIGNA" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

        <div>
            <h1 class="titulo-rol">
                <asp:Label ID="olblTitulo" runat="server" Text="ASIGNACIÓN DE RECIBOS" Font-Bold="true"></asp:Label>
            </h1>
        </div>

        <div>
            <asp:Label ID="Label1" runat="server" Text="Proximo talonarios pendientes de asignacion"
                CssClass="subtitulo-rol">
            </asp:Label>

        </div>
        <asp:Panel ID="PanelTalonario" runat="server">
            <div>
                <asp:SqlDataSource ID="odsreciboTalonarioAsignar" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="[reciboTalonarioAsignar]"
                    SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:GridView ID="ogvreciboTalonarioAsignar" runat="server" AutoGenerateColumns="False"
                    CssClass="table-cemmi" DataKeyNames="id" DataSourceID="odsreciboTalonarioAsignar" Font-Size="Small">
                    <Columns>
                        <asp:CommandField SelectText="Seleccionar talonario" ShowSelectButton="True" />
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id"
                            Visible="False" />
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                        <asp:BoundField DataField="PuntoVenta" HeaderText="PuntoVenta" SortExpression="PuntoVenta">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Letra" HeaderText="Letra" SortExpression="Letra">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Desde" HeaderText="Desde" SortExpression="Desde">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Hasta" HeaderText="Hasta" SortExpression="Hasta">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaHabilitacion" HeaderText="FechaHabilitacion"
                            SortExpression="FechaHabilitacion">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Habilitados" HeaderText="Habilitados" SortExpression="Habilitados">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Asignados" HeaderText="Asignados" SortExpression="Asignados">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>

            </div>

            <div>
                <asp:Label ID="Label3" runat="server" Text="Ultimos recibos asignados" CssClass="subtitulo-rol">
                </asp:Label>
            </div>
            <div>
                <asp:SqlDataSource ID="odsreciboTraerultimoAsignado" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="reciboTraerultimoAsignado"
                    SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:GridView ID="ogvreciboTraerultimoAsignado" runat="server" AutoGenerateColumns="False"
                    CssClass="table-cemmi" DataKeyNames="idRecibo" DataSourceID="odsreciboTraerultimoAsignado"
                    Font-Size="Small">
                    <Columns>
                        <asp:BoundField DataField="idRecibo" HeaderText="idRecibo" InsertVisible="False" ReadOnly="True"
                            SortExpression="idRecibo" Visible="False" />
                        <asp:BoundField DataField="recibo" HeaderText="recibo" ReadOnly="True"
                            SortExpression="recibo" />
                        <asp:BoundField DataField="reciboOperadorAsignado" HeaderText="reciboOperadorAsignado"
                            SortExpression="reciboOperadorAsignado" Visible="False" />
                        <asp:BoundField DataField="operadorAsignadoCodigo" HeaderText="operadorAsignadoCodigo"
                            SortExpression="operadorAsignadoCodigo" Visible="False" />
                        <asp:BoundField DataField="operadorAsignadoDescripcion" HeaderText="Operador Asignado"
                            SortExpression="operadorAsignadoDescripcion" />
                        <asp:BoundField DataField="reciboFechaAsignacion" HeaderText="Fecha Asignacion"
                            SortExpression="reciboFechaAsignacion" />
                        <asp:BoundField DataField="reciboOperadorAsigna" HeaderText="reciboOperadorAsigna"
                            SortExpression="reciboOperadorAsigna" Visible="False" />
                        <asp:BoundField DataField="operadorAsignadorCodigo" HeaderText="operadorAsignadorCodigo"
                            SortExpression="operadorAsignadorCodigo" Visible="False" />
                        <asp:BoundField DataField="operadorAsiognadorDescripcion" HeaderText="Operador que asignó"
                            SortExpression="operadorAsiognadorDescripcion" />
                    </Columns>
                </asp:GridView>
            </div>

        </asp:Panel>
        <asp:Panel ID="PanelOperadorReciboAsigna" runat="server" Visible="false">
            <div>
                <asp:Label ID="olblIdReciboTalonario" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Seleccione Operador"></asp:Label>

            </div>
            <div>
                <asp:SqlDataSource ID="odsOperador" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="OPERADORTRAERVENDEDOR" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:DropDownList ID="oddlOperador" runat="server" AutoPostBack="True" DataSourceID="odsOperador"
                    DataTextField="operadorDescripcion" DataValueField="idOperador"></asp:DropDownList>
            </div>

            <div>
                <asp:SqlDataSource ID="odsreciboTraerTalonario" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="reciboTraerTalonario"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ogvreciboTalonarioAsignar" Name="idReciboTalonario"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvreciboTraerTalonario" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="idRecibo" DataSourceID="odsreciboTraerTalonario" CssClass="table-cemmi" Width="50%"
                    AllowPaging="True" PageSize="15">
                    <Columns>
                        <asp:TemplateField HeaderText="idRecibo" InsertVisible="False" SortExpression="idRecibo"
                            Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="otxtIdRecibo" runat="server" Text='<%# Eval("idRecibo") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="olblIdRecibo" runat="server" Text='<%# Bind("idRecibo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="recibo" HeaderText="Número Recibo" ReadOnly="True"
                            SortExpression="recibo" />
                        <asp:TemplateField HeaderText="Asignar a Operador" SortExpression="asignar">

                            <ItemTemplate>
                                <asp:CheckBox ID="ochkAsigna" runat="server" Checked='<%# Bind("asignar") %>' />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div>
                    <asp:Label ID="olblMensajeAsignacion" runat="server" Text="" Font-Bold="true" ForeColor="Red">
                    </asp:Label>
                </div>

                <div>
                    <asp:Button ID="obutReciboTalonarioAsignaOperador" runat="server"
                        Text="Asignar los recibos Seleccionados" CssClass="btn-success " />
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="PanelReciboTalonarioAsignado" runat="server" Visible="false">
            <div>
                <asp:Label ID="olblIdReciboAsignacionCabecera" runat="server" Text=""></asp:Label>

            </div>


            <div>
                <asp:Label ID="olblMensaje" runat="server" Text=""></asp:Label>

            </div>
            <div>
                <asp:Label ID="olblValidacionMensajeError" runat="server" Text=""></asp:Label>

            </div>

            <div>
                <asp:Button ID="obutReciboAsignacionVolver" runat="server" Text="Volver" CssClass="btn-success"
                    Enabled="true" />

            </div>





        </asp:Panel>



    </asp:Content>