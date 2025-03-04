<%@ Page Title="Pago por Caja de Gastos a Rendir" Language="VB" MasterPageFile="~/master/p.master"
    AutoEventWireup="false" CodeFile="garPago.aspx.vb" Inherits="Administracion_garPago" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <asp:Panel ID="PanelGARListado" runat="server">

            <h1 class="titulo-rol">
                <asp:Label ID="Label1" runat="server" Text="Pago por Caja de GASTOS A RENDIR"></asp:Label>
            </h1>
            <h2 class="subtitulo-rol">
                <asp:Label ID="Label2" runat="server" Text="Gastos a Rendir Autorizados "></asp:Label>
            </h2>

            <div class="my-4 fuente-grande">
                <asp:RadioButtonList ID="orbOpciones" runat="server" AutoPostBack="True">
                    <asp:ListItem Selected="True" Value="1">Pendientes de pago</asp:ListItem>
                    <asp:ListItem Value="2">Pagados</asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <div>
                <asp:SqlDataSource ID="odsGarPago" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="garPago" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="orbOpciones" Name="opcion" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvGarPago" runat="server" AutoGenerateColumns="False" DataSourceID="odsGarPago"
                    CssClass="table-cemmi" EmptyDataText="La consulta realizada no recupera datos." Font-Size="X-Small"
                    DataKeyNames="idgar,operadorDescripcion,garSolicitudDescripcion,garAutorizacionMonto">
                    <Columns>
                        <asp:CommandField SelectText="Procesa" ShowSelectButton="True" />
                        <asp:BoundField DataField="idgar" HeaderText="idgar" InsertVisible="False" ReadOnly="True"
                            SortExpression="idgar" Visible="true" />
                        <asp:BoundField DataField="operadorDescripcion" HeaderText="Operador"
                            SortExpression="operadorDescripcion" />
                        <asp:BoundField DataField="garSolicitudFecha" HeaderText="Fecha Solicitud"
                            SortExpression="garSolicitudFecha" />
                        <asp:BoundField DataField="garSolicitudDescripcion" HeaderText="Descripcion"
                            SortExpression="garSolicitudDescripcion" />
                        <asp:BoundField DataField="garSolicitudMonto" HeaderText="garSolicitudMonto"
                            SortExpression="garSolicitudMonto" Visible="False" />
                        <asp:BoundField DataField="operadorAutoriza" HeaderText="Autoriza" ReadOnly="True"
                            SortExpression="operadorAutoriza" />
                        <asp:BoundField DataField="garAutorizacionFecha" HeaderText="Fecha Autoriza"
                            SortExpression="garAutorizacionFecha" />
                        <asp:BoundField DataField="garAutorizacionMonto" HeaderText="Monto autorizado"
                            SortExpression="garAutorizacionMonto" DataFormatString="{0:c}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MontoRendido" HeaderText="Monto Rendido" ReadOnly="True"
                            SortExpression="MontoRendido" DataFormatString="{0:c}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SaldoGar" HeaderText="Saldo GAR" ReadOnly="True"
                            SortExpression="SaldoGar" DataFormatString="{0:c}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Transferencias" HeaderText="Transferencias" SortExpression="Transferencias" />
                        <asp:BoundField DataField="DevolucionOperador" HeaderText="Devolucion a Operador" SortExpression="DevolucionOperador" />
                        <asp:BoundField DataField="DevolucionEfectivo" HeaderText="Devolucion Efectivo" SortExpression="DevolucionEfectivo" />
                        <asp:BoundField DataField="operadorCaja" HeaderText="operador Caja" ReadOnly="True"
                            SortExpression="operadorCaja" />
                        <asp:BoundField DataField="idAsientoCabecera" HeaderText="Asiento"
                            SortExpression="idAsientoCabecera" />
                        <asp:BoundField DataField="garAsientoFecha" HeaderText="Fecha Asiento"
                            SortExpression="garAsientoFecha" />
                        <asp:BoundField DataField="garEstado" HeaderText="Estado" SortExpression="garEstado"
                            Visible="False" />
                        <asp:BoundField DataField="garEstadoTexto" HeaderText="Estado Texto" ReadOnly="True"
                            SortExpression="garEstadoTexto" Visible="False" />
                        <asp:BoundField DataField="garEstadoDescripcion" HeaderText="Estado Descripcion"
                            SortExpression="garEstadoDescripcion" />
                    </Columns>
                </asp:GridView>
            </div>

        </asp:Panel>

        <asp:Panel ID="PanelGARAlta" runat="server" Visible="false">

            <div>

                <asp:Label ID="Label3" runat="server" Text="Pago de Gasto a Rendir.        " Font-Bold="true"
                    Font-Size="Larger"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="(" Font-Bold="true" Font-Size="Larger"></asp:Label>
                <asp:Label ID="olblidgar" runat="server" Text="" Font-Bold="true" Font-Size="Larger"></asp:Label>
                <asp:Label ID="Label8" runat="server" Text=")" Font-Bold="true" Font-Size="Larger"></asp:Label>
                <br />
                <br />
            </div>

            <div>
                <asp:Label ID="Label4" runat="server" Text="Operador a entregar el dinero:"></asp:Label>
                <asp:Label ID="olblOperadorDescripcion" runat="server" Text="" Font-Bold="true"></asp:Label>
                <br />
                <br />
            </div>
            <div>
                <asp:Label ID="Label5" runat="server" Text="Importe a entregar:"></asp:Label>
                <asp:Label ID="olblgarAutorizacionMonto" runat="server" Text="" Font-Bold="true"></asp:Label>
                <br />
                <br />
            </div>
            <div>
                <asp:Label ID="Label6" runat="server" Text="Concepto:"></asp:Label>
                <asp:Label ID="olblgarSolicitudDescripcion" runat="server" Text="" Font-Bold="true"></asp:Label>
            </div>
            <div>
                <br />
                <br />
                <asp:Button ID="obutApruebaEfectivo" runat="server" Text="Aprueba salida Efectivo "
                    CssClass="btn-basic" />
                <br />
                <br />

                <asp:Button ID="obutRetorna" runat="server" Text="Retorna" CssClass="btn-basic" />

            </div>

            <div>
                <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="olblGestionDescripcion" runat="server" Text="" Font-Bold="true" ForeColor="Red">
                </asp:Label>
                <asp:Label ID="olblIdAsientoCabecera" runat="server" Text="" Visible="false"></asp:Label>
            </div>


        </asp:Panel>
    </asp:Content>