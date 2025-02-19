<%@ Page Title="" Language="VB" MasterPageFile="~/ventaWEB/sorteo.master" AutoEventWireup="false" CodeFile="sorteoPremio.aspx.vb" Inherits="ventaWEB_sorteoPremio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:Panel ID="PanelPremio" runat="server" Visible="false">
            <div align="center">
                <asp:Label ID="Label6" runat="server" Text="Complete cada talón con el premio y luego confirme " Font-Size="Small" Font-Bold="true"></asp:Label>

            </div>

            <div>
                <asp:SqlDataSource ID="odsSorteoPremio" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SORTEOPREMIOTraeroddlDescending" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                <asp:SqlDataSource ID="odsSorteoVendedorTalonSeleccionado" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SorteoVendedorTalonSeleccionadoWEB" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="sorteoTalonSession" SessionField="Session" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvSorteoVendedorTalonSeleccionado" runat="server" AutoGenerateColumns="False" DataKeyNames="idSorteoTalon" DataSourceID="odsSorteoVendedorTalonSeleccionado" CssClass="table-cemmi" Font-Size="Small">
                    <Columns>
                        <asp:TemplateField HeaderText="idSorteoTalon" InsertVisible="False" SortExpression="idSorteoTalon" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="olblIdSorteoTalon" runat="server" Text='<%# Bind("idSorteoTalon") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="sorteoTalonNumero" HeaderText="NUMERO" SortExpression="sorteoTalonNumero">
                            <ControlStyle Width="20%" />
                            <ItemStyle Font-Bold="True" Font-Size="Larger" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="P R E M I O S" SortExpression="idSorteoPremio">
                            <ItemTemplate>
                                <asp:DropDownList ID="oddlPremio" runat="server" DataSourceID="odsSorteoPremio" DataTextField="sorteoPremioDescripcion" DataValueField="idSorteoPremio" SelectedValue='<%# Bind("idSorteoPremio")%>' AutoPostBack="True" Font-Size="Large" Width="80%" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <ControlStyle Width="100%" />
                            <HeaderStyle Width="60%" />
                            <ItemStyle Width="60%" HorizontalAlign="Center" Font-Size="X-Small" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Precio" HeaderText="PRECIO" ReadOnly="True" SortExpression="sorteoTalonMonto" DataFormatString="{0:c}">
                            <ControlStyle Width="20%" />
                            <ItemStyle HorizontalAlign="Right" Font-Bold="True" Font-Size="Small" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>

            <div align="center">
                <asp:Label ID="Label7" runat="server" Text="Cantidad de talones seleccionados : " Font-Bold="true" Font-Size="Small"></asp:Label>
                <asp:Label ID="olblCantidadTotal" runat="server" Text="0" Font-Bold="true" Font-Size="Small" Width="20%"></asp:Label>
            </div>


            <div align="center">
                <asp:Label ID="Label8" runat="server" Text="Importe de los talones seleccionados : " Font-Bold="true" Font-Size="Small"></asp:Label>
                <asp:Label ID="Label9" runat="server" Text="$" Font-Bold="true" Font-Size="Small"></asp:Label>
                <asp:Label ID="olblMontoTotal" runat="server" Text="0" Font-Bold="true" Font-Size="Small" Width="20%"></asp:Label>

                <div>
                    <asp:Label ID="olblValidacionMensajeErrores" runat="server" Text="0" Font-Bold="true" ForeColor="Red" Visible="false" Font-Size="Small"></asp:Label>
                    <asp:Label ID="olblValidacionMensajeErrorPremio" runat="server" Text="" Font-Bold="true" ForeColor="Red" Font-Size="Small"></asp:Label>
                </div>

                <div align="center">
                    <asp:TextBox ID="otxtLeyendaPago" runat="server" Text="Usted ha conformado su compra. Si desea agregar más billetes o quitar billetes antes de confirmar la operacion , puede hacerlo presionando los botones NUMEROS y PREMIOS hasta que sea de su entera satisfaccion el monto de su compra. Pulse PAGAR para comenzar el proceso de Pago" TextMode="MultiLine" Width="100%" Height="90px" BackColor="White" Enabled="false" Font-Size="Small" Visible="false"></asp:TextBox>

                    <asp:Button ID="obutRealizarPago" runat="server" Text="PAGAR" BackColor="Green" Font-Bold="true" ForeColor="White" Font-Size="XX-Large" Width="90%" Height="80px" Visible="false" />
                </div>





            </div>


        </asp:Panel>


</asp:Content>

