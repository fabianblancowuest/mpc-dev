<%@ Page Title="" Language="VB" MasterPageFile="~/ventaWEB/sorteo.master" AutoEventWireup="false" CodeFile="sorteoNumero.aspx.vb" Inherits="ventaWEB_sorteoNumero" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



       <asp:Panel ID="PanelNumeros" runat="server">
            <div>
                <asp:TextBox ID="otxtCantidad" runat="server" Text="50" Enabled="false" Visible="false"></asp:TextBox>
                <asp:TextBox ID="otxtNumeroDesde" runat="server" Text="0" Enabled="false" Visible="false"></asp:TextBox>
                <asp:TextBox ID="olblIdSorteo" runat="server" Text="1" Enabled="false" Visible="false"></asp:TextBox>

            </div>

            <div align="center">

                <asp:Label ID="olblBilletesSeleccionadosCantidad" runat="server" Text="" ForeColor="Blue" Font-Bold="true" Visible="true" Font-Size="Small"></asp:Label>

                <asp:Label ID="olblBilletesSeleccionados" runat="server" Text="" ForeColor="Blue" Font-Bold="true" Visible="true" Font-Size="Small"></asp:Label>
                <p>
                    <asp:Label ID="olblValidacionMensajeError" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Small"></asp:Label>
                    <asp:Label ID="olblGestionCodigo" runat="server" Text="" ForeColor="Red" Font-Bold="true" Visible="false" Font-Size="Small"></asp:Label>
                    <p>
                        <asp:Label ID="olblGestionDescripcion" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Small"></asp:Label>

                        <asp:SqlDataSource ID="odssorteoTalonVendedorVenta" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoTalonVendedorVentaWEB" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter SessionField="idOperador" Name="idOperador" Type="Int32"></asp:SessionParameter>
                                <asp:ControlParameter ControlID="olblIdSorteo" Name="idSorteo" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="otxtCantidad" Name="cantidadVisualiza" PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="otxtNumeroDesde" PropertyName="Text" Name="numeroDesde" Type="Int32"></asp:ControlParameter>
                                <asp:SessionParameter SessionField="Session" Name="sorteoTalonSession" Type="String"></asp:SessionParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="ogvSorteoTalonVendedorVenta" runat="server" AutoGenerateColumns="False" DataKeyNames="idSorteoTalon" DataSourceID="odssorteoTalonVendedorVenta" Width="90%" CssClass="table-cemmi">
                            <Columns>
                                <asp:TemplateField HeaderText="idSorteoTalon" InsertVisible="False" SortExpression="idSorteoTalon" Visible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idSorteoTalon") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="olblIdSorteoTalon" runat="server" Text='<%# Bind("idSorteoTalon") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="sorteoTalonNumero" HeaderText="Números Disponibles" SortExpression="sorteoTalonNumero">
                                    <HeaderStyle Font-Size="XX-Large" HorizontalAlign="Center" />
                                    <ItemStyle Font-Bold="True" Font-Size="XX-Large" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Seleccione su número <br/><b> ⬇⬇⬇ </b>" SortExpression="sorteoTalonTomado">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="ochSorteoTalonTomado" runat="server" Checked='<%# Bind("sorteoTalonTomado") %>' Enabled="True" AutoPostBack="true" OnCheckedChanged="talonVendedorToma" />
                                    </ItemTemplate>
                                    <HeaderStyle Font-Size="XX-Large" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
            </div>

        </asp:Panel>

</asp:Content>

