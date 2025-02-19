<%@ Page Title="HABILITACION DE TALONARIOS" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false"
    CodeFile="RECIBOTALONARIOHABILITA.aspx.vb" Inherits="Administracion_RECIBOTALONARIOHABILITA" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
            <h1 class="titulo-rol">
                <asp:Label ID="olblTitulo" runat="server" Text="HABILITACIÓN DE TALONARIOS">
                </asp:Label>
            </h1>

        </div>
        <asp:Panel ID="Panel1" runat="server">
            <div>
                <asp:Label ID="Label1" runat="server" Text="Existencia de Talonarios sin habilitar "
                    CssClass="subtitulo-rol">
                </asp:Label>

            </div>
            <div>

                <asp:SqlDataSource ID="odsTALONARIOESTADO" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="reciboTalonarioNoHabilitadoTrae" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <asp:GridView ID="ogvTALONARIOESTADO" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                    DataKeyNames="id" DataSourceID="odsTALONARIOESTADO" Font-Size="Small">
                    <Columns>
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
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaHabilitacion" HeaderText="FechaHabilitacion"
                            SortExpression="FechaHabilitacion" Visible="False" />
                        <asp:BoundField DataField="Habilitados" HeaderText="Habilitados" SortExpression="Habilitados">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Asignados" HeaderText="Asignados" SortExpression="Asignados"
                            Visible="False" />
                    </Columns>
                </asp:GridView>
            </div>
            <div>
                <asp:Label ID="Label3" runat="server" Text="Proximo Talonario a Habilitar" CssClass="subtitulo-rol">
                </asp:Label>
            </div>
            <div>
                <asp:Label ID="olblidReciboTalonario" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="olblReciboTalonarioCodigo" runat="server" Text="" Font-Bold="true" Font-Size="Large">
                </asp:Label>
            </div>

            <div class="text-center">
                <asp:Button ID="obutReciboTalonarioHabilita" runat="server" Text="Habilita el Talonario"
                    CssClass="btn btn-success btn-basic" />
            </div>
            <div>
                <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="olblGestionDescripcion" runat="server" Text="" Font-Bold="true" ForeColor="Red">
                </asp:Label>
            </div>

            <div>
                <asp:Label ID="Label2" runat="server" Text="Ultimos talonarios habilitados " CssClass="subtitulo-rol">
                </asp:Label>

            </div>
            <div>
                <asp:SqlDataSource ID="odsReciboTalonarioUltimosHabilitadoTrae" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="reciboTalonarioUltimosHabilitadoTrae" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <asp:GridView ID="ogvReciboTalonarioUltimosHabilitadoTrae" runat="server" AutoGenerateColumns="False"
                    CssClass="table-cemmi" DataKeyNames="id" DataSourceID="odsReciboTalonarioUltimosHabilitadoTrae"
                    Font-Size="Small">
                    <Columns>
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
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FechaHabilitacion" HeaderText="FechaHabilitacion"
                            SortExpression="FechaHabilitacion">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Habilitados" HeaderText="Habilitados" SortExpression="Habilitados">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Asignados" HeaderText="Asignados" SortExpression="Asignados"
                            Visible="False" />
                    </Columns>
                </asp:GridView>
            </div>

        </asp:Panel>





    </asp:Content>