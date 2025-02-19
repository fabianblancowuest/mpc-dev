<%@ Page Title="Carga de Referidos para sorteo dia de la Madre 2024 - Mi primer casa." Language="VB" MasterPageFile="~/ventaWEB/MasterPage.master" AutoEventWireup="false" CodeFile="referidor.aspx.vb" Inherits="ventaWEB_referidor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/bootstrap-pachu.css" rel="stylesheet" />
    <link href="../css/bootstrap-datepicker.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2, user-scalable=no" />
    <%--  <meta http-equiv ="refresh" content ="5" />--%>


    <div>

        <asp:Label ID="Label1" runat="server" Text="Pagina de referidor de Mi Primer Casa S.A." Font-Size="Medium" Font-Bold="true"></asp:Label>

    </div>

    <asp:Panel ID="Panel1" runat="server">
        <asp:Button ID="obutInfo" runat="server" Text="Por qué recibo este enlace?" />
          <asp:Button ID="obutReferidoCompraNueva02" runat="server" Text="QUIERO COMPRAR !!!" ForeColor ="White" Font-Bold ="true" BackColor ="Green"  />
        <asp:Panel ID="PanelInfo" runat="server" Visible="false">
            <div>
                <asp:Label ID="Label4" runat="server" Text="Identificador invitación:" Font-Size="Small"></asp:Label>

                <asp:Label ID="olblReferidoID" runat="server" Text="" Font-Bold="true" Font-Size="Small"></asp:Label>

            </div>
            <div align="center">
                <asp:TextBox ID="otxtExplicacion" runat="server" Text="" Width="90%"></asp:TextBox>

            </div>
        </asp:Panel>
        <div>
            <asp:Label ID="Label3" runat="server" Text="Comprador Referidor:" Font-Size="Medium" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="olblReferidorTelefono" runat="server" Text="Telefono " Width="80px" Font-Size="Small"></asp:Label>

            <asp:TextBox ID="otxtReferidorTelefono" runat="server" Font-Bold="true" Font-Size="Small" Enabled="false" Text=""></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="olblReferidorDescripcion" runat="server" Text="Descripcion" Width="80px" Font-Size="Small"></asp:Label>

            <asp:TextBox ID="otxtReferidorDescripcion" runat="server" Width="260px" Font-Bold="true" Enabled="false" Font-Size="Small" Text=""></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="olblidOperador" runat="server" Font-Size="Small" Text="" Visible="false"></asp:Label>
            <asp:Label ID="olblOperadorReferencia" runat="server" Text="Vendedor referente de Mi Primer Casa:" Font-Size="Small"></asp:Label>
            <asp:Label ID="olblOperadorDescripcion" runat="server" Font-Bold="true" Font-Size="Small" Text=""></asp:Label>
        </div>
        <div>
            <asp:Label ID="olblError" runat="server" Text="" Font-Bold="true" Font-Size="small" ForeColor="Red"></asp:Label>

        </div>
        <div>
            <asp:Panel ID="PanelReferidos" runat="server">

                <asp:Label ID="Label2" runat="server" Text="MIS REFERIDOS" Font-Bold="true" Font-Size="Medium"></asp:Label>
                <asp:Button ID="obutReferidoAlta" runat="server" Text=" + Nuevo Referido" BackColor="Green" Height="30px" Width="140px" ForeColor="White" Font-Bold="true" />
                <br />
                <asp:SqlDataSource ID="odsReferidos" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="referidorReferidos" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="otxtReferidorTelefono" Name="referidorCelular" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="ogvReferidos" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsReferidos" EmptyDataText="No existen referidos cargados hasta el momento" Font-Size="X-Small">
                    <Columns>
                        <asp:BoundField DataField="idReferido" HeaderText="idReferido" InsertVisible="False" ReadOnly="True" SortExpression="idReferido" Visible="False" />
                        <asp:BoundField DataField="referidoCelular" HeaderText="Celular" SortExpression="referidoCelular" />
                        <asp:BoundField DataField="referidoRazonSocial" HeaderText="RazonSocial" SortExpression="referidoRazonSocial" />
                        <asp:CheckBoxField DataField="esVendedor" HeaderText="es  Vendedor" SortExpression="esVendedor" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CheckBoxField>
                        <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                        <asp:BoundField DataField="idReferidoVinculo" HeaderText="idReferidoVinculo" SortExpression="idReferidoVinculo" Visible="False" />
                        <asp:TemplateField HeaderText="Vinculo" SortExpression="referidoDescripcion">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("referidoDescripcion") %>'></asp:Label>
                           
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("fechaAlta") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="referidoID" HeaderText="ID" SortExpression="referidoID" Visible="False" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>
            <asp:Panel ID="PanelAlta" runat="server" Visible="false">
                <div>
                    <asp:Label ID="olblABMMensaje" runat="server" Text="Nuevo Referido"></asp:Label>
                </div>

                <div>
                    <asp:Label ID="Label5" runat="server" Text="Numero de telefono:" Font-Size="Medium"   Width ="30%"  ></asp:Label>
                    <asp:TextBox ID="otxtAltaReferidoTelefono" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label6" runat="server" Text="Apellido y Nombres" Font-Size="Medium"   Width ="30%" ></asp:Label>
                    <asp:TextBox ID="otxtAltaReferidoDescricion" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label7" runat="server" Text="Vinculo" Font-Size="Medium"   Width ="30%" ></asp:Label>
                    <asp:SqlDataSource ID="odsReferidoVinculo" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SELECT        TOP (200) idReferidoVinculo, referidoCodigo, referidoDescripcion, referidoEstado
FROM            referidoVinculo where idReferidoVinculo<>2
ORDER BY referidoCodigo"></asp:SqlDataSource>
                    <asp:DropDownList ID="oddlReferidoVinculo" runat="server" DataSourceID="odsReferidoVinculo" DataTextField="referidoDescripcion" DataValueField="idReferidoVinculo"></asp:DropDownList>
                </div>
                <div>
                    <asp:Label ID="olblValidacionMensaje" runat="server" Text="" ForeColor ="Blue"  Font-Bold="true" Font-Size="Small"  ></asp:Label>
                </div>
                <div>
                    <asp:Button ID="obutReferridoAltaConfirma" runat="server" Text="Confirma Alta" ForeColor ="White" Font-Bold ="true" BackColor ="Green"  />
                </div>
            </asp:Panel>
        </div>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server">
        <div>
          <asp:Label ID="Label8" runat="server" Text="MIS COMPRAS" Font-Bold="true" Font-Size="Medium"></asp:Label>
              <asp:Button ID="obutReferidoCompraNueva" runat="server" Text="NUEVA COMPRA" ForeColor ="White" Font-Bold ="true" BackColor ="Green"  />
             
        </div>
        <div>
            <asp:SqlDataSource ID="odsReferidoMisCompras" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="referidoMisCompras" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="otxtReferidorTelefono" Name="referidoCelular" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="ogvReferidoMisCompras" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsReferidoMisCompras" Font-Size="X-Small">
                <Columns>
                    <asp:BoundField DataField="Numero Billete" HeaderText="Numero Billete" SortExpression="Numero Billete">
                    <ItemStyle Font-Bold="True" Font-Size="Larger" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Premio" HeaderText="Premio" SortExpression="Premio" />
                    <asp:BoundField DataField="Monto" DataFormatString="{0:c}" HeaderText="Monto" SortExpression="Monto">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Operacion" HeaderText="Operacion" SortExpression="Operacion">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Fecha de venta" HeaderText="Fecha de venta" SortExpression="Fecha de venta">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Bonificado" HeaderText="Bonificado" ReadOnly="True" SortExpression="Bonificado">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>

    </asp:Panel>

</asp:Content>

