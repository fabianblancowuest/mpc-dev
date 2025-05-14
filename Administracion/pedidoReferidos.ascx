<%@ Control Language="VB" AutoEventWireup="false" CodeFile="pedidoReferidos.ascx.vb" Inherits="Administracion_pedidoReferido" %>
<asp:SqlDataSource ID="odsPedidoReferido" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="pedidoReferidosTraer" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<div>
    <asp:Label ID="Label1" runat="server" Text="Frases de pedido de referidos que  se buscan en la transcripción"></asp:Label>

    <asp:Button ID="obutMostrar" runat="server" Text="Mostrar frases de pedido de referidos." />
</div>
<div>
    <asp:GridView ID="ogvPedidoReferido" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsPedidoReferido" Visible="false">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="pedidoReferido" HeaderText="Frases de pedido de referidos." SortExpression="pedidoReferido" />
            <asp:CheckBoxField DataField="estado" HeaderText="estado" SortExpression="estado" Visible="False" />
        </Columns>
    </asp:GridView>
</div>