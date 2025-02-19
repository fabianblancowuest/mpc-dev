<%@ Control Language="VB" AutoEventWireup="false" CodeFile="barrioLoteRecibo.ascx.vb" Inherits="sitioWEB_barrioLoteRecibo" %>
<asp:Panel ID="PanelRecibos" runat="server">
    <div>
         <asp:Label ID="olblIdBarrioLote" runat="server" Text="" Visible="true"></asp:Label>
         <asp:Label ID="olblBarrioLoteReciboSuma" runat="server" Text="" Visible="true"></asp:Label>

        <asp:Label ID="Label1" runat="server" Text="Recibos a cuenta del presente Lote"></asp:Label>
    </div>
    <div>
        <asp:SqlDataSource ID="odsbarrioLoteReciboTrae" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioLoteReciboTrae" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="olblIdBarrioLote" Name="idBarrioLote" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ogvbarrioLoteReciboTrae" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsbarrioLoteReciboTrae" EmptyDataText="El lote no posee pagos a cuenta" Font-Size="Small">
            <Columns>
                <asp:BoundField DataField="recibo" HeaderText="recibo" ReadOnly="True" SortExpression="recibo" />
                <asp:BoundField DataField="Confecciona" HeaderText="Confecciona" SortExpression="Confecciona" />
                <asp:BoundField DataField="fechaConfeccion" HeaderText="fechaConfeccion" SortExpression="fechaConfeccion">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="reciboMonto" HeaderText="reciboMonto" SortExpression="reciboMonto">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="conceptoDescripcion" HeaderText="conceptoDescripcion" SortExpression="conceptoDescripcion" />
                <asp:BoundField DataField="asentado" HeaderText="asentado" ReadOnly="True" SortExpression="asentado">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>


</asp:Panel>
