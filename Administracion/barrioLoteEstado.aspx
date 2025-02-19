<%@ Page Language="VB" AutoEventWireup="false" CodeFile="barrioLoteEstado.aspx.vb" Inherits="Administracion_barrioLoteEstado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">



        <div>
            <asp:Label ID="olblIdLoteVenta" runat="server" Text="1" Visible="false"></asp:Label>
        </div>


        <asp:Panel ID="PanelGrlla" runat="server">
            <div>
                <asp:Button ID="obutGrabarEstado" runat="server" Text="Actualizar" />
            </div>

            <div>
                <asp:Label ID="olblValidacionMensajeError" runat="server" Text=""></asp:Label>
            </div>
            <asp:SqlDataSource ID="odsLoteVentaEstado" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="loteVentaEstadoLote" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblIdLoteVenta" Name="idLoteVenta" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvloteVentaEstado" runat="server" AutoGenerateColumns="False" DataSourceID="odsLoteVentaEstado" CssClass="table-cemmi" Font-Size="Small" Width="60%">
                <Columns>
                    <asp:CommandField SelectText="MOVIMIENTOS" ShowSelectButton="True" />
                    <asp:TemplateField HeaderText="idLoteVentaEstado" InsertVisible="False" SortExpression="idLoteVentaEstado" Visible="False">

                        <ItemTemplate>
                            <asp:Label ID="idLoteVentaEstado" runat="server" Text='<%# Bind("idLoteVentaEstado") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="idloteVenta" HeaderText="idloteVenta" SortExpression="idloteVenta" Visible="False" />
                    <asp:BoundField DataField="barrioLoteVentaEstadoCodigo" HeaderText="Codigo" SortExpression="barrioLoteVentaEstadoCodigo" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="barrioLoteVentaEstadoDescripcion" HeaderText="Estado " SortExpression="barrioLoteVentaEstadoDescripcion" />
                    <asp:TemplateField HeaderText="idBarrioLoteVentaEstado" SortExpression="idBarrioLoteVentaEstado" Visible="False">

                        <ItemTemplate>
                            <asp:Label ID="idBarrioLoteVentaEstado" runat="server" Text='<%# Bind("idBarrioLoteVentaEstado") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="loteVentaEstado" SortExpression="loteVentaEstado">
                        <ItemTemplate>
                            <asp:CheckBox ID="ochLoteVentaEstado" runat="server" Checked='<%# Bind("loteVentaEstado") %>' />
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center" />

                    </asp:TemplateField>
                    <asp:BoundField DataField="fum" HeaderText="Fecha Ult. Mod." SortExpression="fum" />
                    <asp:BoundField DataField="operadorDescripcion" HeaderText="Ultimo Operador" SortExpression="operadorDescripcion" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
        <asp:Panel ID="PanelMovimientos" runat="server" Visible ="false">

            <div>


            </div>




        </asp:Panel>
    </form>
</body>
</html>
