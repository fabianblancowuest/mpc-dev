<%@ Page Title="Conciliacion de transferencias a entidades de recaudacion electronica"
    MaintainScrollPositionOnPostback="true" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false"
    CodeFile="sorteoTransferenciaConciliacion.aspx.vb" Inherits="Administracion_sorteoTransferenciaConciliacion" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

        <div>
            <h1 class="titulo-rol">Conciliacion de pagos electronicos de ventas de billetes sorteo dia de la Madre 2024
            </h1>
            <h3 class="subtitulo-rol">Comprobantes pendientes de conciliacion</h3>
        </div>
        <div>
            <asp:Label ID="olblMensajeValidacion" runat="server" Text="" ForeColor="Blue"></asp:Label>
        </div>
        <asp:Panel ID="PanelNoConcilados" runat="server">
            <div>
                <asp:SqlDataSource ID="odsoperadorSorteoODDL" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="operadorSorteoODDL"
                    SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:DropDownList ID="oddloperadorSorteoODDL" runat="server" DataSourceID="odsoperadorSorteoODDL"
                    DataTextField="operadorDescripcion" DataValueField="idOperador" AutoPostBack="True">
                </asp:DropDownList>

                <div>
                    <asp:Label ID="olblIdOperadorConciliado" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="Label10" runat="server" Text="Resto" Visible="false"></asp:Label>
                    <asp:Label ID="olblResto" runat="server" Text="" Visible="false"></asp:Label>
                </div>
                <asp:SqlDataSource ID="odssorteoTransferenciaNoConciliados" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                    SelectCommand="sorteoTransferenciaNoConciliados" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="oddloperadorSorteoODDL" Name="idOperador"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvsorteoTransferenciaNoConciliados" runat="server" AutoGenerateColumns="False"
                    CssClass="table-cemmi"
                    DataKeyNames="idSorteoTalonCobranza,transferenciaImagen,efectivoMonto,transferenciaMonto,operadorDescripcion,transferenciaNumero,comprador,bonos"
                    DataSourceID="odssorteoTransferenciaNoConciliados">
                    <Columns>
                        <asp:CommandField SelectText="Conciliar" ShowSelectButton="True" />
                        <asp:BoundField DataField="idSorteoTalonCobranza" HeaderText="Cobranza" InsertVisible="False"
                            ReadOnly="True" SortExpression="idSorteoTalonCobranza">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fechaCobranza" HeaderText="Fecha Cobranza"
                            SortExpression="fechaCobranza">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador"
                            Visible="False" />
                        <asp:BoundField DataField="operadorDescripcion" HeaderText="Operador"
                            SortExpression="operadorDescripcion" />
                        <asp:BoundField DataField="efectivoMonto" HeaderText="Monto Efectivo"
                            SortExpression="efectivoMonto" DataFormatString="{0:c}">
                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="transferenciaMonto" HeaderText="Monto Transferencia"
                            SortExpression="transferenciaMonto" DataFormatString="{0:c}">
                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="transferenciaNumero" HeaderText="Numero Transf."
                            SortExpression="transferenciaNumero" />
                        <asp:BoundField DataField="transferenciaImagen" HeaderText="Imagen" Visible="False"
                            SortExpression="transferenciaImagen" />
                        <asp:BoundField DataField="comprador" HeaderText="comprador" Visible="False" />
                        <asp:BoundField DataField="bonos" HeaderText="bonos" Visible="False"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>
        <asp:Panel ID="PanelConciliacion" runat="server" Visible="false">
            <div>
                <h4>Conciliacion de transferencia
                    <asp:Button ID="obutVolver" runat="server" Text="Volver" BackColor="Green" ForeColor="White"
                        Font-Bold="true" />
                </h4>
            </div>
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell Width="40%" BackColor="WhiteSmoke">



                        <div>
                            <asp:Label ID="Label1" runat="server" Text="Cobranza:"></asp:Label>
                            <asp:Label ID="olblidSorteoTalonCobranza" runat="server" Text="" Font-Bold="true">
                            </asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label2" runat="server" Text="Monto Transferencia:"></asp:Label>
                            <asp:Label ID="olbltransferenciaMonto" runat="server" Text="" Font-Bold="true"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label8" runat="server" Text="Monto Efectivo:"></asp:Label>
                            <asp:Label ID="olblEfectivoMonto" runat="server" Text="" Font-Bold="true"></asp:Label>
                        </div>

                        <div>
                            <asp:Label ID="Label3" runat="server" Text="Vendedor :"></asp:Label>
                            <asp:Label ID="olbloperadorDescripcion" runat="server" Text="" Font-Bold="true"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label4" runat="server" Text="Numero de transferencia :"></asp:Label>
                            <asp:Label ID="olbltransferenciaNumero" runat="server" Text="" Font-Bold="true"></asp:Label>
                        </div>

                        <div>
                            <asp:Label ID="Label5" runat="server" Text="Comprador :"></asp:Label>
                            <asp:Label ID="olblcomprador" runat="server" Text="" Font-Bold="true"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label6" runat="server" Text="Billetes :"></asp:Label>
                            <asp:Label ID="olblbonos" runat="server" Text="" Font-Bold="true"></asp:Label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell Width="40%" VerticalAlign="Top" BackColor="SteelBlue">
                        <asp:Label ID="Label7" runat="server" Text="Conciliacion" ForeColor="White" Font-Bold="true">
                        </asp:Label>
                        <br />
                        <asp:Label ID="Label9" runat="server" Text="Seleccione Entidad recaudadora " ForeColor="White"
                            Font-Bold="true"></asp:Label>
                        <br />
                        <asp:SqlDataSource ID="odsconciliacionCuentasODDL" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="conciliacionCuentasODDL" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="oddlconciliacionCuentasODDL" runat="server"
                            DataSourceID="odsconciliacionCuentasODDL" DataTextField="plancuentaDescripcion"
                            DataValueField="idPlanCuenta" AutoPostBack="True"></asp:DropDownList>
                        <br />
                        <br />

                        <asp:Button ID="obutConcilia" runat="server" Text="Confirma Conciliacion" BackColor="Green"
                            ForeColor="White" Font-Bold="true" Visible="true" />

                        <asp:Button ID="obutDiferencia" runat="server" Text="Diferencia detectada" BackColor="Red"
                            ForeColor="White" Font-Bold="true" Visible="true" />

                        <br />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <div>
                <asp:Image ID="imgTransferencia" runat="server" ImageUrl="~/images/background.jpg" Width="40%"
                    Height="30%" />
            </div>


            <div align="center">


            </div>

        </asp:Panel>
    </asp:Content>