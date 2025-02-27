<%@ Page Title="Autorizacion de Gastos a Rendir " MaintainScrollPositionOnPostback="true" Language="VB"
    MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="garAutoriza.aspx.vb"
    Inherits="Administracion_garAutoriza" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <h1 class="titulo-rol">
            <asp:Label ID="Label1" runat="server" Text="Autorizacion de GASTO a RENDIR"></asp:Label>
        </h1>
        <asp:Panel ID="PanelSelecciona" runat="server">
            <asp:RadioButtonList ID="orbOpcion" runat="server" AutoPostBack="True">
                <asp:ListItem Selected="True" Value="0">Pendientes</asp:ListItem>
                <asp:ListItem Value="1">Autorizados</asp:ListItem>
                <asp:ListItem Value="2">Rechazados</asp:ListItem>
            </asp:RadioButtonList>

            <asp:SqlDataSource ID="odsGARAutoriza" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                SelectCommand="garAutoriza" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="orbOpcion" Name="garEstado" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>


            <div class="contenedor-responsive">
                <asp:GridView ID="ogvGARAutoriza" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                    DataKeyNames="idGar,garSolicitudDescripcion,garSolicitudMonto,operadorDescripcion"
                    DataSourceID="odsGARAutoriza" EmptyDataText="Su seleccion no ha recuperado datos. "
                    Font-Size="X-Small">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="idGar" HeaderText="idGar" InsertVisible="False"
                            SortExpression="idGar" Visible="False" />
                        <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador"
                            Visible="False" />
                        <asp:BoundField DataField="operadorDescripcion" HeaderText="Operador"
                            SortExpression="operadorDescripcion" />
                        <asp:BoundField DataField="garSolicitudFecha" HeaderText="Fecha Solicitud"
                            SortExpression="garSolicitudFecha" />
                        <asp:BoundField DataField="garSolicitudDescripcion" HeaderText="Descripcion Pedido"
                            SortExpression="garSolicitudDescripcion" />
                        <asp:BoundField DataField="garSolicitudMonto" HeaderText="Monto solicitud"
                            SortExpression="garSolicitudMonto" />
                        <asp:BoundField DataField="idOperadorAutoriza" HeaderText="idOperadorAutoriza"
                            SortExpression="idOperadorAutoriza" Visible="False" />
                        <asp:BoundField DataField="operadorAutoriza" HeaderText="Autoriza"
                            SortExpression="operadorAutoriza" />
                        <asp:BoundField DataField="garAutorizacionFecha" HeaderText="Fecha Autorizacion"
                            SortExpression="garAutorizacionFecha" />
                        <asp:BoundField DataField="garAutorizacionMonto" HeaderText="Monto Autorizado"
                            SortExpression="garAutorizacionMonto" />
                        <asp:BoundField DataField="MontoRendido" HeaderText="Monto Rendido"
                            SortExpression="MontoRendido" />
                        <asp:BoundField DataField="SaldoGar" HeaderText="Saldo GAR" SortExpression="SaldoGar" />
                        <asp:BoundField DataField="idAsientoCabecera" HeaderText="Asiento"
                            SortExpression="idAsientoCabecera" />
                        <asp:BoundField DataField="garEstado" HeaderText="Estado GAR" SortExpression="garEstado" />
                        <asp:BoundField DataField="garEstadoDescripcion" HeaderText="GAR"
                            SortExpression="garEstadoDescripcion" />
                        <asp:BoundField DataField="idOperadorCaja" HeaderText="idOperadorCaja"
                            SortExpression="idOperadorCaja" Visible="False" />
                        <asp:BoundField DataField="operadorCaja" HeaderText="Operador Caja"
                            SortExpression="operadorCaja" />
                    </Columns>
                </asp:GridView>
            </div>



        </asp:Panel>

        <asp:Panel ID="PanelAutoriza" runat="server" Visible="false">

            <div>
                <asp:Label ID="Label2" runat="server" Text="El operador :"></asp:Label>
                <asp:Label ID="olblOperadorSolicitante" runat="server" Text=""></asp:Label>
            </div>

            <div>
                <asp:Label ID="Label3" runat="server" Text="Solicitud:"></asp:Label>
                <asp:Label ID="olblIdGar" runat="server" Text="" Font-Bold="true"></asp:Label>


                <br />
                <asp:Label ID="olblGarSolicitudDescripcion" runat="server" Text="" Font-Bold="true"></asp:Label>
            </div>
            <div>
                <br />
                <asp:Label ID="Label4" runat="server" Text="Monto Solicitado:"></asp:Label>

                <asp:Label ID="olblGarSolicitudMonto" runat="server" Text="" Font-Bold="true"></asp:Label>
            </div>

            <div>
                <br />
                <asp:Label ID="Label5" runat="server" Text="Monto Autorizado:"></asp:Label>

                <asp:TextBox ID="otxtGarAutorizaMonto" runat="server"></asp:TextBox>
            </div>


            <br />
            <br />
            <div align="center">
                <asp:RadioButtonList ID="orbOpciones" runat="server" AutoPostBack="True">
                    <asp:ListItem Selected="True" Value="0">Seleccione una opcion y luego confirme </asp:ListItem>
                    <asp:ListItem Value="1">Autoriza GAR</asp:ListItem>
                    <asp:ListItem Value="2">Rechaza GAR</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <asp:Panel ID="PanelRechazo" runat="server" Visible="false">

                <div align="center">
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="Indique el motivo del Rechazo"></asp:Label>
                    <br />
                    <asp:TextBox ID="otxtGarRechazo" runat="server" Width="80%" Height="200px"></asp:TextBox>
                </div>

            </asp:Panel>


            <div align="center">
                <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="olblGestionDescripcion" runat="server" Text="" Visible="true" Font-Bold="true"
                    ForeColor="Red"></asp:Label>

            </div>
            <div align="center">
                <br />
                <asp:Label ID="olblMensajePrevio" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <asp:Button ID="obutGarAutorizacionConfirma" runat="server" Text="Confirma acción"
                    CssClass="btn-success" Visible="false" />
                <br />
                <br />
                <asp:Button ID="obutGarAutorizacionAbandona" runat="server" Text="Abandona accion" CssClass="btn-danger"
                    Visible="false" />


            </div>



        </asp:Panel>

    </asp:Content>